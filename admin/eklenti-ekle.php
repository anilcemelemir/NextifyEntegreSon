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
		<h2>Hesap İşlemleri</h2>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-heading card-default">
					<div class="pull-right mt-10">
						<a href="hesaplarim.php" class="btn btn-warning btn-icon"><i class="fa fa-reply"></i>Geri Dön</a>
					</div>
					Hesap Ekle
				</div>
				<div class="card-block">
					<form method="POST" action="controller/function.php" class="form-horizontal">
						<div class="form-group">
							<label>Eklenti Adı</label>
							<input type="text" name="ad" placeholder="İçerik giriniz." class="form-control">
						</div>
						<div class="form-group">
							<label>Eklenti Cinsi</label>
							<select name="cinsi" class="form-control m-b">
								<option value="0">Hosting</option>
								<option value="1">Eklenti</option>
							</select>
						</div>
						<div class="form-group">
							<label>Eklenti Fiyat</label>
							<input type="text" name="fiyat" placeholder="İçerik giriniz." class="form-control">
						</div>
						<div class="form-group">
							<label>Eklenti Ek Açıklama (Cinsi Eklenti Olanlar İçindir.)</label>
							<input type="text" name="aciklama" placeholder="İçerik giriniz." class="form-control">
						</div>
						<div class="form-group">
							<label>Sira</label>
							<input type="number" min="0" name="sira" placeholder="İçerik giriniz." class="form-control">
						</div>
						<button style="cursor: pointer;" type="submit" name="eklentiekle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Güncelle</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<?php include 'footer.php'; ?>
