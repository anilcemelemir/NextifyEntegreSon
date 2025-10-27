<?php require 'include/header.php';
$metakey=$db->prepare("SELECT * from meta where meta_id=5");
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
                <h1 class="page-title">SSS</h1>
                <ul id="breadcrumbs" class="breadcrumbs">
                    <li><a href="<?php echo $settingsprint['ayar_siteurl']; ?>">Anasayfa</a></li>
                </ul>
            </div>
        </div>
    </div>
    <section class="p-t100 p-b100">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <div class="ot-heading left-align">
                        <h2 class="main-heading">Sık Sorularn Sorular</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <div class="ot-accordions accordions-gradient"><?php 
                        $ssssor=$db->prepare("SELECT * from sss order by sss_sira ASC");
                        $ssssor->execute();
                        $firstt = 0;
                        foreach ($ssssor as  $ssscek) { ?>
                        <div class="acc-item <?php if ($firstt == 0) { ?> current <?php } ?>">
                            <span class="acc-toggle"><?php echo $ssscek['sss_soru']; ?> <i class="down flaticon-arrow-pointing-to-down"></i><i class="up flaticon-arrow-pointing-to-up"></i></span>
                            <div class="acc-content <?php if ($firstt == 0) { ?> active <?php } ?>" <?php if ($firstt == 0) { ?> style="display: block;" <?php } ?>>
                                <p><?php echo $ssscek['sss_cevap']; ?></p>
                            </div>
                        </div>
                        <?php $firstt += 1; } ?>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<?php  include 'include/footer.php'; ?>