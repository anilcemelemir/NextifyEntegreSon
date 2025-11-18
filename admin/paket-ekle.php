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
		<h2>Paket İşlemleri</h2>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-heading card-default">
					<div class="pull-right mt-10">
						<a href="paketler.php" class="btn btn-warning btn-icon"><i class="fa fa-reply"></i>Geri Dön</a>
					</div>
					Paket Ekle
				</div>
				<div class="card-block">

					<form method="POST" action="controller/function.php" class="form-horizontal">
						<div class="form-group">
							<label>Paket Başlık</label>
							<input type="text" name="urun_baslik" placeholder="Ürün başlığı giriniz." class="form-control">
						</div>
						<div class="form-group">
							<label>Kategori Seç</label>
							<select name="urun_kategori" class="form-control m-b">
								<option value="">Seçiniz</option>
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
										<input type="number" step="0.01" name="urun_aylik_fiyat" placeholder="Aylık fiyat giriniz." class="form-control">
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Yıllık Fiyat</label>
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-try"></i></span>
										<input type="number" step="0.01" name="urun_yillik_fiyat" placeholder="Yıllık fiyat giriniz." class="form-control">
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label>Paket Fiyat (Opsiyonel)</label>
							<div class="input-group col-md-4">
								<span class="input-group-addon"><i class="fa fa-try"></i></span>
								<input type="text" name="urun_fiyat" placeholder="Yeni fiyatı giriniz." class="form-control">
							</div>     	
						</div>
						<div class="form-group">
							<label>Vitrinde Göster</label>
							<select name="urun_vitrin" class="form-control m-b">
								<option value="1">Göster</option>
								<option value="0">Gizle</option>
							</select>
							<small class="text-muted">Paketler ana sayfada gösterilecektir</small>
						</div>
						<div class="form-group">
							<label>Açıklama</label>
							<textarea style="height: 200px" class="" name="urun_aciklama">Açıklama giriniz.</textarea>
						</div>
						
						<button style="cursor: pointer;" type="submit" name="paketekle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Kaydet</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<?php include 'footer.php'; ?>