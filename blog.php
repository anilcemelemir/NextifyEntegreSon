<?php require 'include/header.php';
$kategori = htmlspecialchars(trim(@$_GET['kategori_id']));
if (!empty($kategori)) {
    $kategoriedit=$db->prepare("SELECT * from kategorilerb where kategori_id=:kategori_id");
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
    $metakey=$db->prepare("SELECT * from meta where meta_id=4");
    $metakey->execute(array(0));
    $metakeyprint=$metakey->fetch(PDO::FETCH_ASSOC);
    $meta = [
        'title' => $metakeyprint['meta_title'],
        'keywords' => $metakeyprint['meta_keyword'],
        'description' => $metakeyprint['meta_descr']
    ];
} require 'include/menu.php'; 
$sayfada = 6; // sayfada gösterilecek içerik miktarını belirtiyoruz.

if (!empty($kategori)) {
    $sorgu=$db->prepare("SELECT * from blog where blog_kategori=$kategori");
} else {
    $sorgu=$db->prepare("SELECT * from blog");
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
    $blog=$db->prepare("SELECT * from blog where blog_kategori=$kategori order by blog_id DESC Limit $limit,$sayfada");
    $blog->execute(array(
        'bloglimit' => "$limit,$sayfada"
    )); 
} else {    
    $blog=$db->prepare("SELECT * from blog order by blog_id DESC Limit $limit,$sayfada");
    $blog->execute(array(
        'bloglimit' => "$limit,$sayfada"
    )); 
}
?>
<div id="content" class="site-content">
    <div class="page-header dtable text-center" style="background-image: url(admin/<?php echo $settingsprint['resim_title']; ?>);">
        <div class="dcell">
            <div class="container">
                <h1 class="page-title"><?php if (empty($kategori)) {  ?> Blog <?php } else { ?><a class="text-dark" href="<?= seo( 'konu-kategori-' . $kategoriwrite[ "kategori_ad" ] ) . '-' . $kategoriwrite[ "kategori_id" ] ?>"><?php echo $kategoriwrite['kategori_ad'] ?></a> <?php } ?></h1>
                <ul id="breadcrumbs" class="breadcrumbs">
                    <li><a href="<?php echo $settingsprint['ayar_siteurl']; ?>">Anasayfa</a></li>
                    <li class="<?php if (empty($kategori)) {  ?> active <?php } ?>">
                        <?php if (empty($kategori)) {  ?> Blog <?php } else { ?><a href="blog">Blog</a> <?php } ?>
                    </li>
                    <?php if (!empty($kategori)) {  ?>
                    <li>
                        <?php echo $kategoriwrite['kategori_ad'] ?>
                    </li>
                    <?php } ?>
                </ul>
            </div>
        </div>
    </div>
    <section class="home2-news particles-js m-t100" data-color="#fe4c1c,#00c3ff,#0160e7" data-id="i1-2">
        <div class="bg-overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-xs-12">
                    <div class="flex-row pf_3_cols" style="position: static !important;">
                        <?php  
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
                        <article class="col-md-6 col-sm-12 col-xs-12 post-box masonry-post-item">
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
                <?php include 'include/sidebar.php'; ?>
            </div>
        </div>
    </section>
</div>

<?php  include 'include/footer.php'; ?>