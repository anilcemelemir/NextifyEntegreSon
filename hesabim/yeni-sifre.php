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
		<h2>Şifre İşlemleri</h2>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-heading card-default">
					Şifre Düzenle 
				</div>
				<div class="card-block">
					<!-- AYAR  -->
					<form method="POST" action="../admin/controller/function.php" class="form-horizontal">
						<div class="form-group">
							<div class="row">
								
								<div style="margin-top: 10px;" class="col-md-12">
									<label>Eski Şifre</label>
									<input type="password" name="uye_esifre" placeholder="Eski şifrenizi giriniz" class="form-control">
								</div>

								<div style="margin-top: 10px;" class="col-md-6">
									<label>Yeni Şifre</label>
									<input type="password" name="uye_sifre" placeholder="Yeni şifrenizi giriniz" class="form-control">
								</div>

								<div style="margin-top: 10px;" class="col-md-6">
									<label>Yeni Şifre Tekrar</label>
									<input type="password" name="uye_sifre_onay" placeholder="Yeni şifre tekrar giriniz" class="form-control">
								</div>
								<div style="margin-top: 10px;" class="col-md-6">
									<div class="g-recaptcha text-center" data-sitekey="<?=$linkApi['ranahtar']?>"></div>
								</div>
								<div style="margin-top: 10px;" class="col-md-8">
									<button style="cursor: pointer;" type="submit" name="uyesifre" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Güncelle</button>
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
