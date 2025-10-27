<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
$counter=$db->prepare("SELECT * from counter");
$counter->execute(array(0));

?>
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
    <div class="page-header">
        <h2>Counter İşlemleri</h2>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-heading card-default">
                    Counter Düzenle
                </div>
                <div class="card-block">
                    <?php while ($counterprint=$counter->fetch(PDO::FETCH_ASSOC)) { ?>
                    <!-- AYAR  -->
                    <form method="POST" action="controller/function.php" class="form-horizontal">
                        <div class="form-group">
                            <div class="row">
                                <input type="hidden" name="counter_id" value="<?php echo $counterprint['counter_id']; ?>" class="form-control">
                                <input type="hidden" name="counter_icon" value="fa" class="form-control">
                                <div class="col-md-4">
                                    <label>Counter Adı</label>
                                    <input type="text" name="counter_isim" value="<?php echo $counterprint['counter_isim']; ?>" class="form-control">
                                </div>
                                <div class="col-md-2">
                                    <label>Counter 100% Değeri</label>
                                    <input type="text" name="counter_rakam" value="<?php echo $counterprint['counter_rakam']; ?>" class="form-control">
                                </div>
                                <div class="col-md-2">
                                    <label>İşlemler</label><br />
                                    <button style="cursor: pointer;" type="submit" name="counterduzenle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Güncelle</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!--#AYAR  -->
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
    <?php include 'footer.php'; ?>