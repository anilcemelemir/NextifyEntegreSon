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
		<h2>Destek İşlemleri</h2> 
	</div>
	<div class="row">
		<!-- İLETİŞİM MESAJLARI -->
		<div class="col-md-12">
			<div class="card">
				<div class="card-block">
					<form role="form" action="../admin/controller/function.php" enctype="multipart/form-data" method="POST">
						<input type="hidden" name="destek_uye" value="<?php echo $userprint['uye_id']; ?>">
						<input type="hidden" name="destek_durum" value="1">
						<div class="form-group">
							<label>Departman</label>
							<select name="destek_departman" class="form-control m-b">
								<option value="Teknik Destek">Teknik Destek</option>
								<option value="Muhasebe">Muhasebe</option>
								<option value="Satış">Satış</option>
							</select>
						</div>
						<div class="form-group">
							<label>Öncelik</label>
							<select name="destek_onem" class="form-control m-b">
								<option value="1">Düşük</option>
								<option value="2">Orta</option>
								<option value="3">Yüksek</option>
							</select>
						</div>

						<?php if (isset($_POST['siparisdestek'])) { ?>

							<div class="form-group">
								<label>Destek Başlık</label>
								<input type="text" name="destek_baslik" value="<?php echo $_POST['siparisdestek']; ?>" class="form-control">
							</div>
						<?php } else { ?>
							<div class="form-group">
								<label>Destek Başlık</label>
								<input type="text" required="" name="destek_baslik" placeholder="Destek konusunu giriniz." class="form-control">
							</div>
						<?php } ?>

						



						<div class="form-group">
							<label>Destek</label>
							<textarea required="" type="text" name="destekmesaj_aciklama" class="form-control" style="height: 150px;" placeholder="Destek açıklaması yazınız"></textarea>
						</div>
						<div class="form-group">
							<label>Görsel Ekle</label>
							<div class="fileinput fileinput-new input-group col-md-12" data-provides="fileinput">
								<div class="form-control" data-trigger="fileinput"><span class="fileinput-filename"></span></div>
								<span class="input-group-addon btn btn-primary btn-file ">
									<span class="fileinput-new">Yükle</span>
									<span class="fileinput-exists">Değiştir</span>
									<input type="file" name="destekmesaj_resim">
								</span>
								<a href="#" class="input-group-addon btn btn-danger  hover fileinput-exists" data-dismiss="fileinput">Sil</a>
							</div>
						</div>
						<div class="clearfix text-center">
							<div class="g-recaptcha text-center" data-sitekey="<?=$linkApi['ranahtar']?>"></div>
						</div>
						<div class="clearfix">
							<button style="margin-right: 5px; cursor: pointer;" type="submit" name="destekac" class="btn  btn-primary pull-right">Desteği Gönder</button>
						</div>
					</form>
					<hr>
					<div class="">
						<p><small><b>UYARI:</b> Gönderdiğiniz destek taleplerine cevap vermemiz yoğunluğa bağlı olarak 2-12 saat arasında değişmektedir. Bir önceki destek talebine cevap verilmeden aynı konuda yeni destek talebi atmanız cevaplarımızın gecikmesine sebep olacaktır. Anlayışınız için teşekkür ederiz.</small></p>
					</div>
				</div>
			</div>
		</div>


	</div>


	<?php include 'footer.php'; ?>
