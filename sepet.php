<?php require 'include/header.php';
$metakey=$db->prepare("SELECT * from meta where meta_id=14");
$metakey->execute(array(0));
$metakeyprint=$metakey->fetch(PDO::FETCH_ASSOC);
$meta = [
  'title' => $metakeyprint['meta_title'],
  'keywords' => $metakeyprint['meta_keyword'],
  'description' => $metakeyprint['meta_descr']
]; require 'include/menu.php';
$urunler = @$_SESSION['urunler'];

@$say = count(@$urunler);
if ( isset( $_POST[ 'sepetbosalt' ] ) )
{

  unset($_SESSION['urunler']);

  if ( $update )
  {

    Header( "Location:sepet?status=ok" );
  }
  else
  {

    Header( "Location:sepet?status=ok" );
  }

}

if (isset($_POST['adetsil'])) {
  $key=$_POST['id'];
  unset($_SESSION['urunler'][$key]);

  header("Location:sepet?status=ok");
  exit;
}
?>
<div id="content" class="site-content">
    <div class="page-header dtable text-center" style="background-image: url(admin/<?php echo $settingsprint['resim_title']; ?>);">
        <div class="dcell">
            <div class="container">
                <h1 class="page-title">Sepetim</h1>
                <ul id="breadcrumbs" class="breadcrumbs">
                    <li><a href="<?php echo $settingsprint['ayar_siteurl']; ?>">Anasayfa</a></li>
                </ul>
            </div>
        </div>
    </div>
    <section class="p-tb100">
        <div class="container">
            <?php if ($say>0) { ?>
            <div class="woocommerce">
                <form class="woocommerce-cart-form" action="" method="post">
                    <table class="shop_table shop_table_responsive cart woocommerce-cart-form__contents">
                        <thead>
                            <tr>
                                <th class="product-remove">&nbsp;</th>
                                <th class="product-thumbnail">&nbsp;</th>
                                <th class="product-name">Ürün / Hizmet</th>
                                <th class="product-price text-center">Adet</th>
                                <th class="product-quantity text-right">Toplam Fiyat</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            foreach(@$urunler as $key => $urun) {
                            @$toplam += $urun['fiyat'];
                            $urunsorxc=$db->prepare("SELECT * from urunler where urun_id=:urun_id");
                            $urunsorxc->execute(array(
                            'urun_id' => $urun['id']
                            ));
                            $uruncekxc=$urunsorxc->fetch(PDO::FETCH_ASSOC);
                            ?>
                            <tr class="woocommerce-cart-form__cart-item cart_item">
                                <td class="product-remove">
                                    <form action="" method="POST">
                                        <input type="hidden" name="id" value="<?php echo $key ?>">
                                        <button style="border: none;" type="submit" name="adetsil" class="remove">×</button>
                                    </form>
                                </td>
                                <th class="product-thumbnail">
                                    <?php if ($urun['paket']==0) {
                                    $resimsor=$db->prepare("SELECT * from resim where resim_urun=:resim_urun Limit 1");
                                    $resimsor->execute(array(
                                    'resim_urun' => $urun["id"]
                                    ));
                                    $resimcek=$resimsor->fetch(PDO::FETCH_ASSOC);  ?>
                                    <a target="_blank" href="<?=seo('detay-'.$uruncekxc["urun_baslik"]).'-'.$uruncekxc["urun_id"]?>">
                                        <img src="admin/<?php echo $resimcek['resim_link'] ?>" alt="<?php echo $uruncekxc["urun_baslik"] ?>">
                                    </a>
                                    <?php } else {
                                    $resimsor=$db->prepare("SELECT * from urunler where urun_id=:resim_urun Limit 1");
                                    $resimsor->execute(array(
                                    'resim_urun' => $urun["id"]
                                    ));
                                    $resimcek=$resimsor->fetch(PDO::FETCH_ASSOC);
                                    $kategori=$db->prepare("SELECT * from kategoripaket where kategori_id=:kategori_id");
                                    $kategori->execute(array(
                                        'kategori_id' => $uruncekxc['urun_kategori']
                                    ));
                                    $kategoriyaz=$kategori->fetch(PDO::FETCH_ASSOC); ?>
                                    <a target="_blank" href="<?=$settingsprint['ayar_siteurl'].seo('paket-'.$kategoriyaz["kategori_ad"]).'-'.$kategoriyaz["kategori_id"]?>">
                                        <img src="admin/<?php echo $kategoriyaz['resim'] ?>" alt="<?php echo $kategoriyaz["kategori_ad"] ?>">
                                    </a>
                                    <?php } ?>
                                </th>
                                <td class="product-name" data-title="Ürün/Hizmet">
                                    <span class="whish-title">
                                        <?php if ($urun['paket']==0) { ?>
                                            <a target="_blank" href="<?=seo('detay-'.$uruncekxc["urun_baslik"]).'-'.$uruncekxc["urun_id"]?>"><?php echo $urun["urun"] ?></a>
                                        <?php } else { ?>
                                            <b><?php echo $uruncekxc["urun_baslik"] ?></b>
                                            <?php if (isset($urun['abone_tur']) && !empty($urun['abone_tur'])): ?>
                                                <br />
                                                <small style="color: #999; font-size: 11px;">
                                                    <?php 
                                                        if ($urun['abone_tur'] === 'yillik') {
                                                            echo '<i class="fa fa-calendar"></i> <strong>Yıllık Abonelik</strong>';
                                                        } else {
                                                            echo '<i class="fa fa-calendar-o"></i> <strong>Aylık Abonelik</strong>';
                                                        }
                                                    ?>
                                                </small>
                                            <?php endif; ?>
                                        <?php } ?>
                                    </span>
                                </td>
                                <td class="product-quantity text-center" data-title="Adet">
                                    <div class="quantity">
                                        <input class="input-text qty text" style="padding-right: 0px;" type="number" min="1" max="10" value="1" readonly="">
                                    </div>
                                </td>
                                <?php $toplam =  1*$urun["fiyat"];  ?>
                                <td class="product-subtotal text-right" data-title="Toplam Fiyat">
                                    <span class="woocommerce-Price-currencySymbol"><span class="woocommerce-Price-currencySymbol"><i class="fas fa-lira-sign"></i></span><?php echo $toplam; ?></span>
                                </td>
                            </tr>
                            <?php  @$geneltoplam += $toplam; } ?>


                        </tbody>
                    </table>
                </form>

            </div>
            <?php 
          $fiyat=$geneltoplam;

          $kdv=ceil($fiyat*20/100);

          $geneltoplamkdv=$fiyat+$kdv;
          ?>
            <div class=" cart-collaterals">
                <div class="cart_totals ">
                    <h2>Sepet Toplamı</h2>
                    <table cellspacing="0" class="shop_table shop_table_responsive">
                        <tbody>
                            <tr class="cart-subtotal">
                                <th>Ara Toplam</th>
                                <td data-title="Subtotal"><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol"><i class="fas fa-lira-sign"></i></span><?php echo $geneltoplam; ?></span></td>
                            </tr>
                            <tr class="woocommerce-shipping-totals shipping">
                                <th>KDV Toplamı</th>
                                <td data-title="Subtotal"><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol"><i class="fas fa-lira-sign"></i></span><?php echo $kdv; ?></span></td>
                            </tr>
                            <tr class="order-total">
                                <th>Genel Toplam</th>
                                <td data-title="Total"><strong><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol"><i class="fas fa-lira-sign"></i></span><?php echo $geneltoplamkdv; ?></span></strong> </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="wc-proceed-to-checkout">
                        <a href="hesabim/satin-al" class="checkout-button button alt wc-forward">Güvenli Ödeme Sayfası</a>
                    </div>
                </div>
            </div>
            <?php } else { ?>
            <div class="message-box sm-m-b30">
                <div class="icon-main warning">
                    <span class="flaticon-danger"></span>
                </div>
                <div class="content-box">
                    <h6>Sepetinizde Ürün Bulunmuyor!</h6>
                    <p>Sepetinize ürün eklemek için ürünleri buradan <a href="urunler">Ürünler</a>, Paketlerimize ise buradan <a href="paketler">Paketler</a> ulaşabilirsiniz. </p>
                </div>
                <i class="flaticon-close"></i>
            </div>
            <?php } ?>
        </div>
    </section>
</div>

<?php  include 'include/footer.php'; ?>