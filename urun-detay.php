<?php require 'include/header.php';

$urunsor=$db->prepare("SELECT * from urunler where urun_id=:urun_id");
$urunsor->execute(array(
    'urun_id' => $_GET['urun_id']
));
$uruncek=$urunsor->fetch(PDO::FETCH_ASSOC);
$meta = [
    'title' => $uruncek['urun_title'],
    'keywords' => $uruncek['urun_keyword'],
    'description' => $uruncek['urun_descr']
]; 
require 'include/menu.php';
$urunresimsor=$db->prepare("SELECT * from resim where resim_urun=:resim_urun");
$urunresimsor->execute(array(
    'resim_urun' => $uruncek['urun_id']
)); 

$urunresimsor2=$db->prepare("SELECT * from resim where resim_urun=:resim_urun");
$urunresimsor2->execute(array(
    'resim_urun' => $uruncek['urun_id']
)); 
$kategoriedit=$db->prepare("SELECT * from kategoriler where kategori_id=:kategori_id");
$kategoriedit->execute(array(
    'kategori_id' => $uruncek['urun_kategori']
));
$kategoriwrite=$kategoriedit->fetch(PDO::FETCH_ASSOC);


if ( isset( $_POST[ 'sepetleoz' ] ) )
{


    $urunsorfy=$db->prepare("SELECT * from urunler where urun_id=:urun_id");
    $urunsorfy->execute(array(
        'urun_id' => $_POST['urun_id']
    ));
    $urunfycek=$urunsorfy->fetch(PDO::FETCH_ASSOC);

    foreach ($_POST['ozel'] as $val) {
        $ozellik .= " -".htmlspecialchars(strip_tags($val))."<br>";
    }
    $urunbilgi = "<b>".htmlspecialchars($_POST['urun_adi'])."-".htmlspecialchars($urunfycek['urun_fiyat'])."TL</b>";
    if ($_POST['hosting']) {
        $hosting = "<br><b>Hosting: </b>".htmlspecialchars($_POST['hosting']);
    } else {
        $hosting = "";
    }
    if ($_POST['alanadi']) {
        $alanadi = "<br><b>Alan Adı: </b>".htmlspecialchars($_POST['alanadi']);
    } else {
        $alanadi = "";
    }
    if ($ozellik) {
        $ozellik = "<br>".$ozellik;
    } else {
        $ozellik = "";
    }


    $urunAdi = $urunbilgi.$alanadi.$hosting.$ozellik;
    
    $update     = array(
        'id'  => htmlspecialchars($_POST['urun_id']),
        'paket'  => htmlspecialchars($_POST['urun_paket']),
        'urun' => $urunAdi,
        'fiyat' => htmlspecialchars($_POST['urun_fiyat'])
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
<div id="content" class="site-content">
    <div class="page-header dtable text-center" style="background-image: url(admin/<?php echo $settingsprint['resim_title']; ?>);">
        <div class="dcell">
            <div class="container">
                <h1 class="page-title"><?php echo $uruncek['urun_baslik']; ?></h1>
                <ul id="breadcrumbs" class="breadcrumbs">
                    <li><a href="<?php echo $settingsprint['ayar_siteurl']; ?>">Anasayfa</a>
                    </li>
                    <li class="<?php if (empty($kategori)) {  ?> active <?php } ?>">
                        <a href="urunler">Ürünler</a>
                    </li>
                    <li class="active">
                        <a href="<?=seo('urun-kategori-'.$kategoriwrite["kategori_ad"]).'-'.$kategoriwrite["kategori_id"]?>"><?php echo $kategoriwrite['kategori_ad'] ?></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="content-product-wrapper" style="padding: 90px 0px 0px;">
        <div class="container">
            <div class="row">
                <div id="primary" class="content-area col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <main id="main" class="site-main">
                        <div class="product">
                            <div class="woocommerce-product-gallery woocommerce-product-gallery--with-images woocommerce-product-gallery--columns-4 images">
                                <div class="slider-product">
                                    <?php while($urunresimcek=$urunresimsor->fetch(PDO::FETCH_ASSOC)) { ?>
                                    <div class="item">
                                        <img src="admin/<?php echo $urunresimcek['resim_link'] ?>" alt="<?php echo $uruncek['urun_baslik']; ?>">
                                    </div>
                                    <?php } ?>
                                </div>
                                <div class="slider-product-nav">
                                    <?php while($urunresimcek2=$urunresimsor2->fetch(PDO::FETCH_ASSOC)) { ?>
                                    <div class="item">
                                        <img src="admin/<?php echo $urunresimcek2['resim_link'] ?>" alt="<?php echo $uruncek['urun_baslik']; ?>" draggable="false">
                                    </div>
                                    <?php } ?>
                                </div>
                                <div class="row" style="margin-top:50px;display: flex; flex-wrap: wrap; margin-right: -15px; margin-left: -15px; place-content: space-between space-around; align-items: center; background-size: cover;">
                                    <div class="col-md-6 col-sm-12 col-xs-12 text-center" style="margin-bottom: 10px;">
                                        <a target="_target" href="<?php echo $uruncek['urun_demo']; ?>" class="octf-btn octf-btn-primary octf-btn-icon">
                                            DEMO SİTE <i class="fas fa-angle-double-right"></i>
                                        </a>
                                    </div>
                                    <div class="col-md-6 col-sm-12 col-xs-12 text-center" style="margin-bottom: 10px;">
                                        <a target="_target" href="<?php echo $uruncek['urun_admin']; ?>" class="octf-btn octf-btn-primary octf-btn-icon">
                                            DEMO ADMİN <i class="fas fa-angle-double-right"></i>
                                        </a>
                                    </div>
                                </div>
                                <?php if ($uruncek['urun_auser']&&$uruncek['urun_apass']) {  ?>
                                <div class="col-md-12 text-center">
                                    <b>Admin Kullanıcı:</b> <?php echo $uruncek['urun_auser']; ?>
                                    <br>
                                    <b>Admin Şifre:</b> <?php echo $uruncek['urun_apass']; ?>
                                </div><br>
                                <?php } ?>
                            </div>
                            <div class=" summary entry-summary">
                                <div class="modal-product-info">
                                    <div class="product-head">
                                        <h2 class="title"><?php echo $uruncek['urun_baslik']; ?></h2>
                                        <?php if ($widgetprint['widget_usatinal']==1) { ?>
                                        <form method="post" action="">
                                            <input type="hidden" name="urun_adi" value="<?php echo $uruncek['urun_baslik']; ?>">
                                            <input type="hidden" name="urun_paket" value="<?php echo $uruncek['urun_paket']; ?>">
                                            <input type="hidden" class="urun_fiyat" name="urun_fiyat" value="<?php echo $uruncek['urun_fiyat']; ?>">
                                            <input type="hidden" class="urun_fiyathost" name="urun_fiyathost" value="0">
                                            <input type="hidden" name="urun_id" value="<?php echo $uruncek['urun_id']; ?>">
                                            <div class="product-discount">
                                                <span class="regular-price price">
                                                    <del><i class="fa fa-try"></i><b><?php echo $uruncek['urun_efiyat']; ?></b></del>
                                                    <i class="fa fa-try"></i> <b class="woocommerce-Price-amount amount" id="fiyatAlani" val="<?php echo $uruncek['urun_fiyat']; ?>"><?php echo $uruncek['urun_fiyat']; ?></b>
                                                </span>
                                                <small>+KDV</small>
                                            </div>
                                            <?php if ($uruncek['alanadi']) { ?>
                                            <div class="form-group" style="margin-bottom: 30px;">
                                                <label for="exampleFormControlInput1">Alan Adınız</label>
                                                <input type="text" required="" class="form-control" id="exampleFormControlInput1" name="alanadi" placeholder="alanadi.com">
                                            </div>
                                            <?php } if ($uruncek['hosting']) { ?>
                                            <div class="form-group" style="margin-bottom: 30px;">
                                                <label for="exampleFormControlSelect1">Hosting Paketleri</label>
                                                <select name="hosting" style="height: 48px; border-radius: 24px; font-size: 15px; padding-left: 18px;" class="form-control  country_to_state country_select select2-hidden-accessible ozelhost" id="exampleFormControlSelect1">
                                                    <option data="0" value="">İstemiyorum</option>
                                                    <?php 
                                              $hostEk=$db->prepare("SELECT * from eklenti where cinsi=:cinsi order by sira ASC");
                                              $hostEk->execute(array('cinsi' => 0));
                                              while ($hostEkCek=$hostEk->fetch(PDO::FETCH_ASSOC)) { ?>
                                                    <option data="<?=$hostEkCek['fiyat']?>" value="<?php echo $hostEkCek['ad']." +".$hostEkCek['fiyat']."TL"; ?>">
                                                        <?php echo $hostEkCek['ad']." +".$hostEkCek['fiyat']."TL"; ?>
                                                    </option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                            <?php } if ($uruncek['eklenti']) { ?>
                                            <div class="filter-check-box mb-0">
                                                <?php 
                                                $EkEk=$db->prepare("SELECT * from eklenti where cinsi=:cinsi order by sira ASC");
                                                $EkEk->execute(array('cinsi' => 1));
                                                while ($EkEkCek=$EkEk->fetch(PDO::FETCH_ASSOC)) { ?>
                                                <input name="ozel[]" class="form-check-input ozel" data="<?=$EkEkCek['fiyat']?>" type="checkbox" id="gridCheck<?php echo $EkEkCek['id']; ?>" value="<?php echo $EkEkCek['ad']." <b>+".$EkEkCek['fiyat']."TL</b>"; ?>">
                                                <label class="form-check-label" for="gridCheck<?php echo $EkEkCek['id']; ?>" data-toggle="tooltip" data-html="true" title="<?php echo $EkEkCek['aciklama']; ?>">
                                                    <?php echo $EkEkCek['ad']." <b>+".$EkEkCek['fiyat']."TL</b>"; ?>
                                                </label><br>
                                                <?php } ?>
                                            </div>
                                            <?php } ?>
                                            <div style="margin-top: 20px">
                                                <button name="sepetleoz" type="submit" class="octf-btn octf-btn-primary octf-btn-icon">
                                                    <span>
                                                        Sepete Ekle
                                                        <i class="fa fa-shopping-cart"></i>
                                                    </span>
                                                </button>
                                            </div>
                                        </form>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="woocommerce-tabs wc-tabs-wrapper ot-tabs">
                            <ul class="tabs-heading unstyle" style="display: inline-flex;">
                                <li class="tab-link octf-btn current" data-tab="tab-1454">Detaylar</li>
                                <li class="tab-link octf-btn" data-tab="tab-2454">Sık Sorulan Sorular</li>
                            </ul>
                            <div id="tab-1454" class="tab-content current">
                                <p><?php echo $uruncek['urun_aciklama']; ?></p>
                            </div>
                            <div id="tab-2454" class="tab-content">
                                <div class="ot-accordions accordions-gradient"><?php 
                                    $ssssor=$db->prepare("SELECT * from sss order by sss_sira ASC");
                                    $ssssor->execute();
                                    $firstt = 0;
                                    foreach ($ssssor as  $ssscek) { ?>
                                    <div class="acc-item <?php if ($firstt == 0) { ?> current <?php } ?>">
                                        <span class="acc-toggle"><?php echo $ssscek['sss_soru']; ?> <i class="down flaticon-arrow-pointing-to-down"></i><i class="up flaticon-arrow-pointing-to-up"></i></span>
                                        <div class="acc-content <?php if ($firstt == 0) { ?> active <?php } ?>" <?php if ($firstt == 0) { ?> style="display: block;" <?php } ?>>
                                            <p><?php echo $ssscek['sss_cevap']; ?></p>
                                        </div>
                                    </div>
                                    <?php $firstt += 1; } ?>
                                </div>
                                <div class="clear"></div>
                            </div>

                        </div>
                        <section class="related products">
                            <h2>Öne Çıkanlar</h2>
                            <ul class="products columns-4">

                                <?php $urunSiralama = 0;
                            $urunsor=$db->prepare("SELECT * from urunler where urun_paket='0' and urun_vitrin=1 order by RAND() DESC Limit 4");
                            $urunsor->execute(); 
                            foreach ($urunsor as $key => $uruncek) { if ($urunSiralama==5) { $urunSiralama=0;} $urunSiralama ++; 
                                $resimsor=$db->prepare("SELECT * from resim where resim_urun=:resim_urun Limit 1");
                                $resimsor->execute(array(
                                    'resim_urun' => $uruncek['urun_id']
                                ));
                                ?>
                                <li class="product <?php if ($urunSiralama==1) {  echo "first"; } elseif ($urunSiralama==4) { echo "last"; } ?>">
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
                        </section>
                    </main>
                </div>

            </div>
        </div>
    </div>
</div>

<?php  include 'include/footer.php'; ?>

<script>
$(function() {

    $(".ozel").click(function() {
        if ($(this).is(':checked')) {
            var sayi2 = Number($("#fiyatAlani").html());
            var sayi1 = Number($(this).attr('data'));
            var toplam = sayi1 + sayi2;
            $("#fiyatAlani").html(toplam);
            $('input.urun_fiyat').val(toplam);
        } else {
            var sayi2 = Number($("#fiyatAlani").html());
            var sayi1 = Number($(this).attr('data'));
            var toplam = Number(sayi2 - sayi1);
            $("#fiyatAlani").html(toplam);
            $('input.urun_fiyat').val(toplam);
        }
    });
    $(".ozelhost").change(function() {
        if ($(".ozelhost option:selected").attr('data') != 0) {
            if ($('input.urun_fiyathost').val() != 0) {

                var sayi2 = Number($("#fiyatAlani").html());
                var sayi1 = Number($('input.urun_fiyathost').val());
                var toplam = Number(sayi2 - sayi1);
                $("#fiyatAlani").html(toplam);
                $('input.urun_fiyathost').val(0);

            }
            var sayi2 = Number($("#fiyatAlani").html());
            var sayi1 = Number($(".ozelhost option:selected").attr('data'));
            var toplam = Number(sayi2 + sayi1);
            $("#fiyatAlani").html(toplam);
            $('input.urun_fiyat').val(toplam);
            $('input.urun_fiyathost').val($(".ozelhost option:selected").attr('data'));


        } else {
            var sayi2 = Number($("#fiyatAlani").html());
            var sayi1 = Number($('input.urun_fiyathost').val());
            var toplam = Number(sayi2 - sayi1);
            $("#fiyatAlani").html(toplam);
            $('input.urun_fiyat').val(toplam);
            $('input.urun_fiyathost').val(0);
        }
    });
})
</script>