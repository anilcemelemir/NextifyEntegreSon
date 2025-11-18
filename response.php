<?php
ob_start();
session_start();
date_default_timezone_set('Europe/Istanbul');
require 'include/header.php';
require 'include/menu.php';
include_once 'Shopier.php';
$shopier=$db->prepare("SELECT * from shopier where shopier_id=?");
$shopier->execute(array(1));
$shopierprint=$shopier->fetch(PDO::FETCH_ASSOC);

$Api_Key=$shopierprint['shopier_apikey'];
$Api_Secret=$shopierprint['shopier_apisecret'];
$shopier = new Shopier($Api_Key, $Api_Secret);

if ($shopier->verifyShopierSignature($_POST))  
{
	$order_id = $_POST['platform_order_id'];
	$random_nr = $_POST['random_nr'];
	$payment_id = $_POST['payment_id'];
	$status = $_POST['status'];

	$siparissor=$db->prepare("SELECT * from siparis order by siparis_tarih DESC limit 1");
	$siparissor->execute(array(0));
	$sipariscek=$siparissor->fetch(PDO::FETCH_ASSOC);

	$kaydet = $db->prepare(
		"UPDATE siparis SET
		siparis_durum=:durum
		WHERE siparis_id={$sipariscek['siparis_id']}");
	$insert = $kaydet->execute(
		array(
			'durum' => 0 // Ödeme başarılı
		));

	// ============================================
	// ABONELIK OLUŞTUR
	// ============================================
	if ( $insert )
	{
		// Ürün bilgisini al
		$urunsor=$db->prepare("SELECT * from urunler where urun_id=:urun_id");
		$urunsor->execute(array('urun_id' => $sipariscek['urun_id']));
		$uruncek=$urunsor->fetch(PDO::FETCH_ASSOC);

		// Kullanıcı bilgisini al
		$user=$db->prepare("SELECT * from uye where uye_id=:uye_id");
		$user->execute(array(
			'uye_id' => $sipariscek['siparis_ad']
		));
		$userprint=$user->fetch(PDO::FETCH_ASSOC);

		// Abonelik türü ve tarihleri hesapla
		$abone_tur = $_SESSION['abone_tur'] ?? 'aylik'; // Session'dan gel
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
			'siparis' => $sipariscek['siparis_id'],
			'durum' => 1 // Aktif abonelik
		));

		$siparis_fiyat=$sipariscek['siparis_fiyat'];
		$id=$sipariscek['siparis_id'];

		$settings=$db->prepare("SELECT * from ayar where ayar_id=?");
		$settings->execute(array(0));
		$settingsprint=$settings->fetch(PDO::FETCH_ASSOC);

		$idmesaj = $db->lastInsertId();

		$mesajAdmin = "Merhaba sayın yönetici web sitesi üzerinden ".$userprint[ 'uye_ad' ]." ".$userprint[ 'uye_soyad' ]." isimli üye tarafından [".$id."] id li sipariş ödemesi kredi kartı ile başarılı bir şekilde tamamlanmıştır.";

		$mesaj = "Merhaba sayın ".$userprint[ 'uye_ad' ]." ".$userprint[ 'uye_soyad' ]." <br> web sitemiz üzerinden [".$id."] id li siparişinizin ödemesi kredi kartı ile başarılı bir şekilde tamamlanmıştır. Aboneliğiniz aktif hale getirilmiştir.";

		$mailAdres = $settingsprint['ayar_mail'];

		mailsend($mailAdres,'[Yönetici] Sipariş Ödemesi Tamamlandı!',$mesajAdmin);
		mailsend($userprint[ 'uye_mail' ],' [Teşekkürler] Sipariş Ödemesi Tamamlandı!',$mesaj);

		Header( "Location:hesabim/aboneliklerim?status=ok" );
	}
	else
	{
		Header( "Location:hesabim/aboneliklerim?status=error" );
	}
}
?>