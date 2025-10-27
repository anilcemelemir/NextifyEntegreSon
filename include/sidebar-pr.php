<?php   
$ToplamSay=$db->prepare("SELECT * from urunler where  urun_paket='0'");
$ToplamSay->execute();
$toplam_bas=$ToplamSay->rowCount();
?>

<aside class="widget-area primary-sidebar col-lg-3 col-md-3 col-sm-12 col-xs-12">
    <section class="widget widget_categories">
        <h5 class="widget-title">Kategoriler</h5>
        <ul>
            <?php 
             $kategoriedit=$db->prepare("SELECT * from kategoriler order by kategori_id");
             $kategoriedit->execute(array());
             foreach ($kategoriedit as $value) { 

                $kategorisay=$db->prepare("SELECT * from urunler where urun_paket=0 and urun_kategori=:id");
                $kategorisay->execute(array("id" => $value['kategori_id']));
                $toplam_katsay=$kategorisay->rowCount();
                ?>
            <li>
                <a href="<?=seo('urun-kategori-'.$value["kategori_ad"]).'-'.$value["kategori_id"]?>"><?=$value['kategori_ad']?> <span class="posts-count"> (<?php echo $toplam_katsay ?>)</span></a>

            </li>
            <?php } ?>
            <li>
                <a href="urunler">Tüm Ürünler <span class="posts-count"> (<?php echo $toplam_bas ?>)</span></a>
            </li>
        </ul>
    </section>
</aside>