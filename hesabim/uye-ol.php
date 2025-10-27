<?php 
ob_start();
session_start();
include '../admin/controller/config.php';
$settings=$db->prepare("SELECT * from ayar where ayar_id=?");
$settings->execute(array(0));
$settingsprint=$settings->fetch(PDO::FETCH_ASSOC);

$html=$db->prepare("SELECT * from widget");
$html->execute(array());
$htmlwrite=$html->fetch(PDO::FETCH_ASSOC);

$linkApi=$db->prepare("SELECT * from ayar where ayar_id=0");
$linkApi->execute(array());
$linkApi=$linkApi->fetch(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <?php 
  $metakey=$db->prepare("SELECT * from meta where meta_id=9");
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
  <!-- DropZone -->
  <link rel="stylesheet" href="../admin/assets/dropzone/dropzone.css" />
  <link rel="stylesheet" href="../admin/assets/dropzone/dropzone.min.css" />

  <script src="//www.google.com/recaptcha/api.js?hl=tr"></script>
  <!-- Common Plugins -->
  <link href="../admin/assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

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
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css" rel="stylesheet"/>

  <!-- Custom Css-->
  <link href="../admin/assets/css/style.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
      </head>
      <body class="bg-light" style="top:60px;background-color: <?php echo $settingsprint['ayar_renk'] ?> !important;">

        <div class="misc-wrapper">
          <div class="misc-content">
            <div class="container">
              <div class="row justify-content-center">
                <div style="background-color: #fff;border-radius: 50px;box-shadow: 0px 0px 20px 1px #000000;" class="col-md-8">
                  <div class="misc-header text-center">
                    <a href="<?php echo $settingsprint['ayar_siteurl']; ?>">
                      <img style="max-width: 250px;margin-top: 20px;" alt="" src="../admin/<?php echo $settingsprint['ayar_logo']; ?>" class="toggle-none hidden-xs">
                    </a>
                  </div>
                  <div class="misc-header text-center">
                  </div>
                  <div style="background-color: #fff;" class="misc-box">   
                    <form method="POST" action="../admin/controller/function.php" class="form-transparent-grey">
                      <div class="row">
                        <div class="col-md-6 form-group">
                          <label>AD *</label>
                          <div class="group-icon">
                            <input type="text" name="uye_ad" placeholder="Ad giriniz" required="" class="form-control input-lg">
                            <span class="icon-user text-muted icon-input"></span>
                          </div>
                        </div>
                        <div class="col-md-6 form-group">
                          <label>SOYAD *</label> 
                          <div class="group-icon">
                            <input type="text" name="uye_soyad" placeholder="Soyad giriniz" required="" class="form-control input-lg">
                            <span class="icon-user text-muted icon-input"></span>
                          </div>
                        </div>
                        <div class="col-md-6 form-group">
                          <label>MAİL *</label>
                          <div class="group-icon">
                            <input type="email" name="uye_mail" placeholder="Mail adresi giriniz" required="" class="form-control input-lg">
                            <span class="icon-envelope text-muted icon-input"></span>
                          </div>

                        </div>
                        <div class="col-md-6 form-group">
                          <label>TELEFON *</label>
                          <div class="group-icon">
                            <input type="text" name="uye_tel" placeholder="Tel no giriniz" required="" class="form-control input-lg">
                            <span class="icon-phone text-muted icon-input"></span>
                          </div>
                        </div>
                        <div class="col-md-6 form-group">
                          <label>ŞİFRE *</label>
                          <div class="group-icon">
                            <input type="password" name="uye_sifre" placeholder="Şifre giriniz" required="" class="form-control input-lg">
                            <span class="icon-lock text-muted icon-input"></span>
                          </div>
                        </div>
                        <div class="col-md-6 form-group">
                          <label>ŞİFRE TEKRAR *</label>
                          <div class="group-icon">
                            <input type="password" name="uye_sifre_onay" placeholder="Şifre giriniz" required="" class="form-control input-lg">
                            <span class="icon-lock text-muted icon-input"></span>
                          </div>
                        </div>

                        <div class="container text-right">
                          <div class="col-md-12 form-group">
                            <input required="" type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1" style="padding-left: 0;"><a href="#" data-toggle="modal" data-target="#textModal">Üyelik Sözleşmesini</a> Okudum Anladım ve Onaylıyorum!</label>
                          </div>
                        </div>

                        <div class="col-md-12 form-group">
                          <center>
                            <div class="form-group text-center">
                              <div class="g-recaptcha text-center" data-sitekey="<?=$linkApi['ranahtar']?>"></div>
                            </div>
                          </center>
                          <button style="cursor: pointer;" name="uyekayit" class="btn btn-block btn-primary btn-rounded box-shadow mt-10" type="submit">ÜYE OL </button>
                        </div>

                      </div>
                    </form>

                    <div class="modal fade" id="textModal" tabindex="-1" role="dialog" aria-labelledby="textModal">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div style="text-align: left;" class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times"></span></button>
                            <h3 class="modal-title" id="myModalLabel">SÖZLEŞME</h3>
                          </div>
                          <div class="modal-body">
                            <p>
                              <?php echo $htmlwrite['widget_uyesozlesme']; ?>
                            </p><br>
                            <div class="text-center">

                              <button style="cursor: pointer;" data-dismiss="modal" aria-label="Close" type="button" class="btn btn-warning btn-lg">ONAYLIYORUM</button>

                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="text-center">
                      <p>VEYA</p>
                    </div>
                    <div class="form-group">
                      <a style="cursor: pointer; border: none;" href="uye-girisi" class="btn btn-block btn-success btn-rounded box-shadow mt-10" >Üye Girişi </a>
                    </div>
                    <div class="form-group">
                      <a style="cursor: pointer; border: none;" href="../" class="btn btn-block btn-danger btn-rounded box-shadow mt-10" >Ana Sayfaya Dön </a>
                    </div>
                  </div>

                  <div class="col-md-12 text-center">
                    <p>Üyelik formunda telefon numaranızı ve mail adresinizi doğru yazınız şifre sıfırlama ve benzeri durumlarda kullanılacaktır.</p>
                  </div>
                  <div class="text-center misc-footer">
                   <p>Copyright &copy; 2017</p>
                 </div>
               </div>
             </div>
           </div>
         </div>
       </div>



       <!-- Common Plugins -->
       <script src="../admin/assets/lib/jquery/dist/jquery.min.js"></script>
       <script src="../admin/assets/lib/bootstrap/js/popper.min.js"></script>
       <script src="../admin/assets/lib/bootstrap/js/bootstrap.min.js"></script>
       <script src="../admin/assets/lib/pace/pace.min.js"></script>
       <script src="../admin/assets/lib/jasny-bootstrap/js/jasny-bootstrap.min.js"></script>
       <script src="../admin/assets/lib/slimscroll/jquery.slimscroll.min.js"></script>
       <script src="../admin/assets/lib/nano-scroll/jquery.nanoscroller.min.js"></script>
       <script src="../admin/assets/lib/metisMenu/metisMenu.min.js"></script>
       <script src="../admin/assets/js/custom.js"></script>
       <script src="../admin/assets/dropzone/dropzone.js"></script>

       <!--Chart Script-->
       <script src="../admin/assets/lib/chartJs/Chart.min.js"></script>


       <!--Vetor Map Script-->
       <script src="../admin/assets/lib/vectormap/jquery-jvectormap-2.0.2.min.js"></script>
       <script src="../admin/assets/lib/vectormap/jquery-jvectormap-world-mill-en.js"></script>

       <!-- Datatables-->
       <script src="../admin/assets/lib/datatables/jquery.dataTables.min.js"></script>
       <script src="../admin/assets/lib/datatables/dataTables.responsive.min.js"></script>
       <script src="../admin/assets/lib/datatables/dataTables.buttons.min.js"></script>
       <script src="../admin/assets/lib/datatables/jszip.min.js"></script>
       <script src="../admin/assets/lib/datatables/pdfmake.min.js"></script>
       <script src="../admin/assets/lib/datatables/vfs_fonts.js"></script>
       <script src="../admin/assets/lib/datatables/buttons.html5.min.js"></script>
       <!-- Jquery Steps -->
       <script src="../admin/assets/lib/jquery-steps/jquery.steps.min.js"></script>
       <script src="../admin/assets/lib/jquery-validate/jquery.validate.min.js"></script>
       <!--Sweet Alerts-->
       <script src="../admin/assets/lib/sweet-alerts2/sweetalert2.min.js"></script>

       <?php if ($_GET['status']=='exit') {?>
         <script>
           $(document).ready(function () {
            swal({
              title: "BAŞARILI!",
              text: "Çıkış işlemi başarılı bir şekilde gerçekleşti.",
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
        <meta http-equiv="refresh" content="1; URL=<?php echo substr($sayfaURL,0, -12);?>">
      <?php } elseif ($_GET['mail']=='no') {?>
        <script>
         $(document).ready(function () {
          swal({
            title: "HATA!",
            text: "Mail adresi zaten sistemde kayitli.",
            type: "error",
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
      <meta http-equiv="refresh" content="3; URL=<?php echo substr($sayfaURL,0, -8);?>">
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
  <?php } elseif ($_GET['sifre']=='no') {?>
    <script>
     $(document).ready(function () {
      swal({
        title: "HATA!",
        text: "Şifreler uyuşmuyor.",
        type: "error",
        showConfirmButton: false,
        timer: '2000'
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
  <meta http-equiv="refresh" content="2; URL=<?php echo substr($sayfaURL,0, -8);?>">
<?php } ?>

</body>
</html>
