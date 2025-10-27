<?php
ob_start();
session_start();
include 'admin/controller/config.php'; 
include 'admin/controller/seo.php';
date_default_timezone_set('Europe/Istanbul');
$settings=$db->prepare("SELECT * from ayar where ayar_id=?");
$settings->execute(array(0));
$settingsprint=$settings->fetch(PDO::FETCH_ASSOC);
$social=$db->prepare("SELECT * from sosyal");
$social->execute();
$socialf=$db->prepare("SELECT * from sosyal");
$socialf->execute();
$socials=$db->prepare("SELECT * from sosyal");
$socials->execute();
$motor=$db->prepare("SELECT * from motor where motor_id=1");
$motor->execute(array(0));
$motorprint=$motor->fetch(PDO::FETCH_ASSOC);
$widgets=$db->prepare("SELECT * from widget where widget_id=1");
$widgets->execute(array(0));
$widgetprint=$widgets->fetch(PDO::FETCH_ASSOC);
$linkApi=$db->prepare("SELECT * from ayar where ayar_id=0");
$linkApi->execute(array());
$linkApi=$linkApi->fetch(PDO::FETCH_ASSOC);
if (isset($_SESSION['uye_mail'])) {
    $user=$db->prepare("SELECT * from uye where uye_mail=:uye_mail");
    $user->execute(array(
      'uye_mail' => $_SESSION['uye_mail']
  ));
    $userprint=$user->fetch(PDO::FETCH_ASSOC);
} 
if ( isset( $_POST[ 'sepetle' ] ) )
{
    $update     = array(
        'id'  => htmlspecialchars(strip_tags(trim($_POST['urun_id']))),
        'paket'  => htmlspecialchars(strip_tags(trim($_POST['urun_paket']))),
        'urun' => htmlspecialchars(strip_tags(trim($_POST['urun_adi']))),
        'fiyat' => htmlspecialchars(strip_tags(trim($_POST['urun_fiyat'])))
    ) ;
    $_SESSION['urunler'][]=$update;
    if ( $update )
    {
        Header( "Location:sepet" );
    }
    else
    {
        Header( "Location:sepet" );
    }
}
?>