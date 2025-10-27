<?php require 'include/header.php';
$metakey=$db->prepare("SELECT * from meta where meta_id=2");
$metakey->execute(array(0));
$metakeyprint=$metakey->fetch(PDO::FETCH_ASSOC);
$meta = [
    'title' => $metakeyprint['meta_title'],
    'keywords' => $metakeyprint['meta_keyword'],
    'description' => $metakeyprint['meta_descr']
]; require 'include/menu.php'; ?>
<div id="content" class="site-content">
    <div class="page-header dtable text-center" style="background-image: url(admin/<?php echo $settingsprint['resim_title']; ?>);">
        <div class="dcell">
            <div class="container">
                <h1 class="page-title">Hizmetlerimiz</h1>
                <ul id="breadcrumbs" class="breadcrumbs">
                    <li><a href="<?php echo $settingsprint['ayar_siteurl']; ?>">Anasayfa</a></li>
                </ul>
            </div>
        </div>
    </div>
    <section class="home3-project m-t100">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <div class="project">
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