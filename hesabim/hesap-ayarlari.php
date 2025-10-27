<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
$uye=$userprint['uye_id'];

$uyebilgi=$db->prepare("SELECT * from uye where uye_id=$uye");
$uyebilgi->execute(array(0));
$uyeprint=$uyebilgi->fetch(PDO::FETCH_ASSOC);


?>		
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->

<section class="main-content container">
	<div class="page-header">
		<h2>Hesap İşlemleri</h2>
	</div>
	<div class="row">
		<div class="col-sm-4">
			<div class="card">
				
				<div class="card-block">
					<form method="post" class="form-horizontal" enctype="multipart/form-data" action="../admin/controller/function.php">
						<input type="hidden" name="uye_id" value="<?php echo $uye ?>">
						<div class="form-group">
							<label>Resim Seç</label>
							<div class="fileinput-new" data-provides="fileinput">
								<?php if ($userprint['uye_resim']=='0') {
									?> 
									<div class="fileinput-preview" data-trigger="fileinput" style="width: 163px; height:163px;">
										<img style="width: 150px; height:150px;" src="../admin/assets/img/genel/user.png">
									</div>
									<?php } else { ?> <div class="fileinput-preview" data-trigger="fileinput" style="width: 163px; height:163px;">
										<img style="width: 150px; height:150px;" src="../<?php echo $uyeprint['uye_resim']; ?>">
										</div> <?php } ?>

										<span class="btn btn-primary  btn-file">
											<span class="fileinput-new">Yeni Seç</span>
											<span class="fileinput-exists">Değiştir</span>
											<input type="file" id="image" name="uye_resim">
										</span>
										<a href="#" class="btn btn-danger fileinput-exists" data-dismiss="fileinput">Sil</a>
									</div>
								</div>

								<div class="form-group text-center">
									<div class="g-recaptcha text-center" data-sitekey="<?=$linkApi['ranahtar']?>"></div>
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-primary" name="uyeresimduzenle" >Güncelle</button>
									
								</div>
							</form>
						</div>
						<!-- FORM SON -->
					</div>
				</div>
				<div class="col-sm-8">
					<div class="card">
						<div class="card-heading card-default">
							Üye Bilgi Düzenle 
						</div>
						<div class="card-block">
							<!-- AYAR  -->
							<form method="POST" action="../admin/controller/function.php" class="form-horizontal">
								<input type="hidden" name="uye_id" value="<?php echo $uye ?>">
								<div class="form-group">
									<div class="row">
										<input type="hidden" name="counter_id" value="<?php echo $counterprint['counter_id']; ?>"  class="form-control">
										<div style="margin-top: 10px;" class="col-md-6">
											<label>Ad</label>
											<input type="text" name="uye_ad" value="<?php echo $uyeprint['uye_ad']; ?>" class="form-control">
										</div>

										<div style="margin-top: 10px;" class="col-md-6">
											<label>Soyad</label>
											<input type="text" name="uye_soyad" value="<?php echo $uyeprint['uye_soyad']; ?>" class="form-control">
										</div>

										<div style="margin-top: 10px;" class="col-md-6">
											<label>Tel</label>
											<input type="text" name="uye_tel" value="<?php echo $uyeprint['uye_tel']; ?>" class="form-control">
										</div>
										<div style="margin-top: 10px;" class="col-md-6">
											<label>Mail</label>
											<input type="text" name="uye_mail" value="<?php echo $uyeprint['uye_mail']; ?>" class="form-control">
										</div>
										<div style="margin-top: 10px;" class="col-md-12">
											<label>TC No</label>
											<input type="text" name="uye_tc" value="<?php echo $uyeprint['uye_tc']; ?>" class="form-control">
										</div>

										<div style="margin-top: 10px;" class="col-md-12">
											<label>Adres</label>
											<textarea type="text" name="uye_adres" style="height: 100px;" class="form-control"><?php echo $uyeprint['uye_adres']; ?></textarea>
										</div>
										<div style="margin-top: 10px;" class="col-md-12">
											<div class="g-recaptcha text-center" data-sitekey="<?=$linkApi['ranahtar']?>"></div>
										</div>
										<div style="margin-top: 10px;" class="col-md-8">
											<button style="cursor: pointer;" type="submit" name="uyeduzenle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Güncelle</button>
										</div>				
									</div>
								</div>
							</form>
							<!--#AYAR  -->
						</div>
					</div>
				</div>
			</div>
			<?php include 'footer.php'; ?>
