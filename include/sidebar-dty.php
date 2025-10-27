<?php   
$ToplamSay=$db->prepare("SELECT * from urunler where  urun_paket='0'");
$ToplamSay->execute();
$toplam_bas=$ToplamSay->rowCount();
?>
<script>
  $(function () {
    $('[data-toggle="tooltip"]').tooltip(),
    $('#example').tooltip(options)
  })
</script>
<aside class="col-lg-5 col-xl-4">
  <div class="widget woocommerce widget_shopping_cart">
    <h1><?php echo $uruncek['urun_baslik']; ?></h1>

    <div class="widget_shopping_cart_content">

      <?php if ($widgetprint['widget_usatinal']==1) { ?>
       <form method="post" action="">
        <input type="hidden" name="urun_adi" value="<?php echo $uruncek['urun_baslik']; ?>">
        <input type="hidden" name="urun_paket" value="<?php echo $uruncek['urun_paket']; ?>">
        <input type="hidden" class="urun_fiyat" name="urun_fiyat" value="<?php echo $uruncek['urun_fiyat']; ?>">
        <input type="hidden" class="urun_fiyathost" name="urun_fiyathost" value="0">
        <input type="hidden" name="urun_id" value="<?php echo $uruncek['urun_id']; ?>">
        <h3 class="woocommerce-Price-amount amount"> 
          <del style="font-size: 20px;"><i class="fa fa-try"></i>
            <b><?php echo $uruncek['urun_efiyat']; ?></b>
          </del>
          <i class="fa fa-try"></i> <b id="fiyatAlani" val="<?php echo $uruncek['urun_fiyat']; ?>"><?php echo $uruncek['urun_fiyat']; ?></b> <small>+KDV</small>
        </h3>
        <?php if ($uruncek['alanadi']) { ?>
          <div class="form-group">
            <label for="exampleFormControlInput1">Alan Adınız</label>
            <input type="text" required="" class="form-control" id="exampleFormControlInput1" name="alanadi" placeholder="alanadi.com">
          </div>
        <?php } if ($uruncek['hosting']) { ?>
          <div class="form-group">
            <label for="exampleFormControlSelect1">Hosting Paketleri</label>
            <select name="hosting" class="form-control ozelhost" id="exampleFormControlSelect1">
              <option data="0" value="">İstemiyorum</option>
              <?php 
              $hostEk=$db->prepare("SELECT * from eklenti where cinsi=:cinsi order by sira ASC");
              $hostEk->execute(array('cinsi' => 0));
              while ($hostEkCek=$hostEk->fetch(PDO::FETCH_ASSOC)) { ?>
                <option data="<?=$hostEkCek['fiyat']?>" value="<?php echo $hostEkCek['ad']." +".$hostEkCek['fiyat']."TL"; ?>"><?php echo $hostEkCek['ad']." +".$hostEkCek['fiyat']."TL"; ?></option>
              <?php } ?>
            </select>
          </div>
        <?php } if ($uruncek['eklenti']) { ?>
          <div class="form-group">
            <div class="form-check">            
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
          </div>
        <?php } ?>
        <p class="woocommerce-mini-cart__buttons buttons">
          <button style="width: 100%;" name="sepetleoz" type="submit" class="btn btn-maincolor wc-forward"><span>Satın Al</span></button>
        </p>


      </form>
    <?php } ?>
  </div>
</div>

<div class="widget widget_categories">

  <h5 class="widget-title categories-tilte">Kategoriler</h5>

  <ul>
    <?php 
    $kategoriedit=$db->prepare("SELECT * from kategoriler order by kategori_id");
    $kategoriedit->execute(array());
    foreach ($kategoriedit as $value) { 

      $kategorisay=$db->prepare("SELECT * from urunler where urun_paket='0' and urun_kategori=:id");
      $kategorisay->execute(array("id" => $value["kategori_id"]));
      $toplam_katsay=$kategorisay->rowCount();
      ?>
      <li class="cat-item">
        <a href="<?=seo('urun-kategori-'.$value["kategori_ad"]).'-'.$value["kategori_id"]?>"><?=$value['kategori_ad']?></a>
        <span class="color-main2">(<?php echo $toplam_katsay ?>)</span>
      </li>
    <?php } ?>
    <li class="cat-item">
      <a href="urunler">Tüm Ürünler </a>
      <span class="color-main2">(<?php echo $toplam_bas ?>)</span>
    </li>
  </ul>
</div>
</aside>
