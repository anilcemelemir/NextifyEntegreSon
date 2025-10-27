<?php 
ob_start();
session_start();
date_default_timezone_set('Europe/Istanbul');
include '../admin/controller/config.php';

$motor=$db->prepare("SELECT * from motor where motor_id=1");

$motor->execute(array(0));

$motorprint=$motor->fetch(PDO::FETCH_ASSOC);

$settings=$db->prepare("SELECT * from ayar where ayar_id=?");
$settings->execute(array(0));
$settingsprint=$settings->fetch(PDO::FETCH_ASSOC);


if (isset($_SESSION['uye_mail'])) {
  $user=$db->prepare("SELECT * from uye where uye_mail=:uye_mail");
  $user->execute(array(
    'uye_mail' => $_SESSION['uye_mail']
  ));
  $userprint=$user->fetch(PDO::FETCH_ASSOC);
  unset($_SESSION['sonlink']);
} else { 
  $_SESSION['sonlink'] = "http://". $_SERVER[ 'SERVER_NAME' ] . $_SERVER[ 'REQUEST_URI' ];
  header("Location:../hesabim/uye-girisi");
  exit;
}

$linkApi=$db->prepare("SELECT * from ayar where ayar_id=0");
$linkApi->execute(array());
$linkApi=$linkApi->fetch(PDO::FETCH_ASSOC);

$metakey=$db->prepare("SELECT * from meta where meta_id=11");
$metakey->execute(array(0));
$metakeyprint=$metakey->fetch(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="tr">

    <head>
        <link rel="shortcut icon" href="<?php echo $settingsprint['ayar_siteurl']; ?>admin/<?php echo $settingsprint['ayar_fav']; ?>" type="image/x-icon" />
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><?php echo $metakeyprint['meta_title'] ?></title>
        <script src="../ckeditor/ckeditor.js"></script>
        <script src="../admin/assets/js/alert.js"></script>

        <!-- DropZone -->
        <link rel="stylesheet" href="../admin/assets/dropzone/dropzone.css" />
        <link rel="stylesheet" href="../admin/assets/dropzone/dropzone.min.css" />

        <!-- Common Plugins -->
        <link href="../admin/assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script src="//www.google.com/recaptcha/api.js?hl=tr"></script>

        <!-- Sweet Alerts -->
        <link href="../admin/assets/lib/sweet-alerts2/sweetalert2.min.css" rel="stylesheet">

        <!-- Summernote -->
        <link href="../admin/assets/lib/summernote/summernote.css" rel="stylesheet">
        <link href="../admin/assets/lib/summernote/summernote-bs3.css" rel="stylesheet">
        <link rel="stylesheet" href="../admin/assets/lib/jquery-steps/jquery-steps.css">

        <!-- Vector Map Css-->
        <link href="../admin/assets/lib/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet" />

        <!-- DataTables -->
        <link href="../admin/assets/lib/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
        <link href="../admin/assets/lib/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="../admin/assets/lib/toast/jquery.toast.min.css" rel="stylesheet">
        <link href="../admin/assets/lib/datatables/buttons.dataTables.css" rel="stylesheet" type="text/css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css" rel="stylesheet" />

        <!-- Custom Css-->
        <link href="../admin/assets/css/style.css" rel="stylesheet">

        <div style='position: fixed; bottom: 20px; z-index: 9999;' class="col-md-4">
            <a class="btn btn-danger" href="<?php echo $settingsprint['ayar_siteurl']; ?>"><b class="text-light">SİTEYE GİT</b></a>
        </div>
    </head>

    <body>
