<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
$urunedit=$db->prepare("SELECT * from urunler where urun_id=:urun_id");
$urunedit->execute(array(
	'urun_id' => $_GET['urun_id']
));
$urunwrite=$urunedit->fetch(PDO::FETCH_ASSOC);

?>		
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
	<div class="page-header">
		<h2>Paket İşlemleri</h2>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-heading card-default">
					<div class="pull-right mt-10">
						<a href="paketler.php" class="btn btn-warning btn-icon"><i class="fa fa-reply"></i>Geri Dön</a>
					</div>
					Paket Düzenle
				</div>
				<div class="card-block">

					<form method="POST" action="controller/function.php" class="form-horizontal">
						<div class="form-group">
							<input type="hidden" name="urun_id" value="<?php echo $urunwrite['urun_id']; ?>">
						</div>
						<div class="form-group">
							<label>Paket Başlık</label>
							<input type="text" name="urun_baslik" value="<?php echo $urunwrite['urun_baslik']; ?>" class="form-control">
						</div>
						<div class="form-group">
							<label>Kategori Seç</label>
							<select name="urun_kategori" class="form-control m-b">
								<?php 
								$eskikategori=$db->prepare("SELECT * from kategoripaket where kategori_id=:kategori_id");
								$eskikategori->execute(array(
									'kategori_id' => $urunwrite['urun_kategori']
								));
								$eskikategoriyaz=$eskikategori->fetch(PDO::FETCH_ASSOC);
								?>
								<option value="<?php echo $eskikategoriyaz['kategori_id'] ?>"><?php echo $eskikategoriyaz['kategori_ad'] ?></option>
								<?php 
								$katsor=$db->prepare("SELECT * from kategoripaket");
								$katsor->execute(array(0));
								while ($katcek=$katsor->fetch(PDO::FETCH_ASSOC)) {
									?>
									<option value="<?php echo $katcek['kategori_id']; ?>"><?php echo $katcek['kategori_ad']; ?></option>
								<?php } ?>
							</select>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label>Aylık Fiyat</label>
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-try"></i></span>
										<input type="number" step="0.01" name="urun_aylik_fiyat" value="<?php echo $urunwrite['urun_aylik_fiyat']; ?>" class="form-control">
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Yıllık Fiyat</label>
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-try"></i></span>
										<input type="number" step="0.01" name="urun_yillik_fiyat" value="<?php echo $urunwrite['urun_yillik_fiyat']; ?>" class="form-control">
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label>Paket Fiyat (Opsiyonel)</label>
							<div class="input-group col-md-4">
								<span class="input-group-addon"><i class="fa fa-try"></i></span>
								<input type="text" name="urun_fiyat" value="<?php echo $urunwrite['urun_fiyat']; ?>" class="form-control">
							</div>     	
						</div>	
						<div class="form-group">
							<label>Vitrinde Göster</label>
							<select name="urun_vitrin" class="form-control m-b">
								<?php if ($urunwrite['urun_vitrin']==1) { ?>
									<option value="1" selected>Göster</option>
									<option value="0">Gizle</option>
								<?php } else { ?>
									<option value="0" selected>Gizle</option>
									<option value="1">Göster</option>
								<?php } ?>
							</select>
						</div>
						<div class="form-group">
							<label>Açıklama</label>
							<textarea style="height: 200px" class="form-control" name="urun_aciklama"><?php echo $urunwrite['urun_aciklama']; ?></textarea>
						</div>
						
						<button style="cursor: pointer;" type="submit" name="paketduzenle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o"></i>Güncelle</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<?php include 'footer.php'; ?>