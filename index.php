<?php require 'include/header.php';
$meta = [
    'title' => $settingsprint['ayar_title'],
    'keywords' => $settingsprint['ayar_keywords'],
    'description' => $settingsprint['ayar_description']
]; 
require 'include/menu.php';
require 'include/slide.php'; ?>
<?php if ($widgetprint['widget_counter']==1) { ?>
<section class="seo-about p-t100 p-b100 bg-light particles-js" data-color="#fe4c1c,#00c3ff,#0160e7" data-id="i2-2">
    <div class="shape shape-top" data-negative="false">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 100" preserveAspectRatio="none">
            <path class="shape-fill" d="M421.9,6.5c22.6-2.5,51.5,0.4,75.5,5.3c23.6,4.9,70.9,23.5,100.5,35.7c75.8,32.2,133.7,44.5,192.6,49.7c23.6,2.1,48.7,3.5,103.4-2.5c54.7-6,106.2-25.6,106.2-25.6V0H0v30.3c0,0,72,32.6,158.4,30.5c39.2-0.7,92.8-6.7,134-22.4c21.2-8.1,52.2-18.2,79.7-24.2C399.3,7.9,411.6,7.5,421.9,6.5z"></path>
        </svg>
    </div>
    <div class="shape shape-bottom s2" data-negative="false">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 100" preserveAspectRatio="none">
            <path class="shape-fill" d="M421.9,6.5c22.6-2.5,51.5,0.4,75.5,5.3c23.6,4.9,70.9,23.5,100.5,35.7c75.8,32.2,133.7,44.5,192.6,49.7c23.6,2.1,48.7,3.5,103.4-2.5c54.7-6,106.2-25.6,106.2-25.6V0H0v30.3c0,0,72,32.6,158.4,30.5c39.2-0.7,92.8-6.7,134-22.4c21.2-8.1,52.2-18.2,79.7-24.2C399.3,7.9,411.6,7.5,421.9,6.5z"></path>
        </svg>
    </div>
    <div class="container">
        <div class="row">
            <?php $sayYuksek = 0;
            $bilgiler=$db->prepare("SELECT * from bilgi");
            $bilgiler->execute(array(0));
            foreach ($bilgiler as $bilgi) { $sayYuksek ++; ?>
            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 <?php if ($sayYuksek>1) { if ($sayYuksek==2 || $sayYuksek==4) { echo "m-t50"; } if ($sayYuksek==3) { echo "xs-m-t50"; } } ?>">
                <div class="icon-box s3 box-hover-gradient text-center">
                    <div class="bg-s3"></div>
                    <div class="bg-before" style="<?php if ($sayYuksek==1) { echo "background: url('images/bg1-box.png') top left no-repeat #fff;"; } if ($sayYuksek==2) { echo "background: url('images/bg1-box2.png') top left no-repeat #fff;"; } if ($sayYuksek==3) { echo "background: url('images/bg1-box3.png') top right no-repeat #fff;"; } if ($sayYuksek==4) { echo "background: url('images/bg1-box2.png') top left no-repeat #fff;"; } ?>) top left no-repeat #fff;"></div>
                    <div class="bg-after" style="<?php if ($sayYuksek==1) { echo "background: url('images/bg2-box2.png') bottom right no-repeat #fff;"; } if ($sayYuksek==2) { echo "background: url('images/bg2-box3.png') bottom left no-repeat #fff;"; } if ($sayYuksek==3) { echo "background: url('images/bg2-box3.png') bottom left no-repeat #fff;"; } if ($sayYuksek==4) { echo "background: url('images/bg2-box2.png') bottom right no-repeat #fff;"; } ?>"></div>
                    <div class="icon-main">
                        <img class="align-self-center mr-3" src="admin/<?php echo $bilgi['resim']; ?>" alt="icon">
                    </div>
                    <div class="content-box">
                        <h5><?=$bilgi['bilgi_baslik']?></h5>
                        <p><?=$bilgi['bilgi_aciklama']?></p>
                    </div>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>
</section>
<?php } if ($widgetprint['widget_hizmet']==1) { ?>
<section class="woocommerce p-t60 p-b30 xs-p-tb80 particles-js" data-color="#fe4c1c,#00c3ff,#0160e7" data-id="i2-3">
    <div class="content-product-wrapper">
        <div class="container">
            <div class="row p-b40">
                <div class="col-md-8 col-sm-8 col-xs-12">
                    <div class="ot-heading left-align">
                        <h2 class="main-heading"><?php echo $widgetprint['widget_bhizmet']; ?></h2>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12 xs-m-t30 text-right xs-text-left">
                    <div class="ot-button">
                        <a href="urunler" class="octf-btn octf-btn-primary octf-btn-icon"><span>Tümünü Göster <i class="flaticon-right-arrow-1"></i></span></a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div id="primary" class="content-area col-lg-12 col-md-12 col-sm-12 col-xs-12 pull-right">
                    <main id="main" class="site-main">
                        <ul class="products columns-4">
                            <?php $urunSiralama = 0;
                            $urunsor=$db->prepare("SELECT * from urunler where urun_paket='0' and urun_vitrin=1 order by urun_id DESC");
                            $urunsor->execute();
                            foreach ($urunsor as $key => $uruncek) { if ($urunSiralama==4) { $urunSiralama=0;} $urunSiralama ++; 
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
                                    } ?> </a></h2>
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
                </div>
            </div>
        </div>
    </div>
</section>
<?php } if ($widgetprint['widget_galeri']==1) { ?>
<section class="home7-about particles-js  m-b100" data-color="#fe4c1c,#00c3ff,#0160e7" data-id="i1-3">
    <div class="container">
        <div class="row" style="display: flex; flex-wrap: wrap; margin-right: -15px; margin-left: -15px; place-content: space-between space-around; align-items: center; background-size: cover;">
            <div class="col-md-6 col-sm-12 col-xs-12">
                <img style="width:100%;" src="admin/<?php echo $settingsprint['ayar_resimcounter']; ?>" alt="">
            </div>
            <div class="col-md-6 col-sm-12 col-xs-12 align-self-center">
                <div class="home7-about-block">
                    <p class="m-b45"> <?php echo $widgetprint['widget_html']; ?></p>
                </div>
            </div>
        </div>
    </div>
</section>
<?php } if ($widgetprint['widget_welcome1']==1) { ?>
<section class="home4-pricing p-b50  m-t100  m-b100 particles-js" data-color="#fe4c1c,#00c3ff,#0160e7" data-id="i5-1" style="padding: 0;">
    <div class="container">
        <div class="row">
            <div class="ot-heading text-center">
                <h2 class="main-heading"><?php echo htmlspecialchars($widgetprint['widget_bwelcome1']); ?></h2>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="ot-tabs">
                    <ul class="tabs-heading unstyle text-center" style="display: flex; flex-wrap: wrap; margin-right: -15px; margin-left: -15px; place-content: space-between space-around; align-items: center; background-size: cover; justify-content: center;">
                        <li class="tab-link octf-btn current" style="margin-right: 10px;" data-tab="tab-tumu">
                            <img style="height: 60px;" src="images/expand.png" alt="Paketler">
                            Tüm Paketler
                        </li>
                        <?php  $katFirst=0;
                        $paketkategori=$db->prepare("SELECT * from kategoripaket");
                        $paketkategori->execute(array(0)); 
                        foreach ($paketkategori as $key => $eskikategoriyaz) { 
                            $urunVarmi =0;
                            $urunsor=$db->prepare("SELECT * from urunler where urun_vitrin=1 and urun_paket='1' and urun_kategori=:kategori");
                            $urunsor->execute(array('kategori' => $eskikategoriyaz['kategori_id']));
                            $urunVarmi = $urunsor->rowCount();
                            if ($urunVarmi>0) {  ?>
                        <li class="tab-link octf-btn" style="margin-right: 10px;" data-tab="tab-<?php echo $eskikategoriyaz['kategori_id']; ?>">
                            <img style="height: 60px;" src="admin/<?php echo $eskikategoriyaz['resim']; ?>" alt="<?php echo $eskikategoriyaz['kategori_ad']; ?>"> <?php echo $eskikategoriyaz['kategori_ad']; ?>
                        </li>
                        <?php $katFirst++; } } ?>
                    </ul>
                    <div id="tab-tumu" class="tab-content current" style="background: none;">
                        <div class="row" style="display: flex; flex-wrap: wrap; margin-right: -15px; margin-left: -15px; place-content: space-between space-around; align-items: center; background-size: cover;">
                            <?php 
                            $urr=0;
                            $urunsor=$db->prepare("SELECT * from urunler where urun_paket='1' and urun_vitrin=1 order by urun_id ASC");
                            $urunsor->execute(array(0));
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
                            <?php $urr++;  }  ?>
                        </div>
                    </div>
                    <?php 
                    $kataltFirst=0;
                    $paketaltkategori=$db->prepare("SELECT * from kategoripaket");
                    $paketaltkategori->execute(array(0)); 
                    foreach ($paketaltkategori as $key => $eskialtkategoriyaz) { 
                        $urunaltVarmi =0;
                        $urunaltsor=$db->prepare("SELECT * from urunler where urun_vitrin=1 and urun_paket='1' and urun_kategori=:kategori");
                        $urunaltsor->execute(array('kategori' => $eskialtkategoriyaz['kategori_id']));
                        $urunaltVarmi = $urunaltsor->rowCount();
                        if ($urunaltVarmi>0) {
                    ?>
                    <div id="tab-<?php echo $eskialtkategoriyaz['kategori_id']; ?>" class="tab-content" style="background: none;">
                        <div class="row" style="display: flex; flex-wrap: wrap; margin-right: -15px; margin-left: -15px; place-content: space-between space-around; align-items: center; background-size: cover;">
                            <?php 
                            $urr=0;
                            $urunsor=$db->prepare("SELECT * from urunler where urun_paket='1' and urun_vitrin=1 and urun_kategori=:kategorix order by urun_id ASC");
                            $urunsor->execute(array('kategorix' => $eskialtkategoriyaz['kategori_id']));
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
                                        <img src="admin/<?php echo $eskialtkategoriyaz['resim']; ?>" alt="Executive">
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
                            <?php $urr++;  }  ?>
                        </div>
                    </div>
                    <?php $kataltFirst++; } } ?>
                </div>
            </div>
        </div>
    </div>
</section>
<?php } if ($widgetprint['widget_urun']==1) { ?>
<section class="home3-service m-t100 m-b100 particles-js" data-color="#fe4c1c,#00c3ff,#0160e7" data-id="i1-4">
    <div class="container">
        <div class="row">
            <?php $counterSay = 0;
            $counter=$db->prepare("SELECT * from counter");
            $counter->execute(array(0));
            foreach ($counter as $key => $counterprint) { if ($counterSay==0) { ?>
            <div class="col-md-3 col-sm-6 col-xs-13">
                <div class="circle-progress" data-color1="<?php echo $settingsprint['ayar_renk3'];?>" data-color2="<?php echo $settingsprint['ayar_renk4'];?>">
                    <div class="inner-bar" data-percent="<?php echo $counterprint['counter_rakam']; ?>">
                        <span><span class="percent"><?php echo $counterprint['counter_rakam']; ?></span>%</span>
                    </div>
                    <h4><?php echo $counterprint['counter_isim']; ?></h4>
                </div>
            </div>
            <?php } if ($counterSay==1) { ?>
            <div class="col-md-3 col-sm-6 col-xs-13 m-t60">
                <div class="circle-progress" data-color1="<?php echo $settingsprint['ayar_renk3'];?>" data-color2="<?php echo $settingsprint['ayar_renk4'];?>">
                    <div class="inner-bar" data-percent="<?php echo $counterprint['counter_rakam']; ?>">
                        <span><span class="percent"><?php echo $counterprint['counter_rakam']; ?></span>%</span>
                    </div>
                    <h4><?php echo $counterprint['counter_isim']; ?></h4>
                </div>
            </div>
            <?php } if ($counterSay==2) { ?>
            <div class="col-md-3 col-sm-6 col-xs-13 xs-m-t60">
                <div class="circle-progress" data-color1="<?php echo $settingsprint['ayar_renk3'];?>" data-color2="<?php echo $settingsprint['ayar_renk4'];?>">
                    <div class="inner-bar" data-percent="<?php echo $counterprint['counter_rakam']; ?>">
                        <span><span class="percent"><?php echo $counterprint['counter_rakam']; ?></span>%</span>
                    </div>
                    <h4><?php echo $counterprint['counter_isim']; ?></h4>
                </div>
            </div>
            <?php } if ($counterSay==3) { ?>
            <div class="col-md-3 col-sm-6 col-xs-13 m-t60">
                <div class="circle-progress" data-color1="<?php echo $settingsprint['ayar_renk3'];?>" data-color2="<?php echo $settingsprint['ayar_renk4'];?>">
                    <div class="inner-bar" data-percent="<?php echo $counterprint['counter_rakam']; ?>">
                        <span><span class="percent"><?php echo $counterprint['counter_rakam']; ?></span>%</span>
                    </div>
                    <h4><?php echo $counterprint['counter_isim']; ?></h4>
                </div>
            </div>
            <?php } $counterSay ++; } ?>
        </div>
    </div>
</section>
<?php }  if ($widgetprint['widget_referans']==1) { ?>
<section class="bg-light home2-team p-b0 particles-js" data-color="#fe4c1c,#00c3ff,#0160e7">
    <div class="shape shape-top" data-negative="true">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 100" preserveAspectRatio="none">
            <path class="shape-fill" d="M790.5,93.1c-59.3-5.3-116.8-18-192.6-50c-29.6-12.7-76.9-31-100.5-35.9c-23.6-4.9-52.6-7.8-75.5-5.3c-10.2,1.1-22.6,1.4-50.1,7.4c-27.2,6.3-58.2,16.6-79.4,24.7c-41.3,15.9-94.9,21.9-134,22.6C72,58.2,0,25.8,0,25.8V100h1000V65.3c0,0-51.5,19.4-106.2,25.7C839.5,97,814.1,95.2,790.5,93.1z"></path>
        </svg>
    </div>
    <div class="shape shape-bottom" data-negative="false">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 100" preserveAspectRatio="none">
            <path class="shape-fill" d="M421.9,6.5c22.6-2.5,51.5,0.4,75.5,5.3c23.6,4.9,70.9,23.5,100.5,35.7c75.8,32.2,133.7,44.5,192.6,49.7c23.6,2.1,48.7,3.5,103.4-2.5c54.7-6,106.2-25.6,106.2-25.6V0H0v30.3c0,0,72,32.6,158.4,30.5c39.2-0.7,92.8-6.7,134-22.4c21.2-8.1,52.2-18.2,79.7-24.2C399.3,7.9,411.6,7.5,421.9,6.5z"></path>
        </svg>
    </div>
    <div class="container">
        <div class="row p-b40">
            <div class="col-md-8 col-sm-8 col-xs-12">
                <div class="ot-heading left-align">
                    <h2 class="main-heading"><?php echo htmlspecialchars($widgetprint['widget_breferans']); ?></h2>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12 xs-m-t30 text-right xs-text-left">
                <div class="ot-button">
                    <a href="referanslar" class="octf-btn octf-btn-primary octf-btn-icon"><span>Tümünü Göster <i class="flaticon-right-arrow-1"></i></span></a>
                </div>
            </div>
        </div>
        <div class="row p-b155">
            <div class="col-md-12 col-xs-12">
                <div class="team-slider">
                    <?php 
                    $refsor=$db->prepare("SELECT * from referanslar Limit 6");
                    $refsor->execute(array(0));
                    while ($refprint=$refsor->fetch(PDO::FETCH_ASSOC)) { ?>
                    <div class="team-wrap">
                        <a href="<?php echo $refprint['referans_link'] ?>" target="_blank">
                            <div class="team-thumb">
                                <img src="admin/<?php echo $refprint['referans_resim1'] ?>" alt="<?php echo $refprint['referans_adi']; ?>">
                            </div>
                            <div class="team-info">
                                <h4><?php echo $refprint['referans_adi']; ?></h4>
                                <span><?php echo $refprint['referans_kategori']; ?></span>
                            </div>
                        </a>
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</section>
<?php } if ($widgetprint['widget_proje']==1) { ?>
<section class="p-t80 p-b100 bg-testi particles-js" data-color="#fe4c1c,#00c3ff,#0160e7" data-id="i1-5">
    <div class="bg-overlay-testi"></div>
    <div class="container">
        <div class="flex-row">
            <div class="col-md-4 col-xs-12 align-self-center">
                <div class="ot-heading heading-testimonials left-align">
                    <h2 class="main-heading"><?php echo htmlspecialchars($widgetprint['widget_bproje']); ?></h2>
                </div>
                <div class="testicustom-slider-nav"></div>
            </div>
            <div class="col-md-8 col-xs-12 ot-testimonials-heading">
                <div class="ot-testimonials">
                    <div class="testimonial-wrap">
                        <div class="testimonial-inner ot-testimonials-slider">
                            <?php 
                            $yorumsor=$db->prepare("SELECT * from yorumlar order by yorum_id DESC");
                            $yorumsor->execute(array(0));
                            foreach ($yorumsor as $key => $yorumcek) { ?>
                            <div>
                                <img src="admin/<?php echo $yorumcek['yorum_resim']; ?>" alt="Michael Terry">
                                <div class="ttext">
                                    <?php echo strip_tags($yorumcek['yorum_icerik']); ?>
                                </div>
                                <div class="tinfo">
                                    <h6><?php echo $yorumcek['yorum_isim']; ?></h6>
                                </div>
                            </div>
                            <?php } ?>
                        </div>
                        <div class="bg-block"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<?php } if ($widgetprint['widget_blog']==1) { ?>
<section class="home2-news particles-js" data-color="#fe4c1c,#00c3ff,#0160e7" data-id="i1-2">
    <div class="bg-overlay"></div>
    <div class="container">
        <div class="row m-b40">
            <div class="col-md-8 col-sm-8 col-xs-12">
                <div class="ot-heading left-align">
                    <h2 class="main-heading"><?php echo $widgetprint['widget_bblog']; ?></h2>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12 text-right m-t15 xs-text-left">
                <div class="ot-button">
                    <a href="blog" class="octf-btn octf-btn-primary octf-btn-icon"><span>Tümünü Göster <i class="flaticon-right-arrow-1"></i></span></a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-xs-12">
                <div class="flex-row pf_3_cols" style="position: static !important;">
                    <?php 
                    $blog=$db->prepare("SELECT * from blog order by blog_id Limit 3");
                    $blog->execute();
                    while($blogcek=$blog->fetch(PDO::FETCH_ASSOC)) {
                        $kategorisor = $db->prepare( "SELECT * from kategorilerb where kategori_id=:KatId" );
                        $kategorisor->execute( array( "KatId" => $blogcek['blog_kategori'] ) );
                        $kategoriprint = $kategorisor->fetch( PDO::FETCH_ASSOC );
                        $aylar = array(
                            1=>"Ocak",
                            2=>"Şubat",
                            3=>"Mart",
                            4=>"Nisan",
                            5=>"Mayıs",
                            6=>"Haziran",
                            7=>"Temmuz",
                            8=>"Ağustos",
                            9=>"Eylül",
                            10=>"Ekim",
                            11=>"Kasım",
                            12=>"Aralık"

                        );
                        $Gun= substr($blogcek['blog_tarih'],8,2);
                        $Ay= (int) substr($blogcek['blog_tarih'],5,2);
                        $Yil= substr($blogcek['blog_tarih'],0,4); ?>
                    <article class="col-md-4 col-sm-6 col-xs-12 post-box masonry-post-item">
                        <div class="post-inner">
                            <div class="entry-media">
                                <div class="post-cat">
                                    <span class="posted-in">
                                        <a href="<?= seo( 'konu-kategori-' . $kategoriprint[ "kategori_ad" ] ) . '-' . $kategoriprint[ "kategori_id" ] ?>" rel="category tag"><?php echo $kategoriprint['kategori_ad']; ?></a>
                                    </span>
                                </div>
                                <a href="<?=seo('blog-'.$blogcek["blog_baslik"]).'-'.$blogcek["blog_id"]?>">
                                    <img src="admin/<?php echo $blogcek['blog_resim']; ?>" alt="<?php echo $blogcek['blog_baslik']; ?>">
                                </a>
                            </div>
                            <div class="inner-post">
                                <div class="entry-header">

                                    <div class="entry-meta">
                                        <span class="posted-on">
                                            <a><i class="flaticon-clock"></i> <time class="entry-date published"><?php echo $Gun." ".$aylar[$Ay]." ".$Yil; ?></time></a>
                                        </span>
                                    </div><!-- .entry-meta -->

                                    <h3 class="entry-title"><a href="<?=seo('blog-'.$blogcek["blog_baslik"]).'-'.$blogcek["blog_id"]?>"><?php echo $blogcek['blog_baslik']; ?></a></h3>
                                </div><!-- .entry-header -->

                                <div class="entry-summary the-excerpt">
                                    <p>
                                        <?php echo mb_substr(strip_tags($blogcek['blog_detay']),0 ,250, "UTF-8")."..."; ?>
                                    </p>
                                </div><!-- .entry-content -->
                            </div>
                        </div>
                    </article>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</section>
<?php } include 'include/footer.php'; ?>