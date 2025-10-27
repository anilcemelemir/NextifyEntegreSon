<?php require 'include/header.php';
$blogsor=$db->prepare("SELECT * from blog where blog_id=:blog_id");
$blogsor->execute(array(
    'blog_id' => $_GET['blog_id']
));
$blogcek=$blogsor->fetch(PDO::FETCH_ASSOC);
$meta = [
    'title' => $blogcek['blog_title'],
    'keywords' => $blogcek['blog_keyword'],
    'description' => $blogcek['blog_descr']
]; require 'include/menu.php';
$kategoriedit=$db->prepare("SELECT * from kategorilerb where kategori_id=:kategori_id");
$kategoriedit->execute(array(
    'kategori_id' => $blogcek['blog_kategori']
));
$kategoriwrite=$kategoriedit->fetch(PDO::FETCH_ASSOC); ?>
<div id="content" class="site-content">
    <div class="page-header dtable text-center" style="background-image: url(admin/<?php echo $settingsprint['resim_title']; ?>);">
        <div class="dcell">
            <div class="container">
                <h1 class="page-title"><?php echo $blogcek['blog_baslik'] ?></h1>
                <ul id="breadcrumbs" class="breadcrumbs">
                    <li><a href="<?php echo $settingsprint['ayar_siteurl']; ?>">Anasayfa</a></li>
                    <li>
                        <a href="blog">Blog</a>
                    </li>
                    <li>
                        <a href="<?=seo('konu-'.$kategoriwrite["kategori_ad"]).'-'.$kategoriwrite["kategori_id"]?>"><?php echo $kategoriwrite['kategori_ad'] ?></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <section class="home2-news particles-js m-t100" data-color="#fe4c1c,#00c3ff,#0160e7" data-id="i1-2">
        <div class="bg-overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-xs-12">
                    <article class="post-box blog-post">
                        <div class="single-post-inner">
                            <div class="entry-media">
                                <img src="admin/<?php echo $blogcek['blog_resim']; ?>" style="width: 100%;" alt="<?php echo $blogcek['blog_baslik']; ?>">
                            </div>
                        </div>
                        <div class="inner-post no-padding-top">
                            <div class="entry-summary">
                                <h3><?php echo $blogcek['blog_baslik'] ?></h3>
                                <p><?php echo $blogcek['blog_detay'] ?></p>
                            </div>
                            <div class="entry-footer clearfix">
                                <div class="share-post">
                                    <a class="twit" target="_blank" href="https://twitter.com/intent/tweet?url=http://<?php echo $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI']; ?>" title="Twitter"><i class="fab fa-twitter"></i>Twitter</a>
                                    <a class="face" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http://<?php echo $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI']; ?>" title="Facebook"><i class="fab fa-facebook-f"></i>Facebook</a>
                                    <a class="pint" target="_blank" href="http://www.tumblr.com/share/link?url=http://<?php echo $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI']; ?>"><i class="fab fa-tumblr"></i>Tumblr</a>
                                    <a class="linked" target="_blank" href="http://reddit.com/submit?url=http://<?php echo $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI']; ?>"><i class="fab fa-linkedin-in"></i>LinkedIn</a>
                                </div>
                            </div>
                    </article>
                </div>
                <?php include 'include/sidebar.php'; ?>
            </div>
        </div>
    </section>
</div>

<?php  include 'include/footer.php'; ?>