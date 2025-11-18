<?php
/**
 * Cronjob: Abonelik Yenileme Hatırlatmaları
 * 
 * Kullanım:
 * Her gün saat 08:00'de çalıştırılmalı
 * 0 8 * * * php /home/user/nextify/admin/controller/cron-reminders.php
 */

include 'config.php';
date_default_timezone_set('Europe/Istanbul');

// Log dosyasını aç
$log_file = '../logs/cron-reminders.log';
if (!file_exists('../logs')) {
    mkdir('../logs', 0755, true);
}

function logCron($message) {
    global $log_file;
    $timestamp = date('Y-m-d H:i:s');
    $log_message = "[$timestamp] $message\n";
    file_put_contents($log_file, $log_message, FILE_APPEND);
}

logCron("=== Cronjob Başladı ===");

try {
    // Gönderilmemiş hatırlatmaları al
    $hatirlatmalar = $db->prepare("
        SELECT yh.*, a.abone_sonraki_odeme_tarih, u.urun_baslik, 
               uy.uye_ad, uy.uye_soyad, uy.uye_mail, uy.uye_tel,
               ao.odeme_tutar, ao.odeme_tur
        FROM yenileme_hatirlatmalar yh
        JOIN abonelikler a ON yh.hatirlatma_abone = a.abone_id
        JOIN urunler u ON a.abone_urun = u.urun_id
        JOIN uye uy ON yh.hatirlatma_uye = uy.uye_id
        JOIN abonelik_odemeler ao ON a.abone_id = ao.odeme_abone AND ao.odeme_durum = 'bekleme'
        WHERE yh.hatirlatma_gonderildi = 0
        AND DATE(a.abone_sonraki_odeme_tarih) = DATE_ADD(CURDATE(), INTERVAL yh.hatirlatma_gun DAY)
    ");
    
    $hatirlatmalar->execute();
    $sonuclar = $hatirlatmalar->fetchAll(PDO::FETCH_ASSOC);
    
    logCron("Gönderilecek hatırlatma sayısı: " . count($sonuclar));
    
    foreach ($sonuclar as $hatirlatma) {
        $gun = $hatirlatma['hatirlatma_gun'];
        $uye_ad = htmlspecialchars($hatirlatma['uye_ad']);
        $uye_soyad = htmlspecialchars($hatirlatma['uye_soyad']);
        $uye_mail = htmlspecialchars($hatirlatma['uye_mail']);
        $paket_adi = htmlspecialchars($hatirlatma['urun_baslik']);
        $tur = $hatirlatma['odeme_tur'] === 'yillik' ? 'Yıllık' : 'Aylık';
        $tutar = number_format($hatirlatma['odeme_tutar'], 2, ',', '.');
        $tarih = date('d.m.Y', strtotime($hatirlatma['abone_sonraki_odeme_tarih']));
        
        // E-mail Mesajı Oluştur
        $konu = "$gun Gün Kala: $paket_adi Aboneliğiniz Yenilenecek";
        
        $mesaj = "
            <html>
            <head>
                <meta charset='UTF-8'>
                <style>
                    body { font-family: Arial, sans-serif; color: #333; }
                    .container { max-width: 600px; margin: 0 auto; padding: 20px; }
                    .header { background-color: #007bff; color: white; padding: 20px; border-radius: 5px; }
                    .content { background-color: #f9f9f9; padding: 20px; margin: 20px 0; border-radius: 5px; }
                    .details { background-color: #ffffff; padding: 15px; border-left: 4px solid #007bff; margin: 15px 0; }
                    .button { text-align: center; margin: 20px 0; }
                    .button a { background-color: #007bff; color: white; padding: 12px 30px; text-decoration: none; border-radius: 5px; }
                    .footer { text-align: center; font-size: 12px; color: #999; margin-top: 30px; }
                </style>
            </head>
            <body>
                <div class='container'>
                    <div class='header'>
                        <h2>Abonelik Yenileme Hatırlatması</h2>
                    </div>
                    
                    <div class='content'>
                        <p>Merhaba sayın <strong>$uye_ad $uye_soyad</strong>,</p>
                        
                        <p>Abone olduğunuz <strong>$paket_adi</strong> paketiniz <strong>$gun gün</strong> sonra yenilenecektir.</p>
                        
                        <div class='details'>
                            <p><strong>Abonelik Detayları:</strong></p>
                            <ul>
                                <li><strong>Paket:</strong> $paket_adi</li>
                                <li><strong>Tür:</strong> $tur</li>
                                <li><strong>Tutar:</strong> $tutar ₺</li>
                                <li><strong>Yenileme Tarihi:</strong> $tarih</li>
                            </ul>
                        </div>
                        
                        <p>Aboneliğinizi yönetmek için aşağıdaki butona tıklayınız:</p>
                        
                        <div class='button'>
                            <a href='{site_url}hesabim/abonelikler'>Aboneliklerim</a>
                        </div>
                        
                        <p>Herhangi bir sorunuz olması durumunda bizimle iletişime geçmekten çekinmeyin.</p>
                    </div>
                    
                    <div class='footer'>
                        <p>Bu e-posta otomatik olarak gönderilmiştir. Lütfen yanıtlamayınız.</p>
                    </div>
                </div>
            </body>
            </html>
        ";
        
        // Site URL'sini ayarlardan al
        $ayarsor = $db->prepare("SELECT ayar_siteurl from ayar where ayar_id = 0");
        $ayarsor->execute();
        $ayar = $ayarsor->fetch(PDO::FETCH_ASSOC);
        $mesaj = str_replace('{site_url}', $ayar['ayar_siteurl'], $mesaj);
        
        // Mail Başlıklarını Ayarla
        $headers = "MIME-Version: 1.0\r\n";
        $headers .= "Content-type: text/html; charset=UTF-8\r\n";
        
        // Mail Gönder
        if (mail($uye_mail, $konu, $mesaj, $headers)) {
            // Hatırlatmayı gönderildi olarak işaretle
            $guncelle = $db->prepare("
                UPDATE yenileme_hatirlatmalar 
                SET hatirlatma_gonderildi = 1, 
                    hatirlatma_gonderilme_tarihi = NOW()
                WHERE hatirlatma_id = ?
            ");
            $guncelle->execute([$hatirlatma['hatirlatma_id']]);
            
            logCron("✓ Mail gönderildi: $uye_mail ($paket_adi - $gun gün kala)");
        } else {
            logCron("✗ Mail gönderilemedi: $uye_mail ($paket_adi - $gun gün kala)");
        }
    }
    
    logCron("=== Cronjob Tamamlandı ===\n");
    
} catch (Exception $e) {
    logCron("❌ Hata: " . $e->getMessage());
}

?>