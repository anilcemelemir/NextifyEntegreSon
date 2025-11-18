<?php
date_default_timezone_set('Europe/Istanbul');
require 'include/header.php';
require 'include/menu.php';

$paytr=$db->prepare("SELECT * from paytr where paytr_id=?");
$paytr->execute(array(1));
$paytrprint=$paytr->fetch(PDO::FETCH_ASSOC);

$post = $_POST;
$merchant_key 	= $paytrprint['paytr_key'];
$merchant_salt	= $paytrprint['paytr_salt'];
$hash = base64_encode( hash_hmac('sha256', $post['merchant_oid'].$merchant_salt.$post['status'].$post['total_amount'], $merchant_key, true) );
if( $hash != $post['hash'] )
	die('PAYTR notification failed: bad hash');

if( $post['status'] == 'success' ) { 

	$IdKontrol=$post['merchant_oid'];
	$Say=strlen($IdKontrol);

	if ($Say>'9') {
		$TemizID = substr($IdKontrol, 9,300);
	} else {
		$TemizID = $IdKontrol;
	}

	$inovance=$db->prepare("SELECT * from siparis where siparis_id=:siparis_id");
	$inovance->execute(array(
		'siparis_id' => $TemizID
	));
	$inovanceprint=$inovance->fetch(PDO::FETCH_ASSOC);

	$user=$db->prepare("SELECT * from uye where uye_id=:uye_id");
	$user->execute(array(
		'uye_id' => $inovanceprint['siparis_ad']
	));
	$userprint=$user->fetch(PDO::FETCH_ASSOC);

	$durumS = $inovanceprint['siparis_durum'];
	$siparis_fiyat = $inovanceprint['siparis_fiyat'];
	$siparis_odeme = $inovanceprint['siparis_odeme'];

	if( $durumS == "1"){

		$ayarkaydet = $db->prepare(
			"UPDATE siparis SET
			siparis_durum=:durum
			WHERE siparis_id={$TemizID}"
		);
		$update = $ayarkaydet->execute(
			array(
				'durum' => 0 // sipariş onaylandı
			));

		// ============================================
		// ABONELIK OLUŞTUR
		// ============================================
		if($update) {
			// Sipariş detaylarından ürün bilgisini al
			$urunsor=$db->prepare("SELECT * from urunler where urun_id=:urun_id");
			$urunsor->execute(array('urun_id' => $inovanceprint['urun_id']));
			$uruncek=$urunsor->fetch(PDO::FETCH_ASSOC);

			// Abonelik türü ve tarihleri hesapla
			$abone_tur = $_POST['abone_tur'] ?? 'aylik'; // POST'tan gel, yoksa aylık default
			$baslangic_tarih = date('Y-m-d H:i:s');
			
			if($abone_tur === 'yillik') {
				$bitis_tarih = date('Y-m-d H:i:s', strtotime($baslangic_tarih . ' +1 year'));
			} else {
				$bitis_tarih = date('Y-m-d H:i:s', strtotime($baslangic_tarih . ' +1 month'));
			}

			// Abonelik kaydı oluştur
			$abonelik_kaydet = $db->prepare(
				"INSERT INTO abonelikler SET
				abone_uye=:uye,
				abone_urun=:urun,
				abone_tur=:tur,
				abone_baslangic_tarih=:baslangic,
				abone_bitis_tarih=:bitis,
				abone_siparis=:siparis,
				abone_durum=:durum"
			);
			
			$abonelik_insert = $abonelik_kaydet->execute(array(
				'uye' => $userprint['uye_id'],
				'urun' => $uruncek['urun_id'],
				'tur' => $abone_tur,
				'baslangic' => $baslangic_tarih,
				'bitis' => $bitis_tarih,
				'siparis' => $TemizID,
				'durum' => 1 // Aktif abonelik
			));
		}

		$settings=$db->prepare("SELECT * from ayar where ayar_id=?");
		$settings->execute(array(0));
		$settingsprint=$settings->fetch(PDO::FETCH_ASSOC);

		$idmesaj = $db->lastInsertId();

		$mesajAdmin = "Merhaba sayın yönetici web sitesi üzerinden ".$userprint[ 'uye_ad' ]." ".$userprint[ 'uye_soyad' ]." isimli üye tarafından [".$TemizID."] id li sipariş ödemesi kredi kartı ile başarılı bir şekilde tamamlanmıştır.";

		$mesaj = "Merhaba sayın ".$userprint[ 'uye_ad' ]." ".$userprint[ 'uye_soyad' ]." <br> web sitemiz üzerinden [".$TemizID."] id li siparişinizin ödemesi kredi kartı ile başarılı bir şekilde tamamlanmıştır. Aboneliğiniz aktif hale getirilmiştir.";

		$mailAdres = $settingsprint['ayar_mail'];

		mailsend($mailAdres,'[Yönetici] Sipariş Ödemesi Tamamlandı!',$mesajAdmin);
		mailsend($userprint[ 'uye_mail' ],' [Teşekkürler] Sipariş Ödemesi Tamamlandı!',$mesaj);
	}

} else {
	echo "OK";
	exit;

}
echo "OK";
exit;
?>