<?php require 'include/header.php';
$metakey=$db->prepare("SELECT * from meta where meta_id=10");
$metakey->execute(array(0));
$metakeyprint=$metakey->fetch(PDO::FETCH_ASSOC);
$meta = [
  'title' => $settingsprint['ayar_title'],
  'keywords' => $settingsprint['ayar_description'],
  'description' => $settingsprint['ayar_keywords']
]; require 'include/menu.php'; ?>
<div id="content" class="site-content">
    <div class="page-header dtable text-center" style="background-image: url(admin/<?php echo $settingsprint['resim_title']; ?>);">
        <div class="dcell">
            <div class="container">
                <h1 class="page-title">Banka Hesaplarimiz</h1>
                <ul id="breadcrumbs" class="breadcrumbs">
                    <li><a href="<?php echo $settingsprint['ayar_siteurl']; ?>">Anasayfa</a></li>
                </ul>
            </div>
        </div>
    </div>
    <section class="p-t100 p-b100">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <div class="ot-heading left-align">
                        <div class="message-box m-b30">
                            <div class="icon-main">
                                <span class="flaticon-info"></span>
                            </div>
                            <div class="content-box">
                                <h6>Uyarı</h6>
                                <p><span>Ödemesini yapmak istediğiniz siparişe ait sipariş noyu mutlaka havale açıklama bölümünde belirtiniz.<a href="hesabim/siparisler" type="button" class="btn btn-outline-maincolor text-center"><span>Siparişlerim</span></a></span></p>
                            </div>
                            <i class="flaticon-close"></i>
                        </div>
                        <h2 class="main-heading">Banka Hesaplarimiz</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <div class="ot-accordions accordions-gradient">
                        <?php 
                        $hesapsor=$db->prepare("SELECT * from hesap");
                        $hesapsor->execute();
                        $firstt = 0;
                        while($hesapcek=$hesapsor->fetch(PDO::FETCH_ASSOC)) { ?>
                        <div class="acc-item <?php if ($firstt == 0) { ?> current <?php } ?>">
                            <span class="acc-toggle"><?php echo $hesapcek['hesap_banka']; ?> <i class="down flaticon-arrow-pointing-to-down"></i><i class="up flaticon-arrow-pointing-to-up"></i></span>
                            <div class="acc-content <?php if ($firstt == 0) { ?> active <?php } ?>" <?php if ($firstt == 0) { ?> style="display: block;" <?php } ?>>
                                <p>Ünvan: <span><b><?php echo $hesapcek['hesap_isim']; ?></b></span></p>
                                <p>Şube/Şube no: <span><b><?php echo $hesapcek['hesap_sube']; ?></b></span></p>
                                <p>Hesap no: <span><b><?php echo $hesapcek['hesap_no']; ?></b></span></p>
                                <p>İban: <span><b><?php echo $hesapcek['hesap_iban']; ?></b></span></p>
                            </div>
                        </div>
                        <?php $firstt += 1; } ?>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<?php  include 'include/footer.php'; ?>