<?php require 'include/header.php';
$metakey=$db->prepare("SELECT * from meta where meta_id=5");
$metakey->execute(array(0));
$metakeyprint=$metakey->fetch(PDO::FETCH_ASSOC);
$meta = [
  'title' => "404 - Sayfa Bulunamadı!",
  'keywords' => "404 - Sayfa Bulunamadı!",
  'description' => "404 - Sayfa Bulunamadı!"
]; require 'include/menu.php'; ?>
<div id="content" class="site-content">
    <div class="container">
        <div class="error-404 not-found text-center">
            <h2>404 <img class="error-image" src="images/404.png" alt="404"></h2>
            <h1>Üzgünüm! Sayfa Bulunamadı!</h1>
            <div class="content-404">
                <p>Oops! Girmeye çalıştığınız sayfa yanlış yazılmış, silinmiş veya geçici olarak kaldırılmış olabilir.</p>
                <a class="octf-btn octf-btn-third octf-btn-icon" href="<?=$settingsprint['ayar_siteurl']?>">Anasayfaya Dön<i class="flaticon-right-arrow-1"></i></a>
            </div>
        </div>
    </div>

</div>

<?php  include 'include/footer.php'; ?>