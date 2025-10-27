<?php require 'include/header.php';
$sayfasor=$db->prepare("SELECT * from sayfalar where sayfa_id=:sayfa_id");
$sayfasor->execute(array(
    'sayfa_id' => $_GET['sayfa_id']
));
$sayfacek=$sayfasor->fetch(PDO::FETCH_ASSOC);
$meta = [
    'title' => $sayfacek['sayfa_title'],
    'description' => $sayfacek['sayfa_descr'],
    'keywords' => $sayfacek['sayfa_keyword']
];
require 'include/menu.php'; ?>
<div id="content" class="site-content">
    <div class="page-header dtable text-center" style="background-image: url(admin/<?php echo $settingsprint['resim_title']; ?>);">
        <div class="dcell">
            <div class="container">
                <h1 class="page-title"><?php echo $sayfacek['sayfa_baslik']; ?></h1>
                <ul id="breadcrumbs" class="breadcrumbs">
                    <li><a href="<?php echo $settingsprint['ayar_siteurl']; ?>">Anasayfa</a></li>
                </ul>
            </div>
        </div>
    </div>
    <section class="p-t40">
        <div class="container">
            <h3><?php echo $sayfacek['sayfa_baslik']; ?></h3>
            <p>
                <?php echo $sayfacek['sayfa_icerik']; ?>
            </p>
        </div>
    </section>
</div>

<?php  include 'include/footer.php'; ?>