<?php   
$whatsapp=$db->prepare("SELECT * from whatsapp where whats_id=0");
$whatsapp->execute(array(0));
$whatsappprint=$whatsapp->fetch(PDO::FETCH_ASSOC);  ?>
<div style='position: fixed; bottom: 10px; left: 20px; z-index: 999;'>
    <div class="row">
        <?php if ($whatsappprint['whats_tiklaaradurum']==1) { ?>
        <div class=" m-b10">
            <a style="width: 170px; display: flex; flex-direction: row; flex-wrap: nowrap; align-content: flex-end; justify-content: flex-end;" href="tel:<?php echo $whatsappprint['whats_tiklaara']; ?>" class="octf-btn octf-btn-primary octf-btn-icon"><span>Tıkla Ara <i class="flaticon-right-arrow-1"></i></span></a>
        </div>
        <?php } if ($whatsappprint['whats_durum']==1) { ?>
        <div class="">
            <a style="width: 170px; display: flex; flex-direction: row; flex-wrap: nowrap; align-content: flex-end; justify-content: flex-end;background: #2abb20;" href="https://api.whatsapp.com/send?phone=90<?php echo $whatsappprint['whats_tel']; ?>" class="octf-btn octf-btn-primary octf-btn-icon"><span>Whatsapp <i class="flaticon-right-arrow-1"></i></span></a>
        </div>
        <?php } ?>
    </div>
</div>
<?php if ($widgetprint['widget_bilgi']==1) { ?>
<section class="home5-video particles-js" data-color="#fe4c1c,#00c3ff,#0160e7" data-id="i5-4" style="padding: 0;">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="newsletter">
                    <div class="row">
                        <div class="col-md-4 col-sm-12 col-xs-12">
                            <div class="newsletter-text">
                                <img src="images/email.png" style="width:65px;margin-bottom:30px;" alt="Mail 7x24 Destek">
                                <h4 class="title"><a href="mailto:<?php echo $settingsprint['ayar_mail']; ?>" style="color: #fff;"><?php echo $settingsprint['ayar_mail']; ?></a></h4>
                                <p class="text">Mail Destek</p>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-12 col-xs-12">
                            <div class="newsletter-text">
                                <img src="images/whatsapp.png" style="width:65px;margin-bottom:30px;" alt="Whatsapp 7x24 Destek">
                                <h4 class="title"><a href="https://wa.me/9<?php echo $settingsprint['ayar_whatsapp']; ?>" style="color: #fff;"><?php echo $settingsprint['ayar_whatsapp']; ?></a></h4>
                                <p class="text">Whatsapp Destek</p>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-12 col-xs-12">
                            <div class="newsletter-text">
                                <img src="images/phone-call.png" style="width:65px;margin-bottom:30px;" alt="Tıkla Ara">
                                <h4 class="title"><a href="tel:<?php echo $settingsprint['ayar_tel']; ?>" style="color: #fff;"><?php echo $settingsprint['ayar_tel']; ?></a></h4>
                                <p class="text">
                                  Hafta İçi   09:00 - 18:00<br>
                                  Cmt   09:00 - 12:00
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<?php } ?>
<footer id="site-footer" class="site-footer site-footer-2 site-footer-5" style="background-image: url(admin/<?php echo $settingsprint['resim_footer']; ?>) !important;">
    <div class="main-footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-sm-6">
                    <div class="footer-widget">
                        <h5>Menü</h5>
                        <ul class="ft-menu-list">
                            <?php 
                            $footermenu=$db->prepare("SELECT * from fmenu order by fmenu_sira");
                            $footermenu->execute();
                            while($footermenuprint=$footermenu->fetch(PDO::FETCH_ASSOC)) { ?>
                            <li class="ft-menu-item"><a href="<?php echo $footermenuprint['fmenu_link'] ?>"><?php echo $footermenuprint['fmenu_ad'];  ?></a></li>
                            <?php } ?>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="footer-widget">
                        <h5>Hizmetler</h5>
                        <ul class="ft-menu-list">
                            <?php 
                            $hizmetf=$db->prepare("SELECT * from hizmetler Limit 5");
                            $hizmetf->execute(array(0));
                            while ($hizmefprint=$hizmetf->fetch(PDO::FETCH_ASSOC)) {  ?>
                            <li class="ft-menu-item">
                                <a href="<?=seo('hizmet-'.$hizmefprint["hizmet_baslik"]).'-'.$hizmefprint["hizmet_id"]?>">
                                    <?php echo $hizmefprint['hizmet_baslik']; ?>
                                </a>
                            </li>
                            <?php } ?>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="footer-widget">
                        <h5>Üye Paneli</h5>
                        <ul class="ft-menu-list">
                            <li class="ft-menu-item"><a href="hesabim">Giriş Yap</a></li>
                            <li class="ft-menu-item"><a href="hesabim/uye-ol">Üye Ol</a></li>
                            <li class="ft-menu-item"><a href="hesabim/yeni-destek">Destek Al</a></li>
                            <li class="ft-menu-item"><a href="hesabim/siparisler">Siparişlerim</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="footer-widget">
                        <img src="admin/<?php echo $settingsprint['ayar_resimparalax']; ?>" class="attachment-full size-full m-b25" alt="logo">
                        <p class="m-b30"><?php echo strip_tags($widgetprint['widget_html2']); ?></p>
                        <img src="admin/<?php echo $settingsprint['ayar_ark']; ?>" alt="odeme">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <p class="copyright-2 text-center"><?php if ($widgetprint['widget_welcome']==1) {   echo $widgetprint['widget_bwelcome']; } ?></p>
        </div>
    </div>
</footer>
</div>
<a id="back-to-top" href="#" class="show"><i class="flaticon-arrow-pointing-to-up"></i></a>
<script src="js/jquery.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.isotope.min.js"></script>
<script src="js/easypiechart.js"></script>
<script src="js/particles.min.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/scripts.js"></script>
<script src="js/header-mobile.js"></script>
<?php if ($settingsprint['ayar_leoder']==1) { ?>
<script src="js/royal_preloader.min.js"></script>
<?php } ?>
<script src="plugins/revolution/revolution/js/jquery.themepunch.tools.min.js"></script>
<script src="plugins/revolution/revolution/js/jquery.themepunch.revolution.min.js"></script>
<script src="plugins/revolution/revolution/js/extensions/revolution-plugin.js"></script>
<script src="js/rev-script-2.js"></script>
</body>

</html>
<?php if ($settingsprint['ayar_leoder']==1) { ?>
<script type="text/javascript">
window.jQuery = window.$ = jQuery;
(function($) {
    "use strict";
    //Preloader
    Royal_Preloader.config({
        mode: 'logo',
        logo: '<?php echo "admin/".$settingsprint['ayar_logo']; ?>',
        logo_size: [160, 75],
        showProgress: true,
        showPercentage: true,
        text_colour: '#000000',
        background: '#ffffff'
    });
})(jQuery);
</script>
<?php } ?>
<?php echo $motorprint['motor_analitik']; ?>
<?php echo $motorprint['motor_metrika']; ?>
<?php echo $settingsprint['ayar_kod']; ?>
<script src="admin/assets/lib/sweet-alerts2/sweetalert2.min.js"></script>
<?php if (@$_SESSION['status']=="demo") { ?>
<script>
$(document).ready(function() {
    swal({
        title: "OoPs!",
        text: "Demo Modda İşlem Yapılamaz!",
        type: "warning",
        showConfirmButton: false,
        timer: '4000'
    });
});
</script>

<?php unset($_SESSION['status']); }  ?>
<?php if (@$_GET['status']=='ok') { ?>
<script>
$(document).ready(function() {
    swal({
        title: "TAMAMLANDI!",
        text: "İşlem Başarılı Bir Şekilde Tamamlandı.",
        type: "success",
        timer: '5000',
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
 $hesapa=$db->prepare("SELECT * from smenu where smenu_id=11");
 $hesapa->execute(array(0));
 $hesapprinta=$hesapa->fetch(PDO::FETCH_ASSOC);

 $sayfaURL .= "://";
 $sayfaURL .= $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"];
 ?>
<meta http-equiv="refresh" content="5; URL=<?php echo substr($sayfaURL,0, -10);?>">
<?php

} elseif (@$_GET['status']=='kk_ok') { ?>
<script>
$(document).ready(function() {
    swal({
        title: "TAMAMLANDI!",
        text: "Kredi kartı ödemesi başarıyla tamamlandı.",
        type: "success",
        timer: '5000',
        showConfirmButton: false
    });
});
</script>
<meta http-equiv="refresh" content="5; URL=index.php">
<?php

}  elseif (@$_GET['captcha']=='no') {?>
<script>
$(document).ready(function() {
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
<?php } elseif (@$_GET['status']=='kk_err') { ?>
<script>
$(document).ready(function() {
    swal({
        title: "HATA!",
        text: "Kredi kartı ödemesinde bir sorun oluştu. Lütfen yönetici ile iletişime geçiniz!",
        type: "error",
        timer: '5000',
        showConfirmButton: false
    });
});
</script>
<meta http-equiv="refresh" content="5; URL=index.php">
<?php

} elseif (@$_GET['uye']=='ok') { ?>
<script>
$(document).ready(function() {
    swal({
        title: "TAMAMLANDI!",
        text: "Üyeliğinizi oluşturuldu. Onay için Mail adresinizi kontrol ediniz.",
        type: "success",
        timer: '5000',
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
$hesapa=$db->prepare("SELECT * from smenu where smenu_id=11");
$hesapa->execute(array(0));
$hesapprinta=$hesapa->fetch(PDO::FETCH_ASSOC);

$sayfaURL .= "://";
$sayfaURL .= $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"];
?>
<meta http-equiv="refresh" content="5; URL=<?php echo substr($sayfaURL,0, -7);?>">
<?php } elseif (@$_GET['status']=='no') { ?>
<script>
$(document).ready(function() {
    swal({
        title: "HATA!",
        text: "İşlem sırasında bir hata oluştu.",
        type: "error",
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
<meta http-equiv="refresh" content="5; URL=<?php echo substr($sayfaURL,0, -10);?>">
<?php } elseif (@$_GET['demo']=='ok') {?>
<script>
$(document).ready(function() {
    swal({
        title: "OoPs!",
        text: "Demo modda bu işleme izin verilmiyor.<br />",
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
<?php } ?>
<?php if (@$_GET['status']=='exit') {?>
<script>
$(document).ready(function() {
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
<?php } ?>