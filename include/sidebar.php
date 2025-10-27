<?php   
$ToplamSay=$db->prepare("SELECT * from blog");
$ToplamSay->execute();
$toplam_bas=$ToplamSay->rowCount();
?>


<aside class="widget-area primary-sidebar col-lg-3 col-md-3 col-sm-12 col-xs-12">
    <section class="widget widget_categories">
        <h5 class="widget-title">Kategoriler</h5>
        <ul>
            <?php 
             $kategoriedit=$db->prepare("SELECT * from kategorilerb order by kategori_id");
             $kategoriedit->execute(array());
             foreach ($kategoriedit as $value) { 

                $kategorisay=$db->prepare("SELECT * from blog where blog_kategori=:id");
                $kategorisay->execute(array("id" => $value['kategori_id']));
                $toplam_katsay=$kategorisay->rowCount();
                ?>
            <li>
                <a href="<?=seo('konu-'.$value["kategori_ad"]).'-'.$value["kategori_id"]?>"><?=$value["kategori_ad"]?></a> <span class="posts-count">(<?php echo $toplam_katsay ?>)</span>
            </li>
            <?php } ?>
            <li>
                <a href="<?=seo('konu-'.$value["kategori_ad"]).'-'.$value["kategori_id"]?>">Tüm Konular</a> <span class="posts-count">(<?php echo $toplam_bas ?>)</span>
            </li>
        </ul>
    </section>
    <section class="widget widget_recent_news">
        <h5 class="widget-title">Popüler Yazılar</h5>
        <ul class="recent-news clearfix">

            <?php 
            $blogx=$db->prepare("SELECT * from blog order by RAND() Limit 5");
            $blogx->execute();
            foreach ($blogx as $key => $blogceks) { 
                $kategorisor = $db->prepare( "SELECT * from kategorilerb where kategori_id=:KatId" );
                $kategorisor->execute( array( "KatId" => $blogceks['blog_kategori'] ) );
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
                $Gun= substr($blogceks['blog_tarih'],8,2);
                $Ay= (int) substr($blogceks['blog_tarih'],5,2);
                $Yil= substr($blogceks['blog_tarih'],0,4); ?>
            <li class="clearfix">
                <div class="thumb">
                    <a href="<?=seo('blog-'.$blogceks["blog_baslik"]).'-'.$blogceks["blog_id"]?>">
                        <img style="width: 70px;height:70px;" src="admin/<?php echo $blogceks['blog_resim']; ?>" alt="<?php echo $blogceks['blog_baslik']; ?>">
                    </a>
                </div>
                <div class="entry-header">
                    <h6><a href="<?=seo('blog-'.$blogceks["blog_baslik"]).'-'.$blogceks["blog_id"]?>"><?php echo $blogceks['blog_baslik']; ?></a></h6>
                    <span class="post-on"><span class="entry-date"><?php echo $Gun." ".$aylar[$Ay]." ".$Yil; ?></span></span>
                </div>
            </li>
            <?php } ?>

        </ul>
    </section>
</aside>