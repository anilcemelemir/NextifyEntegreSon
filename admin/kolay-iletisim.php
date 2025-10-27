<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
$whatsapp=$db->prepare("SELECT * from whatsapp where whats_id=0");
$whatsapp->execute(array(0));
$whatsappprint=$whatsapp->fetch(PDO::FETCH_ASSOC);
?>
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
    <div class="page-header">
        <h2>Kolay İletişim İşlemleri</h2>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-heading card-default">
                    Kolay İletişim Düzenle
                </div>

                <div class="card-block">
                    <!-- AYAR  -->
                    <form method="POST" action="controller/function.php" class="form-horizontal">
                        <div class="form-group">
                            <div class="row">

                                <input type="hidden" name="whats_id" value="0" class="form-control">
                                <input type="hidden" name="whats_cdestek" value="0" class="form-control">
                                <input type="hidden" name="whats_cdestekdurum" value="0" class="form-control">
                                <input type="hidden" name="whats_skype" value="0" class="form-control">
                                <input type="hidden" name="whats_skypedurum" value="0" class="form-control">
                                <input type="hidden" name="whats_mail" value="0" class="form-control">
                                <input type="hidden" name="whats_maildurum" value="0" class="form-control">
                                <input type="hidden" name="whats_sssdurum" value="0" class="form-control">
                                <input type="hidden" name="whats_iletisimdurum" value="0" class="form-control">
                                <!-- Grup -->
                                <div class="col-md-6">
                                    <label>Whatsapp Tel:</label> <small>(Başında 0 'Sıfır' olmadan giriniz.)</small>
                                    <input type="text" name="whats_tel" value="<?php echo $whatsappprint['whats_tel']; ?>" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <label>Modül Durum</label>
                                    <select name="whats_durum" class="form-control m-b">
                                        <?php if ($whatsappprint['whats_durum']==1) { ?>
                                        <option value="1">Aktif</option>
                                        <option value="0">Pasif</option>
                                        <?php } else { ?>
                                        <option value="0">Pasif</option>
                                        <option value="1">Aktif</option>
                                        <?php }?>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div style="margin-top: 20px;" class="col-md-6">
                                    <label>Tıkla Ara:</label> <small>(Başında 0 'Sıfır' olmadan giriniz.)</small>
                                    <input type="text" name="whats_tiklaara" value="<?php echo $whatsappprint['whats_tiklaara']; ?>" class="form-control">
                                </div>
                                <div style="margin-top: 20px;" class="col-md-6">
                                    <label>Modül Durum</label>
                                    <select name="whats_tiklaaradurum" class="form-control m-b">
                                        <?php if ($whatsappprint['whats_tiklaaradurum']==1) { ?>
                                        <option value="1">Aktif</option>
                                        <option value="0">Pasif</option>
                                        <?php } else { ?>
                                        <option value="0">Pasif</option>
                                        <option value="1">Aktif</option>
                                        <?php }?>
                                    </select>
                                </div>
                                <!-- Grup -->
                            </div>
                        </div>
                        <button style="cursor: pointer;" type="submit" name="whatsappduzenle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Güncelle</button>
                    </form>
                    <!--#AYAR  -->
                </div>
            </div>
        </div>
    </div>
    <?php include 'footer.php'; ?>