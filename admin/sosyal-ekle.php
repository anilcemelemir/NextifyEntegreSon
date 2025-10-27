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
		<h2>Sosyal Medya İşlemleri</h2>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-heading card-default">
					<div class="pull-right mt-10">
						<a href="sosyal-medya.php" class="btn btn-warning btn-icon"><i class="fa fa-reply"></i>Geri Dön</a>
					</div>
					Sosyal Medya Düzenle
				</div>
				<div class="card-block">

					<form method="POST" action="controller/function.php" class="form-horizontal">
						<div class="form-group">
							<label>Sosyal Link</label>
							<input type="text" name="sosyal_link" placeholder="Sosyal medya linkinizi giriniz." class="form-control">
						</div>
						<div class="form-group">
							<label>Sosyal İcon (Fontawosome) <a target="_blank" href="https://fontawesome.com/v4.7.0/icons/"><i class="fa fa-external-link"></i></a></label>							
							<input type="text" name="sosyal_icon" placeholder="fa fa-facebook" class="form-control">
						</div>
						<button style="cursor: pointer;" type="submit" name="sosyalekle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Güncelle</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<?php include 'footer.php'; ?>
