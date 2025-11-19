<?php
date_default_timezone_set('Europe/Istanbul');
require 'include/header.php';
require 'include/menu.php';

$post = $_POST;

$paytr=$db->prepare("SELECT * from paytr where paytr_id=?");
$paytr->execute(array(1));
$paytrprint=$paytr->fetch(PDO::FETCH_ASSOC);

$merchant_key 	= $paytrprint['paytr_key'];
$merchant_salt	= $paytrprint['paytr_salt'];

// 1. HASH KONTROLÜ
$hash = base64_encode( hash_hmac('sha256', $post['callback_id'].$post['merchant_oid'].$merchant_salt.$post['status'].$post['total_amount'], $merchant_key, true) );

if( $hash != $post['hash'] )
   die('PAYTR notification failed: bad hash');

// 2. MERCHANT_OID'yi TEMİZLE
$IdKontrol=$post['merchant_oid'];
$Say=strlen($IdKontrol);

if ($Say > 9) {
    $TemizID = substr($IdKontrol, 9, 300);
} else {
    $TemizID = $IdKontrol;
}

// 3. DAHA ÖNCE İŞLENDİ Mİ KONTROL ET (Dokümantasyona göre)
$callback_check = $db->prepare("SELECT * FROM siparis WHERE siparis_id=:siparis_id AND siparis_durum=0");
$callback_check->execute(array('siparis_id' => $TemizID));

if($callback_check->rowCount() > 0) {
	// Zaten işlenmiş
	echo "OK";
	exit;
}

// 4. STATUS KONTROLÜ
if( $post['status'] == 'success' ) { 

	// Sipariş bilgilerini çek
	$inovance=$db->prepare("SELECT * from siparis where siparis_id=:siparis_id");
	$inovance->execute(array(
		'siparis_id' => $TemizID
	));
	$inovanceprint=$inovance->fetch(PDO::FETCH_ASSOC);

	if(!$inovanceprint) {
		die("PAYTR notification failed: Order not found");
	}

	// Kullanıcı bilgilerini çek
	$user=$db->prepare("SELECT * from uye where uye_id=:uye_id");
	$user->execute(array(
		'uye_id' => $inovanceprint['siparis_ad']
	));
	$userprint=$user->fetch(PDO::FETCH_ASSOC);

	if(!$userprint) {
		die("PAYTR notification failed: User not found");
	}

	$durumS = $inovanceprint['siparis_durum'];

	// Sadece bekleyen siparişleri işle
	if( $durumS == "1"){

		// Sipariş durumunu güncelle
		$ayarkaydet = $db->prepare(
			"UPDATE siparis SET
			siparis_durum=:durum
			WHERE siparis_id=:siparis_id"
		);
		$update = $ayarkaydet->execute(
			array(
				'durum' => 0,
				'siparis_id' => $TemizID
			));

		// ABONELIK OLUŞTUR
		if($update) {
			$urunsor=$db->prepare("SELECT * from urunler where urun_id=:urun_id");
			$urunsor->execute(array('urun_id' => $inovanceprint['siparis_urun']));
			$uruncek=$urunsor->fetch(PDO::FETCH_ASSOC);

			if($uruncek) {
				$abone_tur = $inovanceprint['siparis_abone_tur'] ?? 'aylik'; 
				$baslangic_tarih = date('Y-m-d H:i:s');
				
				if($abone_tur === 'yillik') {
					$bitis_tarih = date('Y-m-d H:i:s', strtotime($baslangic_tarih . ' +1 year'));
				} else {
					$bitis_tarih = date('Y-m-d H:i:s', strtotime($baslangic_tarih . ' +1 month'));
				}

				$abonelik_check = $db->prepare("SELECT * FROM abonelikler WHERE abone_siparis=:siparis_id");
				$abonelik_check->execute(array('siparis_id' => $TemizID));
				
				if($abonelik_check->rowCount() == 0) {
					$abonelik_kaydet = $db->prepare(
						"INSERT INTO abonelikler SET
						abone_uye=:uye,
						abone_urun=:urun,
						abone_tur=:tur,
						abone_baslangic_tarih=:baslangic,
						abone_bitis_tarih=:bitis,
						abone_sonraki_odeme_tarih=:sonraki,
						abone_durum=:durum,
						abone_siparis=:siparis"
					);
					
					$abonelik_kaydet->execute(array(
						'uye' => $userprint['uye_id'],
						'urun' => $uruncek['urun_id'],
						'tur' => $abone_tur,
						'baslangic' => $baslangic_tarih,
						'bitis' => $bitis_tarih,
						'sonraki' => $bitis_tarih,
						'durum' => 'aktif',
						'siparis' => $TemizID
					));
				}
			}

			// Mail gönder
			$settings=$db->prepare("SELECT * from ayar where ayar_id=?");
			$settings->execute(array(0));
			$settingsprint=$settings->fetch(PDO::FETCH_ASSOC);

			$mesajAdmin = "Merhaba sayın yönetici web sitesi üzerinden ".$userprint['uye_ad']." ".$userprint['uye_soyad']." isimli üye tarafından [".$TemizID."] id li sipariş ödemesi kredi kartı ile başarılı bir şekilde tamamlanmıştır.";

			$mesaj = "Merhaba sayın ".$userprint['uye_ad']." ".$userprint['uye_soyad']." <br> web sitemiz üzerinden [".$TemizID."] id li siparişinizin ödemesi kredi kartı ile başarılı bir şekilde tamamlanmıştır.";

			mailsend($settingsprint['ayar_mail'],'[Yönetici] Sipariş Ödemesi Tamamlandı!',$mesajAdmin);
			mailsend($userprint['uye_mail'],'[Teşekkürler] Sipariş Ödemesi Tamamlandı!',$mesaj);
		}
	}

	echo "OK";
	exit;

} else {
	echo "OK";
	exit;
}
?>