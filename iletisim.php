<?php require 'include/header.php';
$metakey=$db->prepare("SELECT * from meta where meta_id=8");
$metakey->execute(array(0));
$metakeyprint=$metakey->fetch(PDO::FETCH_ASSOC);
$meta = [
  'title' => $metakeyprint['meta_title'],
  'keywords' => $metakeyprint['meta_keyword'],
  'description' => $metakeyprint['meta_descr']
]; require 'include/menu.php'; ?>
<div id="content" class="site-content">
    <div class="page-header dtable text-center">
        <?php echo $settingsprint['ayar_harita']; ?>
    </div>
    <section class="bg-faq-bot p-b120 m-t100 particles-js" data-color="#fe4c1c,#00c3ff,#0160e7" data-id="a1">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                    <div class="icon-box s3 box-hover-gradient text-center">
                        <div class="bg-s3"></div>
                        <div class="bg-before" style="background: url('images/bg1-box.png') top left no-repeat #fff;"></div>
                        <div class="bg-after" style="background: url('images/bg2-box.png') bottom right no-repeat #fff;"></div>
                        <div class="icon-main">
                            <span style="padding-top: 18px;" class="fas fa-headset"></span>
                        </div>
                        <div class="content-box">
                            <h5>Telefon</h5>
                            <p><a class="text-dark" href="tel:<?php echo $settingsprint['ayar_tel']; ?>" title="<?php echo $settingsprint['ayar_tel']; ?>"><?php echo $settingsprint['ayar_tel']; ?></a></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 m-t50">
                    <div class="icon-box s3 box-hover-gradient text-center">
                        <div class="bg-s3"></div>
                        <div class="bg-before" style="background: url('images/bg1-box2.png') top left no-repeat #fff;"></div>
                        <div class="bg-after" style="background: url('images/bg2-box2.png') bottom right no-repeat #fff;"></div>
                        <div class="icon-main">
                            <span style="padding-top: 18px;" class="fas fa-mail-bulk"></span>
                        </div>
                        <div class="content-box">
                            <h5>Mail</h5>
                            <p><a class="text-dark" href="mailto:<?php echo $settingsprint['ayar_mail']; ?>"><?php echo $settingsprint['ayar_mail']; ?></a></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 xs-m-t50">
                    <div class="icon-box s3 box-hover-gradient text-center">
                        <div class="bg-s3"></div>
                        <div class="bg-before" style="background: url('images/bg1-box3.png') top right no-repeat #fff;"></div>
                        <div class="bg-after" style="background: url('images/bg2-box3.png') bottom left no-repeat #fff;"></div>
                        <div class="icon-main">
                            <span style="padding-top: 18px;" class="fa fa-map-marked-alt"></span>
                        </div>
                        <div class="content-box">
                            <h5>Adres</h5>
                            <p><?php echo $settingsprint['ayar_adres']; ?> <b><?php echo $settingsprint['ayar_il']." / ".$settingsprint['ayar_ilce']; ?></b></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="faq-form-wrap border-radius">
                <div class="row">
                    <div class="col-md-12 col-xs-12">
                        <div class="ot-heading text-center text-light">
                            <h2 class="main-heading">İletişim Formu</h2>
                        </div>
                        <form action="admin/controller/function.php" method="post" class="wpcf7-form">
                            <div class="faq-form row">
                                <p class="col-md-6 col-xs-12">
                                    <span class="wpcf7-form-control-wrap your-name">
                                        <input type="text" name="mesaj_ad" class="form-control" placeholder="Ad Soyad *" required="">
                                    </span>
                                </p>
                                <p class="col-md-6 col-xs-12">
                                    <span class="wpcf7-form-control-wrap your-email">
                                        <input type="email" name="mesaj_mail" class="form-control" placeholder="Mail Adresi *" required="">
                                    </span>
                                </p>
                                <p class="col-md-12 col-xs-12">
                                    <span class="wpcf7-form-control-wrap your-message">
                                        <textarea name="mesaj_icerik" cols="40" rows="3" class="" placeholder="Mesajınız... *" required=""></textarea>
                                    </span>
                                </p>
                                <div class="col-md-12 col-xs-12 text-center g-recaptcha" data-sitekey="<?=$linkApi['ranahtar']?>"></div>
                                <p class="col-md-12 col-xs-12 m-t10 text-center">
                                    <button type="submit" name="iletisimform" class="octf-btn octf-btn-icon octf-btn-primary">Mesajı Gönder<i class="flaticon-right-arrow-1"></i></button>
                                </p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<?php  include 'include/footer.php'; ?>