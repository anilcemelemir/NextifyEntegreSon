<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
include 'controller/seo.php';
$duyuruedit=$db->prepare("SELECT * from duyuru where duyuru_id=:duyuru_id");
$duyuruedit->execute(array(
	'duyuru_id' => $_GET['duyuru_id']
));
$duyuruwrite=$duyuruedit->fetch(PDO::FETCH_ASSOC);

?>		
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
	<div class="page-header">
		<h2>Duyuru İşlemleri</h2>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-heading card-default">
					<div class="pull-right mt-10">
						<a href="duyurular.php" class="btn btn-warning btn-icon"><i class="fa fa-reply"></i>Geri Dön</a>
					</div>
					Duyuru Düzenle
				</div>
				<div class="card-block">
					<form method="POST" action="controller/function.php" enctype="multipart/form-data" class="form-horizontal">
						<div class="form-group">
							<input type="hidden" name="duyuru_id" value="<?php echo $duyuruwrite['duyuru_id']; ?>">
						</div>
						
						<div class="form-group">
							<label>Duyuru Adı</label>
							<input type="text" name="duyuru_baslik" value="<?php echo $duyuruwrite['duyuru_baslik']; ?>" class="form-control">
						</div>

						<div class="form-group">
							<label>Duyuru İçerik</label>
							<textarea class="summernote" name="duyuru_detay"><?php echo $duyuruwrite['duyuru_detay']; ?></textarea>
						</div>

						<div class="form-group">
							<label>Durum</label>
							<select name="duyuru_durum" class="form-control m-b">
								<?php if ($duyuruwrite['duyuru_durum']==1) { ?>
								<option value="1">Aktif</option>
								<option value="0">Pasif</option>
								<?php
							} else {?>
							<option value="0">Pasif</option>
							<option value="1">Aktif</option>
							<?php }?>
						</select>
					</div>

					<button style="cursor: pointer;" type="submit" name="duyuruduzenle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Güncelle</button>
				</form>
			</div>
		</div>
	</div>
</div>

<?php include 'footer.php'; ?>
