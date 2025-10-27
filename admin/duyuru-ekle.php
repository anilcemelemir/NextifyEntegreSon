<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
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
					Duyuru Ekle
				</div>
				<div class="card-block">

					<form method="POST" action="controller/function.php" enctype="multipart/form-data" class="form-horizontal">						
						<div class="form-group">
							<label>Duyuru Başlık</label>
							<input type="text" name="duyuru_baslik" placeholder="Duyuru başlık giriniz." class="form-control">
						</div>

						<div class="form-group">
							<label>Duyuru İçerik</label>
							<textarea class="summernote" name="duyuru_detay" placeholder="İçerik giriniz"></textarea>
						</div>
						
						<button style="cursor: pointer;" type="submit" name="duyuruekle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Kaydet</button>
						<a href="duyurular.php" class="btn btn-warning btn-icon"><i class="fa fa-reply"></i>Geri Dön</a>
					</form>
				</div>
			</div>
		</div>
	</div>

	<?php include 'footer.php'; ?>
