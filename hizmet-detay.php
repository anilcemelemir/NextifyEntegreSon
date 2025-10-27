<?php require 'include/header.php';
$hizmetsor=$db->prepare("SELECT * from hizmetler where hizmet_id=:hizmet_id");
$hizmetsor->execute(array(
    'hizmet_id' => $_GET['hizmet_id']
));
$hizmetcek=$hizmetsor->fetch(PDO::FETCH_ASSOC);
$meta = [
    'title' => $hizmetcek['hizmet_title'],
    'keywords' => $hizmetcek['hizmet_keyword'],
    'description' => $hizmetcek['hizmet_descr']
]; require 'include/menu.php'; ?>
<div id="content" class="site-content">
    <div class="page-header dtable text-center" style="background-image: url(admin/<?php echo $settingsprint['resim_title']; ?>);">
        <div class="dcell">
            <div class="container">
                <h1 class="page-title"><?php echo $hizmetcek['hizmet_baslik']; ?></h1>
                <ul id="breadcrumbs" class="breadcrumbs">
                    <li><a href="<?php echo $settingsprint['ayar_siteurl']; ?>">Anasayfa</a></li>
                    <li class="active"><a href="<?php echo $settingsprint['ayar_siteurl']; ?>/hizmetler">Hizmetler</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="entry-content" style="padding: 72px 0 0px;">
        <div class="container">
            <div class="row">
                <div class="content-area col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <article class="post-box blog-post">
                        <div class="single-post-inner">
                            <div class="entry-media">
                                <img src="admin/<?php echo $hizmetcek['hizmet_resim']; ?>" style="width: 100%;" alt="<?php echo $hizmetcek['hizmet_baslik']; ?>">
                            </div>
                        </div>
                        <div class="inner-post no-padding-top">
                            <div class="entry-summary">
                                <h3><?php echo $hizmetcek['hizmet_baslik']; ?></h3>
                                <p><?php echo $hizmetcek['hizmet_icerik']; ?></p>
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
            </div>
        </div>
    </div>
    <section class="home3-project-title">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-8 col-xs-12">
                    <div class="ot-heading left-align">
                        <h2 class="main-heading">Diğer Hizmetlerimiz</h2>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12 text-right xs-text-left xs-m-t30">
                    <div class="ot-button m-t15">
                        <a href="Hizmetler" class="octf-btn octf-btn-primary octf-btn-icon"><span>Tümünü Göster <i class="flaticon-right-arrow-1"></i></span></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="home3-project" style="padding: 0 75px 53px 75px;">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <div class="project-slider">
                        <?php 
                        $hizmetarticle=$db->prepare("SELECT * from hizmetler order by hizmet_id");
                        $hizmetarticle->execute(array(0));
                        while ($hizmetarticleprint=$hizmetarticle->fetch(PDO::FETCH_ASSOC)) { ?>
                        <div class="project-item media optimization ">
                            <div class="projects-box">
                                <div class="projects-thumbnail">
                                    <a href="<?=seo('hizmet-'.$hizmetarticleprint["hizmet_baslik"]).'-'.$hizmetarticleprint["hizmet_id"]?>">
                                        <img src="admin/<?php echo $hizmetarticleprint['hizmet_resim']; ?>" alt="<?php echo $hizmetarticleprint['hizmet_baslik'] ?>">
                                    </a>
                                </div>
                                <div class="portfolio-info s1">
                                    <div class="portfolio-info-inner">
                                        <h5 style="margin-bottom: 22px;"><a href="<?=seo('hizmet-'.$hizmetarticleprint["hizmet_baslik"]).'-'.$hizmetarticleprint["hizmet_id"]?>"><?php echo $hizmetarticleprint['hizmet_baslik'] ?></a></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php } ?>

                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<?php  include 'include/footer.php'; ?>