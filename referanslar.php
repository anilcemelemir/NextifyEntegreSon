<?php require 'include/header.php';
$metakey=$db->prepare("SELECT * from meta where meta_id=15");
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
                <h1 class="page-title"><?php echo htmlspecialchars($widgetprint['widget_breferans']); ?></h1>
                <ul id="breadcrumbs" class="breadcrumbs">
                    <li><a href="<?php echo $settingsprint['ayar_siteurl']; ?>">Anasayfa</a></li>
                </ul>
            </div>
        </div>
    </div>
    <section class="p-t100 p-b0 particles-js" data-color="#fe4c1c,#00c3ff,#0160e7">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <div class="row justify-content-center">
                        <?php 
                        $refsor=$db->prepare("SELECT * from referanslar");
                        $refsor->execute(array(0));
                        while ($refprint=$refsor->fetch(PDO::FETCH_ASSOC)) { ?>
                        <div class="col-md-4 team-wrap" style="margin-bottom: 50px;">
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
</div>

<?php  include 'include/footer.php'; ?>