<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
$html=$db->prepare("SELECT * from widget");
$html->execute(array());
$htmlwrite=$html->fetch(PDO::FETCH_ASSOC);
?>
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
    <div class="page-header">
        <h2>HTML Alan İşlemleri</h2>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-block">
                    <form method="POST" action="controller/function.php" enctype="multipart/form-data" class="form-horizontal">

                        <div class="form-group">
                            <label>Ana Sayfa Html Yanı Yüklü Resim</label>
                            <p><img style="max-height: 100px;max-width: 100px;" src="<?php echo $settingsprint['ayar_resimcounter']; ?>"></p>

                        </div>
                        <div class="form-group">
                            <div class="fileinput fileinput-new input-group col-md-3" data-provides="fileinput">
                                <div class="form-control" data-trigger="fileinput"><span class="fileinput-filename"></span></div>
                                <span class="input-group-addon btn btn-primary btn-file ">
                                    <span class="fileinput-new">Yeni Yükle</span>
                                    <span class="fileinput-exists">Değiştir</span>
                                    <input type="file" name="ayar_resimcounter">
                                </span>
                                <a href="#" class="input-group-addon btn btn-danger  hover fileinput-exists" data-dismiss="fileinput">Sil</a>
                            </div>
                        </div>
                        <input type="hidden" name="widget_id" value="1">
                        <div class="form-group">
                            Anasayfa Html Alanı
                            <textarea class="summernote" name="widget_html"><?php echo $htmlwrite['widget_html']; ?></textarea>
                        </div>
                        <div class="form-group">
                            <label>Footer Logo</label>
                            <p><img style="max-height: 100px;max-width: 100px;background:#f1f1f1;" src="<?php echo $settingsprint['ayar_resimparalax']; ?>"></p>

                        </div>
                        <div class="form-group">
                            <div class="fileinput fileinput-new input-group col-md-3" data-provides="fileinput">
                                <div class="form-control" data-trigger="fileinput"><span class="fileinput-filename"></span></div>
                                <span class="input-group-addon btn btn-primary btn-file ">
                                    <span class="fileinput-new">Yeni Yükle</span>
                                    <span class="fileinput-exists">Değiştir</span>
                                    <input type="file" name="ayar_resimparalax">
                                </span>
                                <a href="#" class="input-group-addon btn btn-danger  hover fileinput-exists" data-dismiss="fileinput">Sil</a>
                            </div>
                        </div>
                        <div class="form-group">
                            <span>Footer Html Alanı</span>
                            <textarea class="summernote" name="widget_html2"><?php echo $htmlwrite['widget_html2']; ?></textarea>
                        </div>
                        <button style="cursor: pointer;" type="submit" name="htmlduzenle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Güncelle</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <?php include 'footer.php'; ?>