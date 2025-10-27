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
		<h2>Proje İşlemleri</h2>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-heading card-default">
					<div class="pull-right mt-10">
						<a href="projeler.php" class="btn btn-warning btn-icon"><i class="fa fa-reply"></i>Geri Dön</a>
					</div>
					Yazı Düzenle
				</div>
				<div class="card-block">

					<form method="POST" action="controller/function.php" enctype="multipart/form-data" class="form-horizontal">
						<div class="form-group">
							<label>Açıklama</label>
							<textarea style="height: 70px;" type="text" class="summernote" name="widget_pyazi" ><?php echo $widgetprint['widget_pyazi']; ?></textarea>
						</div>
						<div class="form-group">
							<label>Botun Adı</label>
							<input type="text" name="widget_pbuton" value="<?php echo $widgetprint['widget_pbuton']; ?>" class="form-control">
						</div>
						<div class="form-group">
							<label>Botun Link</label>
							<input type="text" name="widget_plink" value="<?php echo $widgetprint['widget_plink']; ?>" class="form-control">
						</div>
						<button style="cursor: pointer;" type="submit" name="projeyaziduzenle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Güncelle</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<?php include 'footer.php'; ?>
