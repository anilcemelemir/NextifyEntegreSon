<?php require 'include/header.php';
$kategori = htmlspecialchars(trim(@$_GET['kategori_id']));
if (!empty($kategori)) {
    $kategoriedit=$db->prepare("SELECT * from kategoriler where kategori_id=:kategori_id");
    $kategoriedit->execute(array(
        'kategori_id' => $kategori
    ));
    $kategoriwrite=$kategoriedit->fetch(PDO::FETCH_ASSOC);
    $meta = [
        'title' => $kategoriwrite['kategori_title'],
        'keywords' => $kategoriwrite['kategori_keyword'],
        'description' => $kategoriwrite['kategori_descr']
    ];
} else {    
    $metakey=$db->prepare("SELECT * from meta where meta_id=1");
    $metakey->execute(array(0));
    $metakeyprint=$metakey->fetch(PDO::FETCH_ASSOC);
    $meta = [
        'title' => $metakeyprint['meta_title'],
        'keywords' => $metakeyprint['meta_keyword'],
        'description' => $metakeyprint['meta_descr']
    ];
} require 'include/menu.php'; 
$sayfada = 9; // sayfada gösterilecek içerik miktarını belirtiyoruz.

if (!empty($kategori)) {
    $sorgu=$db->prepare("SELECT * from urunler where urun_paket='0' and urun_kategori=$kategori");
} else {
    $sorgu=$db->prepare("SELECT * from urunler where urun_paket='0'");
}
$sorgu->execute();
$toplam_icerik=$sorgu->rowCount();

$toplam_sayfa = ceil($toplam_icerik / $sayfada);

                  // eğer sayfa girilmemişse 1 varsayalım.
$sayfa = isset($_GET['sayfa']) ? (int) $_GET['sayfa'] : 1;

                // eğer 1'den küçük bir sayfa sayısı girildiyse 1 yapalım.
if($sayfa < 1) $sayfa = 1; 

                // toplam sayfa sayımızdan fazla yazılırsa en son sayfayı varsayalım.
if($sayfa > $toplam_sayfa) $sayfa = $toplam_sayfa; 

$limit = ($sayfa - 1) * $sayfada;
if (!empty($kategori)) {
    $blog=$db->prepare("SELECT * from urunler  where urun_paket='0' and urun_kategori=$kategori order by urun_id DESC Limit $limit,$sayfada");
    $blog->execute(array(
        'bloglimit' => "$limit,$sayfada"
    )); 
} else {    
    $blog=$db->prepare("SELECT * from urunler  where urun_paket='0' order by urun_id DESC Limit $limit,$sayfada");
    $blog->execute(array(
        'bloglimit' => "$limit,$sayfada"
    )); 
}
?>
<div id="content" class="site-content">
    <div class="page-header dtable text-center" style="background-image: url(admin/<?php echo $settingsprint['resim_title']; ?>);">
        <div class="dcell">
            <div class="container">
                <h1 class="page-title"><?php if (empty($kategori)) {  ?> Ürünler <?php } else { ?><a class="text-dark" href="<?= seo( 'konu-kategori-' . $kategoriwrite[ "kategori_ad" ] ) . '-' . $kategoriwrite[ "kategori_id" ] ?>"><?php echo $kategoriwrite['kategori_ad'] ?></a> <?php } ?></h1>
                <ul id="breadcrumbs" class="breadcrumbs">
                    <li><a href="<?php echo $settingsprint['ayar_siteurl']; ?>">Anasayfa</a></li>
                    <li class="<?php if (empty($kategori)) {  ?> active <?php } ?>">
                        <?php if (empty($kategori)) {  ?> Ürünler <?php } else { ?><a href="urunler">Ürünler</a> <?php } ?>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <section class="woocommerce particles-js m-t100" data-color="#fe4c1c,#00c3ff,#0160e7" data-id="i1-2">
        <div class="bg-overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-xs-12">
                    <main id="main" class="site-main">
                        <ul class="products columns-3">
                            <?php $urunSiralama = 0; 
                            foreach ($blog as $key => $uruncek) { if ($urunSiralama==3) { $urunSiralama=0;} $urunSiralama ++; 
                                $resimsor=$db->prepare("SELECT * from resim where resim_urun=:resim_urun Limit 1");
                                $resimsor->execute(array(
                                    'resim_urun' => $uruncek['urun_id']
                                ));
                                ?>
                            <li class="product <?php if ($urunSiralama==1) {  echo "first"; } elseif ($urunSiralama==3) { echo "last"; } ?>">
                                <div class="product-media">
                                    <?php while($resimcek=$resimsor->fetch(PDO::FETCH_ASSOC)) {  ?>
                                    <img src="admin/<?php echo $resimcek['resim_link'] ?>" alt="<?php echo $uruncek['urun_baslik']; ?>">
                                    <?php } ?>
                                    <div class="wrapper-add-to-cart">
                                        <div class="add-to-cart-inner">
                                            <a target="_blank" href="<?php echo $uruncek['urun_demo']; ?>" style="margin-bottom: 15px;" class="button product_type_simple add_to_cart_button ajax_add_to_cart octf-btn octf-btn-primary octf-btn-icon">Demo Göster <i class="fas fa-link"></i></a>
                                            <a href="<?=seo('detay-'.$uruncek["urun_baslik"]).'-'.$uruncek["urun_id"]?>" class="button product_type_simple add_to_cart_button ajax_add_to_cart octf-btn octf-btn-primary octf-btn-icon">Ürün Detayı <i class="fas fa-angle-double-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <h2 class="woocommerce-loop-product__title"><a href="<?=seo('detay-'.$uruncek["urun_baslik"]).'-'.$uruncek["urun_id"]?>"><?php 
                                     $urunkarakter = strlen( $uruncek['urun_baslik'] );
                                     if ( $urunkarakter > 30 )
                                     {
                                        echo mb_substr($uruncek['urun_baslik'], 0,30, 'UTF-8');
                                    } else {
                                        echo $uruncek['urun_baslik']; 
                                    }  ?> </a></h2>
                                <div class="star-rating">
                                    <span><i class="fa fa-star"></i></span>
                                    <span><i class="fa fa-star"></i></span>
                                    <span><i class="fa fa-star"></i></span>
                                    <span><i class="fa fa-star"></i></span>
                                    <span><i class="fa fa-star"></i></span>
                                </div>
                                <span class="price">
                                    <span class="woocommerce-Price-amount amount">
                                        <span class="woocommerce-Price-currencySymbol"><i class="fas fa-lira-sign"></i></span><?php echo $uruncek['urun_fiyat']; ?>
                                    </span>
                                </span>
                            </li>
                            <?php } ?>
                        </ul>
                    </main>
                    <div class="row">
                        <div class="col-md-12">
                            <ul class="page-pagination text-center p-b60">
                                <?php $gosterilecekbuton = 3; // gösterilecek sayfa.
                            if ($sayfa > 1) { ?>
                                <li>
                                    <a class="next page-numbers" href="?sayfa=<?php echo $sayfa-1; ?>"><i class="flaticon-arrow-pointing-to-left"></i></a>
                                </li>
                                <?php }
                        for ($i= $sayfa - $gosterilecekbuton; $i < $sayfa + $gosterilecekbuton +1; $i++) {
                            if ($i > 0 and $i <= $toplam_sayfa) {
                                    if ($i == $sayfa) { ?>
                                <li><span aria-current="page" class="page-numbers current"><?php echo $i ?></span></li>
                                <?php } else { ?>
                                <li><a class="page-numbers" href="?sayfa=<?php echo $i ?>"><?php echo $i ?></a></li>
                                <?php } } }
                        if ($sayfa != $toplam_sayfa) {  ?>
                                <li>
                                    <a class="next page-numbers" href="?sayfa=<?php echo $sayfa+1; ?>"><i class="flaticon-arrow-pointing-to-right"></i></a>
                                </li>
                                <?php } ?>
                            </ul>
                        </div>
                    </div>
                </div>
                <?php include 'include/sidebar-pr.php'; ?>
            </div>
        </div>
    </section>
</div>

<?php  include 'include/footer.php'; ?>