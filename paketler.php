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
require 'include/menu.php'; 
?>
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
                    <!-- AYLIK/YILLIK TOGGLE SECTION - MODERN DESIGN -->
<div style="text-align: center; margin-bottom: 50px; margin-top: 30px;">
    <div style="display: inline-block;">
        <div class="billing-toggle-wrapper">
            <div class="billing-toggle-container">
                <input type="radio" id="toggle-aylik" name="billing_period" value="aylik" checked onchange="toggleBiling('aylik')" />
                <input type="radio" id="toggle-yillik" name="billing_period" value="yillik" onchange="toggleBiling('yillik')" />
                
                <label for="toggle-aylik" class="toggle-label toggle-left">
                    <span class="toggle-text">Aylık Ödeme</span>
                </label>
                
                <label for="toggle-yillik" class="toggle-label toggle-right">
                    <span class="toggle-text">Yıllık Ödeme</span>
                    <span class="discount-badge">%33 İndirim</span>
                </label>
                
                <div class="toggle-background"></div>
            </div>
        </div>
    </div>
</div>

<style>
/* MODERN BILLING TOGGLE STYLES */
.billing-toggle-wrapper {
    padding: 0;
    margin: 0;
}

.billing-toggle-container {
    position: relative;
    display: inline-flex;
    background: rgba(255, 255, 255, 0.08);
    border: 1px solid rgba(255, 255, 255, 0.15);
    border-radius: 50px;
    padding: 6px;
    backdrop-filter: blur(10px);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
    min-width: 450px;
    height: 52px;
}

.billing-toggle-container input[type="radio"] {
    display: none;
}

.toggle-label {
    flex: 1;
    padding: 0 24px;
    text-align: center;
    cursor: pointer;
    font-weight: 600;
    font-size: 16px;
    color: rgba(255, 255, 255, 0.6);
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
    z-index: 2;
    user-select: none;
    white-space: nowrap;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 6px;
    height: 100%;
    width: 50%;
}

.toggle-text {
    display: inline-block;
    white-space: nowrap;
}

.discount-badge {
    display: inline-block;
    background: rgba(40, 167, 69, 0.3);
    color: #28a745;
    padding: 3px 8px;
    border-radius: 12px;
    font-size: 11px;
    font-weight: 700;
    margin-left: 4px;
    animation: fadeInScale 0.5s ease-out;
    white-space: nowrap;
}

@keyframes fadeInScale {
    from {
        opacity: 0;
        transform: scale(0.8);
    }
    to {
        opacity: 1;
        transform: scale(1);
    }
}

.toggle-background {
    position: absolute;
    top: 6px;
    left: 6px;
    width: calc(50% - 6px);
    height: calc(100% - 12px);
    background: linear-gradient(135deg, #fe4c1c 0%, #fe7c3c 100%);
    border-radius: 50px;
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    box-shadow: 0 4px 15px rgba(254, 76, 28, 0.3);
    z-index: 1;
}

/* Active state for Aylık */
.billing-toggle-container input[id="toggle-aylik"]:checked ~ .toggle-background {
    left: 6px;
    background: linear-gradient(135deg, #fe4c1c 0%, #fe7c3c 100%);
    box-shadow: 0 4px 15px rgba(254, 76, 28, 0.3);
}

/* Active state for Yıllık */
.billing-toggle-container input[id="toggle-yillik"]:checked ~ .toggle-background {
    left: calc(50% + 0px);
    background: linear-gradient(135deg, #0160e7 0%, #00c3ff 100%);
    box-shadow: 0 4px 15px rgba(1, 96, 231, 0.3);
}

/* Text colors for selected states - BEYAZ METİN AKTİF BUTONDA */
.billing-toggle-container input[id="toggle-aylik"]:checked ~ .toggle-left {
    color: #fff;
    font-weight: 700;
}

.billing-toggle-container input[id="toggle-yillik"]:checked ~ .toggle-right {
    color: #fff;
    font-weight: 700;
}

/* Text colors for inactive states - AÇIK GRİ RENK */
.billing-toggle-container input[id="toggle-aylik"]:not(:checked) ~ .toggle-left {
    color: rgba(255, 255, 255, 0.7);
}

.billing-toggle-container input[id="toggle-yillik"]:not(:checked) ~ .toggle-right {
    color: rgba(255, 255, 255, 0.7);
}

.toggle-label:hover {
    color: #fff;
}

/* Responsive Design */
@media (max-width: 768px) {
    .billing-toggle-container {
        min-width: auto;
        width: 100%;
        max-width: 400px;
        height: auto;
        flex-direction: column;
        padding: 8px;
    }
    
    .toggle-label {
        width: 100%;
        height: 48px;
        padding: 0 16px;
        font-size: 14px;
        margin: 0;
    }
    
    .toggle-background {
        width: calc(100% - 16px);
        height: calc(50% - 8px);
        top: 8px;
    }
    
    .billing-toggle-container input[id="toggle-yillik"]:checked ~ .toggle-background {
        left: 8px;
        top: calc(50% + 0px);
    }
    
    .discount-badge {
        font-size: 10px;
        padding: 2px 6px;
        margin-left: 3px;
    }
}

/* Additional animations */
.toggle-label::before {
    content: '';
    position: absolute;
    inset: 0;
    border-radius: 50px;
    opacity: 0;
    background: radial-gradient(circle, rgba(255, 255, 255, 0.1) 0%, transparent 70%);
    transition: opacity 0.3s;
    pointer-events: none;
}

.toggle-label:active::before {
    opacity: 1;
}
</style>

                    <div class="ot-tabs">
                        <ul class="unstyle text-center" style="display: flex; flex-wrap: wrap; margin-right: -15px; margin-left: -15px; place-content: space-between space-around; align-items: center; background-size: cover; justify-content: center;">
                            <a class="octf-btn  <?php if (empty($gelenler)) { echo "octf-btn"; } else { echo "octf-btn-white"; } ?>" style="margin-right: 10px;" href="paketler"><img style="height: 60px;" src="admin/images/tum-paketler.png" alt="Tüm Paketler"></a>
                            <?php 
                                $katFirst=0; 
                                $paketkategori=$db->prepare("SELECT * from kategoripaket");
                                $paketkategori->execute(array(0));  
                                foreach ($paketkategori as $key => $eskikategoriyaz) { 
                                    $urunVarmi = 0;
                                    $urunsor=$db->prepare("SELECT * from urunler where urun_paket='1' and urun_kategori=:kategori");
                                    $urunsor->execute(array('kategori' => $eskikategoriyaz['kategori_id']));
                                    $urunVarmi = $urunsor->rowCount();
                                    if ($urunVarmi > 0) { 
                            ?>
                            <a class="octf-btn  <?php if ($eskikategoriyaz['kategori_id'] == $gelenler) { echo "octf-btn"; } else { echo "octf-btn-white"; } ?>" style="margin-right: 10px;" href="paketler?paket_id=<?php echo $eskikategoriyaz['kategori_id']; ?>">
                                <img style="height: 60px;" src="admin/<?php echo $eskikategoriyaz['resim']; ?>" alt="<?php echo $eskikategoriyaz['kategori_ad']; ?>"> <?php echo $eskikategoriyaz['kategori_ad']; ?>
                            </a>
                            <?php 
                                    $katFirst++; 
                                    } 
                                } 
                            ?>
                        </ul>

                        <div id="tab-" class="tab-content <?php if ($kataltFirst == 0) { echo "current"; } ?>" style="background: none;">
                            <div class="row" style="display: flex; flex-wrap: wrap; margin-right: -15px; margin-left: -15px; place-content: space-between space-around; align-items: center; background-size: cover; justify-content: center;">
                                <?php 
                                    $urr = 0;
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
                                        if ($urr == 3) {
                                            $urr = 0;
                                        }
                                        
                                        // Fiyat Hesaplama
                                        $fiyat_aylik = $uruncek['urun_aylik_fiyat'] ? $uruncek['urun_aylik_fiyat'] : $uruncek['urun_fiyat'];
                                        $fiyat_yillik = $uruncek['urun_yillik_fiyat'] ? $uruncek['urun_yillik_fiyat'] : ($fiyat_aylik * 12 * 0.67);
                                ?>

                                <div class="col-md-4 col-sm-12 col-xs-12  m-b50">
                                    <div class="ot-pricing-table bg-shape <?php if($urr == 0) { echo "s1"; } elseif($urr == 1) { echo "s3 feature"; } else { echo "s2"; } ?>">
                                        <span class="title-table">
                                            <?php echo $uruncek['urun_baslik']; ?>
                                            <br>
                                            <small style="font-size: 12px; color: #999; font-weight: normal;">
                                                (<?php echo $eskikategoriyaz['kategori_ad']; ?>)
                                            </small>
                                        </span>
                                        <div class="inner-table">
                                            <img src="admin/<?php echo $eskikategoriyaz['resim']; ?>" alt="<?php echo $uruncek['urun_baslik']; ?>">
                                            <h2 id="fiyat-<?php echo $uruncek['urun_id']; ?>">
                                                <sup><i class="fas fa-lira-sign"></i></sup> 
                                                <span id="fiyat-deger-<?php echo $uruncek['urun_id']; ?>">
                                                    <?php echo number_format($fiyat_aylik, 2, ',', '.'); ?>
                                                </span> 
                                                <small>+KDV</small>
                                            </h2>
                                            <p style="font-size: 12px; color: #999; margin: 5px 0;">
                                                <span id="period-<?php echo $uruncek['urun_id']; ?>">Aylık Ödeme</span>
                                            </p>
                                            <div class="details">
                                                <ul>
                                                    <?php 
                                                        $icerik = $uruncek['urun_aciklama'];
                                                        $satir = explode("\n", $icerik);
                                                    ?>
                                                    <?php foreach ($satir as $val) { ?>
                                                        <li><?php echo $val; ?></li>
                                                    <?php } ?>
                                                </ul>
                                            </div>
                                        </div>
                                        
                                        <!-- SEPETE EKLE FORMU -->
                                        <form method="post" action="">
                                            <input type="hidden" name="urun_adi" id="urun-adi-<?php echo $uruncek['urun_id']; ?>" value="<?php echo $uruncek['urun_baslik']; ?>" />
                                            <input type="hidden" name="urun_paket" value="<?php echo $uruncek['urun_paket']; ?>" />
                                            <input type="hidden" name="urun_adet" value="1" />
                                            <input type="hidden" name="urun_fiyat" id="urun-fiyat-<?php echo $uruncek['urun_id']; ?>" value="<?php echo $fiyat_aylik; ?>" />
                                            <input type="hidden" name="urun_id" value="<?php echo $uruncek['urun_id']; ?>" />
                                            <input type="hidden" name="abone_tur" id="abone-tur-<?php echo $uruncek['urun_id']; ?>" value="aylik" />

                                            <div class="plan-button">
                                                <button name="sepetle" type="submit" class="octf-btn octf-btn-icon octf-btn-third">Sepete Ekle <i class="fa fa-shopping-cart"></i></button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <?php 
                                    $urr++;  
                                }   
                                ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- Toggle JavaScript -->
<script>
// Fiyat Verileri
var fiyatlar = {
    <?php 
        $urunsor=$db->prepare("SELECT * from urunler where urun_paket='1'");
        $urunsor->execute(array());
        $first = true;
        foreach ($urunsor as $urun) {
            if (!$first) echo ", ";
            $fiyat_aylik = $urun['urun_aylik_fiyat'] ? $urun['urun_aylik_fiyat'] : $urun['urun_fiyat'];
            $fiyat_yillik = $urun['urun_yillik_fiyat'] ? $urun['urun_yillik_fiyat'] : ($fiyat_aylik * 12 * 0.67);
            echo "'".$urun['urun_id']."': {aylik: ".$fiyat_aylik.", yillik: ".$fiyat_yillik."}";
            $first = false;
        }
    ?>
};

function toggleBiling(tur) {
    // Radio butonlarını güncelle
    var radios = document.querySelectorAll('input[name="billing_period"]');
    for (var i = 0; i < radios.length; i++) {
        radios[i].checked = (radios[i].value === tur);
    }
    
    // Tüm ürünlerin fiyatlarını güncelle
    for (var urunId in fiyatlar) {
        if (fiyatlar.hasOwnProperty(urunId)) {
            var fiyatElement = document.getElementById('fiyat-deger-' + urunId);
            var periodElement = document.getElementById('period-' + urunId);
            var abone_tur_element = document.getElementById('abone-tur-' + urunId);
            var urun_fiyat_element = document.getElementById('urun-fiyat-' + urunId);
            var urun_adi_element = document.getElementById('urun-adi-' + urunId);
            
            if (tur === 'yillik') {
                if (fiyatElement) {
                    var fiyat_yillik = fiyatlar[urunId].yillik;
                    fiyatElement.textContent = fiyat_yillik.toFixed(2).replace('.', ',');
                }
                if (periodElement) periodElement.textContent = 'Yıllık Ödeme';
                if (abone_tur_element) abone_tur_element.value = 'yillik';
                if (urun_fiyat_element) urun_fiyat_element.value = fiyatlar[urunId].yillik;
                if (urun_adi_element) {
                    var urun_adi = urun_adi_element.value;
                    urun_adi_element.value = urun_adi + ' (Yıllık)';
                }
            } else {
                if (fiyatElement) {
                    var fiyat_aylik = fiyatlar[urunId].aylik;
                    fiyatElement.textContent = fiyat_aylik.toFixed(2).replace('.', ',');
                }
                if (periodElement) periodElement.textContent = 'Aylık Ödeme';
                if (abone_tur_element) abone_tur_element.value = 'aylik';
                if (urun_fiyat_element) urun_fiyat_element.value = fiyatlar[urunId].aylik;
                if (urun_adi_element) {
                    var urun_adi = urun_adi_element.value.replace(' (Yıllık)', '');
                    urun_adi_element.value = urun_adi;
                }
            }
        }
    }
}
</script>

<?php include 'include/footer.php'; ?>