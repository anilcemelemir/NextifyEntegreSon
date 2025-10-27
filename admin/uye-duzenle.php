<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
include 'controller/seo.php';
$uyeedit=$db->prepare("SELECT * from uye where uye_id=:uye_id");
$uyeedit->execute(array(
	'uye_id' => $_GET['uye_id']
));
$uyewrite=$uyeedit->fetch(PDO::FETCH_ASSOC);

?>		
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
	<div class="page-header">
		<h2>Üye İşlemleri</h2>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-heading card-default">
					<div class="pull-right mt-10">
						<a href="uyeler.php" class="btn btn-warning btn-icon"><i class="fa fa-reply"></i>Geri Dön</a>
					</div>
					Üye Düzenle
				</div>
				<div class="card-block">
					<form method="POST" action="controller/function.php" enctype="multipart/form-data" class="form-horizontal">
						<div class="form-group">
							<label>Üye Resim</label>
							<p><img style="max-height: 100px;max-width: 100px;" src="<?php
							if ($uyewrite['uye_resim']=='0') {

								?> ../admin/assets/img/genel/user.png <?php
								} else {
									?>../<?php echo $uyewrite['uye_resim']; 
								}
								?>"></p>

							</div>
							<div class="form-group">
								<label>Üye Adı</label>
								<input type="text" name="uye_ad" value="<?php echo $uyewrite['uye_ad']; ?>" class="form-control">
							</div>

							<div class="form-group">
								<label>Üye Soyadı</label>
								<input type="text" name="uye_soyad" value="<?php echo $uyewrite['uye_soyad']; ?>" class="form-control">
							</div>

							<div class="form-group">
								<label>Üye Tel</label>
								<input type="text" name="uye_tel" value="<?php echo $uyewrite['uye_tel']; ?>" class="form-control">
							</div>

							<div class="form-group">
								<label>Üye Mail</label>
								<input type="text" name="uye_mail" value="<?php echo $uyewrite['uye_mail']; ?>" class="form-control">
							</div>

							<div class="form-group">
								<label>Üye Adres</label>
								<input type="text" name="uye_adres" value="<?php echo $uyewrite['uye_adres']; ?>" class="form-control">
							</div>


							<div class="form-group">
								<label>Üye TC</label>
								<input type="text" name="uye_tc" value="<?php echo $uyewrite['uye_tc']; ?>" class="form-control">
							</div>

							<input type="text" name="uye_onaytel" value="1" class="form-control">

							<div class="form-group">
								<label>Mail Onayı</label>
								<select name="uye_onaymail" class="form-control m-b">
									<?php if ($uyewrite['uye_onaymail']==1) { ?>
										<option value="1">Onaylı</option>
										<option value="0">Onay bekliyor</option>
										<?php
									} else {?>
										<option value="0">Onay bekliyor</option>
										<option value="1">Onaylı</option>
									<?php }?>
								</select>
							</div>
							<input type="hidden" name="uye_id" value="<?php echo $uyewrite['uye_id']; ?>">
							<button style="cursor: pointer;" type="submit" name="uyepanelduzenle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Güncelle</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<?php include 'footer.php'; ?>
