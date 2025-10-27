<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
$widget=$db->prepare("SELECT * from widget");
$widget->execute(array(0));
$widgetprint=$widget->fetch(PDO::FETCH_ASSOC);
?>
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
    <div class="page-header">
        <h2>Anasayfa Modül İşlemleri</h2>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-heading card-default">
                    Modül Düzenle
                </div>
                <div class="card-block">
                    <!-- AYAR  -->
                    <form method="POST" action="controller/function.php" class="form-horizontal">
                        <input type="hidden" name="widget_btwitter" readonly="" value="Html Alan" class="form-control">
                        <input type="hidden" name="widget_twitter" readonly="" value="Html Alan" class="form-control">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Modül Adı</label>
                                    <input type="text" placeholder="Bilgi Alanı" readonly class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <label>Modül Durum</label>
                                    <select name="widget_counter" class="form-control m-b">
                                        <?php if ($widgetprint['widget_counter']==1) { ?>
                                        <option value="1">Aktif</option>
                                        <option value="0">Pasif</option>
                                        <?php
										} else {?>
                                        <option value="0">Pasif</option>
                                        <option value="1">Aktif</option>
                                        <?php }?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <input type="hidden" name="widget_id" value="1" class="form-control">
                                <div class="col-md-6">
                                    <input type="text" name="widget_bhizmet" value="<?php echo htmlspecialchars($widgetprint['widget_bhizmet']); ?>" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <select name="widget_hizmet" class="form-control m-b">
                                        <?php if ($widgetprint['widget_hizmet']==1) { ?>
                                        <option value="1">Aktif</option>
                                        <option value="0">Pasif</option>
                                        <?php
										} else {?>
                                        <option value="0">Pasif</option>
                                        <option value="1">Aktif</option>
                                        <?php }?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" name="widget_bgaleri" readonly="" value="Html Alan" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <select name="widget_galeri" class="form-control m-b">
                                        <?php if ($widgetprint['widget_galeri']==1) { ?>
                                        <option value="1">Aktif</option>
                                        <option value="0">Pasif</option>
                                        <?php
										} else {?>
                                        <option value="0">Pasif</option>
                                        <option value="1">Aktif</option>
                                        <?php }?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" name="widget_bwelcome1" value="<?php echo htmlspecialchars($widgetprint['widget_bwelcome1']); ?>" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <select name="widget_welcome1" class="form-control m-b">
                                        <?php if ($widgetprint['widget_welcome1']==1) { ?>
                                        <option value="1">Aktif</option>
                                        <option value="0">Pasif</option>
                                        <?php
										} else {?>
                                        <option value="0">Pasif</option>
                                        <option value="1">Aktif</option>
                                        <?php }?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" name="widget_burun" readonly="" value="<?php echo htmlspecialchars($widgetprint['widget_burun']); ?>" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <select name="widget_urun" class="form-control m-b">
                                        <?php if ($widgetprint['widget_urun']==1) { ?>
                                        <option value="1">Aktif</option>
                                        <option value="0">Pasif</option>
                                        <?php
										} else {?>
                                        <option value="0">Pasif</option>
                                        <option value="1">Aktif</option>
                                        <?php }?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" name="widget_breferans" value="<?php echo htmlspecialchars($widgetprint['widget_breferans']); ?>" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <select name="widget_referans" class="form-control m-b">
                                        <?php if ($widgetprint['widget_referans']==1) { ?>
                                        <option value="1">Aktif</option>
                                        <option value="0">Pasif</option>
                                        <?php
										} else {?>
                                        <option value="0">Pasif</option>
                                        <option value="1">Aktif</option>
                                        <?php }?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" name="widget_bproje" value="<?php echo htmlspecialchars($widgetprint['widget_bproje']); ?>" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <select name="widget_bilgi" class="form-control m-b">
                                        <?php if ($widgetprint['widget_proje']==1) { ?>
                                        <option value="1">Aktif</option>
                                        <option value="0">Pasif</option>
                                        <?php
										} else {?>
                                        <option value="0">Pasif</option>
                                        <option value="1">Aktif</option>
                                        <?php }?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" name="widget_bblog" value="<?php echo htmlspecialchars($widgetprint['widget_bblog']); ?>" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <select name="widget_blog" class="form-control m-b">
                                        <?php if ($widgetprint['widget_blog']==1) { ?>
                                        <option value="1">Aktif</option>
                                        <option value="0">Pasif</option>
                                        <?php
										} else {?>
                                        <option value="0">Pasif</option>
                                        <option value="1">Aktif</option>
                                        <?php }?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" readonly="" placeholder="Footer üstü iletişim alanı" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <select name="widget_bilgi" class="form-control m-b">
                                        <?php if ($widgetprint['widget_bilgi']==1) { ?>
                                        <option value="1">Aktif</option>
                                        <option value="0">Pasif</option>
                                        <?php
										} else {?>
                                        <option value="0">Pasif</option>
                                        <option value="1">Aktif</option>
                                        <?php }?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="widget_byorum" value="<?php echo htmlspecialchars($widgetprint['widget_byorum']); ?>" class="form-control">
                        <input type="hidden" name="widget_yorum" value="1" class="form-control">
                        <input type="hidden" name="widget_ufiyat" value="<?php echo htmlspecialchars($widgetprint['widget_ufiyat']); ?>" readonly class="form-control">
                        <input type="hidden" name="widget_usatinal" value="<?php echo htmlspecialchars($widgetprint['widget_usatinal']); ?>" readonly class="form-control">
                        <input type="hidden" name="widget_diger" value="<?php echo htmlspecialchars($widgetprint['widget_diger']); ?>" class="form-control">
                        <input type="hidden" name="widget_bdiger" value="<?php echo htmlspecialchars($widgetprint['widget_bdiger']); ?>" class="form-control">
                        <input type="hidden" name="widget_bara" value="<?php echo htmlspecialchars($widgetprint['widget_bara']); ?>" class="form-control">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" name="widget_bwelcome" value="<?php echo htmlspecialchars($widgetprint['widget_bwelcome']); ?>" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <select name="widget_welcome" class="form-control m-b">
                                        <?php if ($widgetprint['widget_welcome']==1) { ?>
                                        <option value="1">Aktif</option>
                                        <option value="0">Pasif</option>
                                        <?php
										} else {?>
                                        <option value="0">Pasif</option>
                                        <option value="1">Aktif</option>
                                        <?php }?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <button style="cursor: pointer;" type="submit" name="widgetduzenle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Güncelle</button>
                    </form>
                    <!--#AYAR  -->
                </div>
            </div>
        </div>
    </div>
    <?php include 'footer.php'; ?>