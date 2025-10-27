<?php require 'include/header.php';
if (!empty($_GET['paket_id'])) { 
$gelenler = htmlspecialchars(trim($_GET['paket_id']));
$kategori=$db->prepare("SELECT * from kategoripaket where kategori_id=:kategori_id");
$kategori->execute(array(
    'kategori_id' => htmlspecialchars(trim($_GET['paket_id']))
));
$kategoriyaz=$kategori->fetch(PDO::FETCH_ASSOC);
$meta = [
    'title' => $kategoriyaz['kategori_title'],
    'keywords' => $kategoriyaz['kategori_descr'],
    'description' => $kategoriyaz['kategori_keyword']
]; 
} else {
    $metakey=$db->prepare("SELECT * from meta where meta_id=12");
    $metakey->execute(array(0));
    $metakeyprint=$metakey->fetch(PDO::FETCH_ASSOC);
    $meta = [
        'title' => $metakeyprint['meta_title'],
        'keywords' => $metakeyprint['meta_keyword'],
        'description' => $metakeyprint['meta_descr']
    ];
}
require 'include/menu.php'; ?>
<div id="content" class="site-content">
    <div class="page-header dtable text-center" style="background-image: url(admin/<?php echo $settingsprint['resim_title']; ?>);">
        <div class="dcell">
            <div class="container">
                <h1 class="page-title"><?php echo htmlspecialchars($widgetprint['widget_bwelcome1']); ?></h1>
                <ul id="breadcrumbs" class="breadcrumbs">
                    <li><a href="<?php echo $settingsprint['ayar_siteurl']; ?>">Anasayfa</a></li>
                </ul>
            </div>
        </div>
    </div>
    <section class="home4-pricing p-b50  m-t100  m-b100 particles-js" data-color="#fe4c1c,#00c3ff,#0160e7" data-id="i5-1" style="padding: 0;">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="ot-tabs">
                        <ul class="unstyle text-center" style="display: flex; flex-wrap: wrap; margin-right: -15px; margin-left: -15px; place-content: space-between space-around; align-items: center; background-size: cover; justify-content: center;">
                            <a class="octf-btn  <?php if (empty($gelenler)) {  echo "octf-btn"; } else { echo "octf-btn-white"; } ?>" style="margin-right: 10px;" href="paketler"><img style="height: 60px;" src="images/expand.png" alt="Paketler"> Tüm Paketler</a>
                            <?php  $katFirst=0; 
                                $paketkategori=$db->prepare("SELECT * from kategoripaket");
                                $paketkategori->execute(array(0));  
                        foreach ($paketkategori as $key => $eskikategoriyaz) { 
                            $urunVarmi =0;
                            $urunsor=$db->prepare("SELECT * from urunler where urun_paket='1' and urun_kategori=:kategori");
                            $urunsor->execute(array('kategori' => $eskikategoriyaz['kategori_id']));
                            $urunVarmi = $urunsor->rowCount();
                            if ($urunVarmi>0) {  ?>
                            <a class="octf-btn  <?php if ($eskikategoriyaz['kategori_id']==$gelenler) {  echo "octf-btn"; } else { echo "octf-btn-white"; } ?>" style="margin-right: 10px;" href="<?=$settingsprint['ayar_siteurl'].seo('paket-'.$eskikategoriyaz["kategori_ad"]).'-'.$eskikategoriyaz["kategori_id"]?>">
                                <img style="height: 60px;" src="admin/<?php echo $eskikategoriyaz['resim']; ?>" alt="<?php echo $eskikategoriyaz['kategori_ad']; ?>"> <?php echo $eskikategoriyaz['kategori_ad']; ?>
                            </a>
                            <?php $katFirst++; } } ?>
                        </ul>
                        <?php 
                    ?>
                        <div id="tab-" class="tab-content <?php if ($kataltFirst==0) {  echo "current"; } ?>" style="background: none;">
                            <div class="row" style="display: flex; flex-wrap: wrap; margin-right: -15px; margin-left: -15px; place-content: space-between space-around; align-items: center; background-size: cover;">
                                <?php 
                            $urr=0;
                            if (!empty($gelenler)) {
                                $urunsor=$db->prepare("SELECT * from urunler where urun_paket='1' and urun_kategori=:kategorix order by urun_kategori ASC");
                                $urunsor->execute(array('kategorix' => $gelenler)); 
                            } else {
                                $urunsor=$db->prepare("SELECT * from urunler where urun_paket='1' order by urun_kategori ASC");
                                $urunsor->execute(array(0));
                                
                                
                            }
                            foreach ($urunsor as $key => $uruncek) {  
                                $eskikategori=$db->prepare("SELECT * from kategoripaket where kategori_id=:kategori_id");
                                $eskikategori->execute(array(
                                    'kategori_id' => $uruncek['urun_kategori']
                                ));
                                $eskikategoriyaz=$eskikategori->fetch(PDO::FETCH_ASSOC);
                                if ($urr==3) {
                                    $urr=0;
                                }
                                ?>

                                <div class="col-md-4 col-sm-12 col-xs-12  m-b50">
                                    <div class="ot-pricing-table bg-shape <?php if($urr==0) { echo "s1"; } ?><?php if($urr==1) { echo "s3 feature"; } ?><?php if($urr==2) { echo "s2"; } ?>">
                                        <span class="title-table"><?php echo $uruncek['urun_baslik']; ?></span>
                                        <div class="inner-table">
                                            <img src="admin/<?php echo $eskikategoriyaz['resim']; ?>" alt="Executive">
                                            <h2><sup><i class="fas fa-lira-sign"></i></sup> <?php echo $uruncek['urun_fiyat']; ?> <small>+KDV</small></h2>
                                            <p>
                                            <h5 class="card-title text-muted text-uppercase text-center"><a href="<?php echo $settingsprint['ayar_siteurl']; ?><?=seo('paket-'.$eskikategoriyaz["kategori_ad"]).'-'.$eskikategoriyaz["kategori_id"]?>"><?php echo $eskikategoriyaz['kategori_ad']; ?> </a></h5>
                                            </p>
                                            <div class="details">
                                                <ul>
                                                    <?php 
                                                $icerik = $uruncek['urun_aciklama'];

                                                $satir = explode ("\n",$icerik);
                                                ?>
                                                    <?php foreach ($satir as $val) { ?>
                                                    <li><?=$val?></li>
                                                    <?php } ?>
                                                </ul>
                                            </div>
                                        </div>
                                        <form method="post" action="">
                                            <input type="hidden" name="urun_adi" value="<?php echo $uruncek['urun_baslik']; ?>">
                                            <input type="hidden" name="urun_paket" value="<?php echo $uruncek['urun_paket']; ?>">
                                            <input type="hidden" name="urun_adet" value="1">
                                            <input type="hidden" name="urun_fiyat" value="<?php echo $uruncek['urun_fiyat']; ?>">
                                            <input type="hidden" name="urun_id" value="<?php echo $uruncek['urun_id']; ?>">

                                            <div class="plan-button">
                                                <button name="sepetle" type="submit" class="octf-btn octf-btn-icon octf-btn-third">Sepete Ekle <i class="fa fa-shopping-cart"></i></button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <?php $urr++;  }   ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<?php  include 'include/footer.php'; ?>