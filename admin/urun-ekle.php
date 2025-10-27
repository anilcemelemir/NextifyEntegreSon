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

		<h2>Ürün İşlemleri</h2>

	</div>

	<div class="row">

		<div class="col-sm-12">

			<div class="card">

				<div class="card-heading card-default">

					<div class="pull-right mt-10">

						<a href="urunler.php" class="btn btn-warning btn-icon"><i class="fa fa-reply"></i>Geri Dön</a>

					</div>

					Ürün Ekle

				</div>

				<div class="card-block">



					<form method="POST" action="controller/function.php" class="form-horizontal">

						<div class="form-group">

							<label>Ürün Başlık</label>

							<input type="text" name="urun_baslik" placeholder="Ürün başlığı giriniz." class="form-control">

						</div>

						<div class="form-group">

							<label>Kategori Seç</label>

							<select name="urun_kategori" class="form-control m-b">

								<option value="">Seçiniz</option>

								<?php 

								$katsor=$db->prepare("SELECT * from kategoriler");

								$katsor->execute(array(0));

								while ($katcek=$katsor->fetch(PDO::FETCH_ASSOC)) {

									?>

									<option value="<?php echo $katcek['kategori_id']; ?>"><?php echo $katcek['kategori_ad']; ?></option>

								<?php } ?>

							</select>

						</div>

						<div class="form-group">

							<label>Demo Link</label>

							<input type="text" name="urun_demo" placeholder="Demo link giriniz." class="form-control">

						</div>

						<div class="form-group">

							<label>Demo Admin Link</label>

							<input type="text" name="urun_admin" placeholder="Admin link giriniz." class="form-control">

						</div>

						<div class="form-group">

							<label>Admin Kullanıcı</label>

							<input type="text" name="urun_auser" placeholder="Kullanıcı adı giriniz." class="form-control">

						</div>

						<div class="form-group">

							<label>Admin Şifre</label>

							<input type="text" name="urun_apass" placeholder="Şifre giriniz." class="form-control">

						</div>

						<div class="form-group">

							<label>Ürün Fiyat</label>

							<div class="input-group col-md-4">

								<span class="input-group-addon"><i class="fa fa-try"></i></span>

								<input type="text" name="urun_fiyat" placeholder="Yeni fiyatı giriniz." class="form-control">

							</div>     	

						</div>

						<div class="form-group">

							<label>Ürün Eski Fiyat</label>

							<div class="input-group col-md-4">

								<span class="input-group-addon"><i class="fa fa-try"></i></span>

								<input type="text" name="urun_efiyat" placeholder="Eski fiyatı giriniz." class="form-control">

							</div>     	

						</div>

						<div class="form-group">

							<label>Açıklama</label>

							<textarea class="summernote" name="urun_aciklama">Açıklama giriniz.</textarea>

						</div>

						<div class="form-group">

							<label>Başarılı Ödeme Sonrası Onaylı Siparişlerde Görünecek Alan (İndirme Linki vs.)</label>

							<textarea class="summernote" name="link">Açıklama giriniz.</textarea>

						</div>

						<div class="form-group">

							<label>Vitrinde Göster</label>

							<select name="urun_vitrin" class="form-control m-b">

								<option value="1">Göster</option>

								<option value="0">Gizle</option>

							</select>

							<small class="text-muted">Ürünler ana sayfada gösterilecektir</small>

						</div>

						<div class="form-group">

							<label>Alan Adı</label>

							<select name="alanadi" class="form-control m-b">

								<option value="1">Göster</option>

								<option value="0">Gizle</option>

							</select>

						</div>

						<div class="form-group">

							<label>Hosting Paket</label>

							<select name="hosting" class="form-control m-b">

								<option value="1">Göster</option>

								<option value="0">Gizle</option>

							</select>

						</div>

						<div class="form-group">

							<label>Eklenti</label>

							<select name="eklenti" class="form-control m-b">

								<option value="1">Göster</option>

								<option value="0">Gizle</option>

							</select>

						</div>

						<hr>

						<div class="">

							<b style="color: red;">*SEO Meta Ayarları</b>

							<p class="text-muted">Google başta olmak üzere tüm arama motorları sizi buraya girdiğiniz bilgiler doğrultusunda üst sıralara taşıyacaktır.</p>

						</div>

						<div class="form-group">

							<label>Title</label>

							<input type="text" name="urun_title" placeholder="Title giriniz." class="form-control form-control-rounded">

						</div>



						<div class="form-group">

							<label>Description</label>

							<input name="urun_descr" type="text" placeholder="Description giriniz." class="form-control form-control-rounded">

						</div>



						<div class="form-group">

							<label>Keywords</label>

							<input type="text" name="urun_keyword" placeholder="Keywords giriniz." class="form-control form-control-rounded">

							<small class="text-muted">Örnek : <code>elma, armut, muz, karpuz</code></small>

						</div>

						<button style="cursor: pointer;" type="submit" name="urunekle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Kaydet</button>

					</form>

				</div>

			</div>

		</div>

	</div>



	<?php include 'footer.php'; ?>

