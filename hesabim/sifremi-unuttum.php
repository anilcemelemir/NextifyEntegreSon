<?php 
include '../admin/controller/config.php';
$settings=$db->prepare("SELECT * from ayar where ayar_id=?");
$settings->execute(array(0));
$settingsprint=$settings->fetch(PDO::FETCH_ASSOC);
date_default_timezone_set('Europe/Istanbul');

$linkApi=$db->prepare("SELECT * from ayar where ayar_id=0");
$linkApi->execute(array());
$linkApi=$linkApi->fetch(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head><?php 
$metakey=$db->prepare("SELECT * from meta where meta_id=13");
$metakey->execute(array(0));
$metakeyprint=$metakey->fetch(PDO::FETCH_ASSOC);
?>
<title><?php echo $metakeyprint['meta_title'] ?></title>
<meta name="description" content="<?php echo $metakeyprint['meta_descr'] ?>">
<meta name="keywords" content="<?php echo $metakeyprint['meta_keyword'] ?>">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="<?php echo $settingsprint['ayar_siteurl']; ?>admin/<?php echo $settingsprint['ayar_fav']; ?>" type="image/x-icon" />

<!-- Common Plugins -->
<link href="../admin/assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="//www.google.com/recaptcha/api.js?hl=tr"></script>
<!-- Sweet Alerts -->
<link href="../admin/assets/lib/sweet-alerts2/sweetalert2.min.css" rel="stylesheet">

<!-- Custom Css-->
<link href="../admin/assets/css/style.css" rel="stylesheet">

</head>
<body class="bg-light" style="top:100px;background-color: <?php echo $settingsprint['ayar_renk'] ?> !important;">
  <div class="misc-wrapper">
    <div class="misc-content">
      <div class="container">
        <div class="row justify-content-center">
          <div style="background-color: #fff;border-radius: 50px;box-shadow: 0px 0px 20px 1px #000000;" class="col-md-6">
            <div class="misc-header text-center">
              <a href="<?php echo $settingsprint['ayar_siteurl']; ?>">
                <img style="max-width: 250px;margin-top: 20px;" alt="" src="../admin/<?php echo $settingsprint['ayar_logo']; ?>" class="toggle-none hidden-xs">
              </a>
            </div>
            <div class="misc-header">
              <form action="../admin/controller/function.php" method="POST">
               <div class="form-group">
                <label>MAİL</label>
                <div class="group-icon">
                  <input type="email" name="uye_mail" placeholder="Mail adresi giriniz" class="form-control input-lg">
                  <span class="icon-envelope text-muted icon-input"></span>
                </div>
              </div>
              <center>
                <div class="form-group text-center">
                  <div class="g-recaptcha text-center" data-sitekey="<?=$linkApi['ranahtar']?>"></div>
                </div>
              </center>
              <div class="clearfix">
                <div class="pull-centre">
                  <button style="cursor: pointer;" name="sifirla" type="submit" class="btn btn-block btn-primary btn-rounded box-shadow mt-10">SIFIRLA</button>
                </div>
              </div>
            </form> <br>
            <div class="text-center">
              <p>VEYA</p>
            </div>
            <div class="clearfix">
              <a style="cursor: pointer; margin-top: 10px;" href="uye-girisi" class="btn btn-block btn-success btn-rounded box-shadow mt-10">Üye Girisi </a>
            </div>
            <div class="clearfix">
              <a style="cursor: pointer; margin-top: 10px;" href="uye-ol" class="btn btn-block btn-warning btn-rounded box-shadow mt-10">Üye Ol </a>
            </div>
            <div class="clearfix">
              <a style="cursor: pointer; margin-top: 10px;" href="../" class="btn btn-block btn-danger btn-rounded box-shadow mt-10">Ana Sayfaya Dön </a>
            </div>
          </div>
          <div class="text-center misc-footer">
           <p>Copyright &copy; 2017</p>
         </div>
       </div>
     </div>
   </div>
 </div>
</div>

<script src="../admin/assets/lib/jquery/dist/jquery.min.js"></script>
<script src="../admin/assets/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="../admin/assets/lib/pace/pace.min.js"></script>
<script src="../admin/assets/lib/jasny-bootstrap/js/jasny-bootstrap.min.js"></script>
<script src="../admin/assets/lib/slimscroll/jquery.slimscroll.min.js"></script>
<script src="../admin/assets/lib/nano-scroll/jquery.nanoscroller.min.js"></script>
<script src="../admin/assets/lib/metisMenu/metisMenu.min.js"></script>
<script src="../admin/assets/js/custom.js"></script>
<script src="../admin/assets/lib/sweet-alerts2/sweetalert2.min.js"></script>
<?php if ($_GET['status']=='ok') { ?>
  <script>
   $(document).ready(function () {
    swal({
      title: "TAMAMLANDI!",
      text: "İşlem başarılı bir şekilde tamamlandı",
      type: "success",
      timer: '1000',
      showConfirmButton: false
    });
  });
</script>
<?php  
$sayfaURL = "http";
if(isset($_SERVER["HTTPS"])){
  if($_SERVER["HTTPS"] == "on"){
    $sayfaURL .= "s";
  }
}
$sayfaURL .= "://";
$sayfaURL .= $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"]; ?>
<meta http-equiv="refresh" content="1; URL=<?php echo substr($sayfaURL,0, -10);?>">
<?php } if ($_GET['sure']=='ok') { ?>
 <script>
   $(document).ready(function () {
    swal({
      title: "UYARI!",
      text: "Mail Gönderimini Min. 20 dakika arayla yapabilirsiniz. <br /> Tekrar gönderim için lütfen bekleyiniz.",
      type: "warning",
      showConfirmButton: false,
      timer: '6000'
    });
  });
</script>
<?php  
$sayfaURL = "http";
if(isset($_SERVER["HTTPS"])){
  if($_SERVER["HTTPS"] == "on"){
    $sayfaURL .= "s";
  }
}
$sayfaURL .= "://";
$sayfaURL .= $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"]; ?>
<meta http-equiv="refresh" content="6; URL=<?php echo substr($sayfaURL,0, -8);?>">
<?php } elseif ($_GET['uye']=='no') {?>
  <script>
   $(document).ready(function () {
    swal({
      title: "UYARI!",
      text: "Böyle bir üyelik bulunamadı! Bunun bir hata sonucu olduğunu düşünüyorsanız lütfen bizimle iletişime geçiniz.",
      type: "warning",
      showConfirmButton: false,
      timer: '5000'
    });
  });
</script>
<?php  
$sayfaURL = "http";
if(isset($_SERVER["HTTPS"])){
  if($_SERVER["HTTPS"] == "on"){
    $sayfaURL .= "s";
  }
}
$sayfaURL .= "://";
$sayfaURL .= $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"]; ?>
<meta http-equiv="refresh" content="5; URL=<?php echo substr($sayfaURL,0, -7);?>">
<?php } elseif ($_GET['captcha']=='no') {?>
  <script>
   $(document).ready(function () {
    swal({
      title: "HATA!",
      text: "reCaptcha doğrulama alanını boş bırakmayınız!",
      type: "warning",
      showConfirmButton: false,
      timer: '3000'
    });
  });
</script>
<?php  
$sayfaURL = "http";
if(isset($_SERVER["HTTPS"])){
  if($_SERVER["HTTPS"] == "on"){
    $sayfaURL .= "s";
  }
}
$sayfaURL .= "://";
$sayfaURL .= $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"]; ?>
<meta http-equiv="refresh" content="3; URL=<?php echo substr($sayfaURL,0, -11);?>">
<?php } elseif ($_GET['uye']=='ok') {?>
 <script>
   $(document).ready(function () {
    swal({
      title: "BAŞARILI!",
      text: "Üye kaydı başarılı bir şekilde gerçekleşti.",
      type: "success",
      showConfirmButton: false,
      timer: '1000'
    });
  });
</script>
<?php  
$sayfaURL = "http";
if(isset($_SERVER["HTTPS"])){
  if($_SERVER["HTTPS"] == "on"){
    $sayfaURL .= "s";
  }
}
$sayfaURL .= "://";
$sayfaURL .= $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"]; ?>
<meta http-equiv="refresh" content="1; URL=<?php echo substr($sayfaURL,0, -7);?>">
<?php } ?>
</body>
</html>
