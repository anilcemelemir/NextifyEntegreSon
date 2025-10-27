<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
$kategoriedit=$db->prepare("SELECT * from kategoripaket where kategori_id=:kategori_id");
$kategoriedit->execute(array(
	'kategori_id' => $_GET['kategori_id']
));
$kategoriwrite=$kategoriedit->fetch(PDO::FETCH_ASSOC);

?>
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
    <div class="page-header">
        <h2>Kategori İşlemleri</h2>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-heading card-default">
                    <div class="pull-right mt-10">
                        <a href="paket-kategori.php" class="btn btn-warning btn-icon"><i class="fa fa-reply"></i>Geri Dön</a>
                    </div>
                    Kategori Düzenle
                </div>
                <div class="card-block">
                    <form method="POST" action="controller/function.php" enctype="multipart/form-data" class="form-horizontal">
                        <div class="form-group">
                            <input type="hidden" name="kategori_id" value="<?php echo $kategoriwrite['kategori_id']; ?>">
                            <input type="hidden" name="vitrin" value="1">
                        </div>
                        <div class="form-group">
                            <label>Kategori Adı</label>
                            <input type="text" name="kategori_ad" value="<?php echo $kategoriwrite['kategori_ad']; ?>" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Kategori Görseli</label> <small> <b style="color: red;">Paketlerin içeriğinde görünecektir.</b></small>
                            <p><img style="max-height: 100px;max-width: 100px;" src="<?php echo $kategoriwrite['resim']; ?>"></p>
                        </div>
                        <div class="form-group">
                            <div class="fileinput fileinput-new input-group col-md-3" data-provides="fileinput">
                                <div class="form-control" data-trigger="fileinput"><span class="fileinput-filename"></span></div>
                                <span class="input-group-addon btn btn-primary btn-file ">
                                    <span class="fileinput-new">Yeni Yükle</span>
                                    <span class="fileinput-exists">Değiştir</span>
                                    <input type="file" name="resim">
                                </span>
                                <a href="#" class="input-group-addon btn btn-danger  hover fileinput-exists" data-dismiss="fileinput">Sil</a>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Kategori Sıra</label>
                            <input type="text" name="kategori_sira" value="<?php echo $kategoriwrite['kategori_sira']; ?>" class="form-control">
                        </div>
                        <hr>
                        <div class="">
                            <b style="color: red;">*SEO Meta Ayarları</b>
                            <p class="text-muted">Google başta olmak üzere tüm arama motorları sizi buraya girdiğiniz bilgiler doğrultusunda üst sıralara taşıyacaktır.</p>
                        </div>
                        <div class="form-group">
                            <label>Title</label>
                            <input type="text" name="kategori_title" value="<?php echo $kategoriwrite['kategori_title']; ?>" class="form-control form-control-rounded">
                        </div>

                        <div class="form-group">
                            <label>Description</label>
                            <input name="kategori_descr" type="text" value="<?php echo $kategoriwrite['kategori_descr']; ?>" class="form-control form-control-rounded">
                        </div>

                        <div class="form-group">
                            <label>Keywords</label>
                            <input type="text" name="kategori_keyword" value="<?php echo $kategoriwrite['kategori_keyword']; ?>" class="form-control form-control-rounded">
                            <small class="text-muted">Örnek : <code>elma, armut, muz, karpuz</code></small>
                        </div>
                        <button style="cursor: pointer;" type="submit" name="paketkategoriduzenle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Güncelle</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <?php include 'footer.php'; ?>