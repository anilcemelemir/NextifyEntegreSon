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
      'durum' => 0
    ));

  if ( $insert )
  {
    $siparis_fiyat=$sipariscek['siparis_fiyat'];
    $id=$sipariscek['siparis_id'];

    $user=$db->prepare("SELECT * from uye where uye_id=:uye_id");
    $user->execute(array(
      'uye_id' => $sipariscek['siparis_ad']
    ));
    $userprint=$user->fetch(PDO::FETCH_ASSOC);


    $settings=$db->prepare("SELECT * from ayar where ayar_id=?");
    $settings->execute(array(0));
    $settingsprint=$settings->fetch(PDO::FETCH_ASSOC);

    $idmesaj = $db->lastInsertId();

    $mesajAdmin = "Merhaba sayın yönetici web sitesi üzerinden ".$userprint[ 'uye_ad' ]." ".$userprint[ 'uye_soyad' ]." isimli üye tarafından [".$id."] id li sipariş ödemesi kredi kartı ile başarılı bir şekilde yapılmıştır. <br> <b>Sipariş Fiyatı:</b> <br>".$siparis_fiyat."TL<br> <b>Ödeme Yöntemi:</b> <br>".$siparis_odeme;

    $mesaj = "Merhaba sayın ".$userprint[ 'uye_ad' ]." ".$userprint[ 'uye_soyad' ]." <br> web sitemiz üzerinden [".$id."] id li siparişinizin ödemesi kredi kartı ile başarılı bir şekilde alınmıştır. Bizi tercih ettiğiniz için teşekkür ederiz.";

    $mailAdres = $settingsprint['ayar_mail'];

    mailsend($mailAdres,'[Yönetici] Sipariş Ödemesi Tamamlandı!',$mesajAdmin);
    mailsend($userprint[ 'uye_mail' ],' [Teşekkürler] Sipariş Ödemesi Tamamlandı!',$mesaj);

    Header( "Location:index.php?status=ok" );
  }
  else
  {
    Header( "Location:index.php?status=no" );
  }
}
?>


