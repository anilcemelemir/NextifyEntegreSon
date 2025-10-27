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
		$update     = $ayarkaydet->execute(
			array(
				'durum' => 0 // sipariş onaylanmadı 1 || sipariş onaylandı 0
			));



		$settings=$db->prepare("SELECT * from ayar where ayar_id=?");
		$settings->execute(array(0));
		$settingsprint=$settings->fetch(PDO::FETCH_ASSOC);

		$idmesaj = $db->lastInsertId();

		$mesajAdmin = "Merhaba sayın yönetici web sitesi üzerinden ".$userprint[ 'uye_ad' ]." ".$userprint[ 'uye_soyad' ]." isimli üye tarafından [".$TemizID."] id li sipariş ödemesi kredi kartı ile başarılı bir şekilde yapılmıştır. <br> <b>Sipariş Fiyatı:</b> <br>".$siparis_fiyat."TL<br> <b>Ödeme Yöntemi:</b> <br>".$siparis_odeme;

		$mesaj = "Merhaba sayın ".$userprint[ 'uye_ad' ]." ".$userprint[ 'uye_soyad' ]." <br> web sitemiz üzerinden [".$TemizID."] id li siparişinizin ödemesi kredi kartı ile başarılı bir şekilde alınmıştır. Bizi tercih ettiğiniz için teşekkür ederiz.";

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
