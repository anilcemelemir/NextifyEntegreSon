<?php
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
$havaleedit=$db->prepare("SELECT * from odeme where odeme_id=1");
$havaleedit->execute(array());
$havalewrite=$havaleedit->fetch(PDO::FETCH_ASSOC);

$kapiedit=$db->prepare("SELECT * from odeme where odeme_id=2");
$kapiedit->execute(array());
$kapiwrite=$kapiedit->fetch(PDO::FETCH_ASSOC);

$krediedit=$db->prepare("SELECT * from odeme where odeme_id=3");
$krediedit->execute(array());
$krediwrite=$krediedit->fetch(PDO::FETCH_ASSOC);

if ( isset( $_POST[ 'paytrduzenle' ] ) ) {
	$ayarkaydet = $db->prepare(
		"UPDATE paytr SET
		paytr_magaza=:magaza,
		paytr_key=:key,
		paytr_salt=:salt
		WHERE paytr_id={$_POST['paytr_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'magaza'     => $_POST[ 'paytr_magaza' ],
			'key'     => $_POST[ 'paytr_key' ],
			'salt'     => $_POST[ 'paytr_salt' ]
		)
	);

	if ( $update )
	{
		Header( "Location:?status=ok" );
	}
	else
	{
		Header( "Location:?status=no" );
	}

}



if ( isset( $_POST[ 'posduzenle' ] ) ) {
	$ayarkaydet = $db->prepare(
		"UPDATE ayar SET
		ayar_pos=:pos
		WHERE ayar_id={$_POST['ayar_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'pos'     => $_POST[ 'ayar_pos' ]
		)
	);

	if ( $update )
	{
		Header( "Location:?status=ok" );
	}
	else
	{
		Header( "Location:?status=no" );
	}

}

if ( isset( $_POST[ 'shopierduzenle' ] ) ) {

	$ayarkaydet = $db->prepare(
		"UPDATE shopier SET
		shopier_apikey=:key,
		shopier_apisecret=:salt
		WHERE shopier_id={$_POST['shopier_id']}"

	);
	$update     = $ayarkaydet->execute(
		array(
			'key'     => $_POST[ 'shopier_apikey' ],
			'salt'     => $_POST[ 'shopier_apisecret' ]
		)
	);

	if ( $update )
	{
		Header( "Location:?status=ok" );
	}
	else
	{
		Header( "Location:?status=no" );
	}
}
?>
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
	<div class="page-header">
		<h2>Ödeme İşlemleri</h2>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-heading card-default">
					Ödeme Düzenle
				</div>
				<div class="card-block">
					<form method="POST" action="controller/function.php" class="form-horizontal">
						<div class="form-group">
							<div class="row">
								<input type="hidden" name="odeme_id" value="<?php echo $havalewrite['odeme_id']; ?>"  class="form-control">
								<div class="col-md-3">
									<label>Ödeme Adı</label>
									<input type="text" name="odeme_adi" value="<?php echo $havalewrite['odeme_adi']; ?>" readonly class="form-control">
								</div>
								<div class="col-md-5">
									<label>Ödeme Notu</label>
									<input type="text" name="odeme_not" value="<?php echo $havalewrite['odeme_not']; ?>" class="form-control">
								</div>
								<div class="col-md-2">
									<label>Ödeme Durum</label>
									<select name="odeme_durum" class="form-control m-b">
										<?php if ($havalewrite['odeme_durum']==1) { ?>
											<option value="1">Aktif</option>
											<option value="0">Pasif</option>
											<?php
										} else {?>
											<option value="0">Pasif</option>
											<option value="1">Aktif</option>
										<?php }?>
									</select>
								</div>
								<div class="col-md-2">
									<label>*Kaydet</label><div>
										<button style="cursor: pointer;" type="submit" name="odemeduzenle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Kaydet</button></div>
									</div>
								</div>
							</div>
						</form>
						<form method="POST" action="controller/function.php" class="form-horizontal">
							<div class="form-group">
								<div class="row">
									<input type="hidden" name="odeme_id" value="<?php echo $kapiwrite['odeme_id']; ?>"  class="form-control">
									<div class="col-md-3">
										<input type="text" name="odeme_adi" value="<?php echo $kapiwrite['odeme_adi']; ?>" readonly class="form-control">
									</div>
									<div class="col-md-5">
										<input type="text" name="odeme_not" value="<?php echo $kapiwrite['odeme_not']; ?>" class="form-control">
									</div>
									<div class="col-md-2">
										<select name="odeme_durum" class="form-control m-b">
											<?php if ($kapiwrite['odeme_durum']==1) { ?>
												<option value="1">Aktif</option>
												<option value="0">Pasif</option>
												<?php
											} else {?>
												<option value="0">Pasif</option>
												<option value="1">Aktif</option>
											<?php }?>
										</select>
									</div>
									<div class="col-md-2">
										<button style="cursor: pointer;" type="submit" name="odemeduzenle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Kaydet</button>
									</div>
								</div>
							</div>
						</form>
						<form method="POST" action="controller/function.php" class="form-horizontal">
							<div class="form-group">
								<div class="row">
									<input type="hidden" name="odeme_id" value="<?php echo $krediwrite['odeme_id']; ?>"  class="form-control">
									<div class="col-md-3">
										<input type="text" name="odeme_adi" value="<?php echo $krediwrite['odeme_adi']; ?>" readonly class="form-control">
									</div>
									<div class="col-md-5">
										<input type="text" name="odeme_not" value="<?php echo $krediwrite['odeme_not']; ?>" class="form-control">
									</div>
									<div class="col-md-2">
										<select name="odeme_durum" class="form-control m-b">
											<?php if ($krediwrite['odeme_durum']==1) { ?>
												<option value="1">Aktif</option>
												<option value="0">Pasif</option>
												<?php
											} else {?>
												<option value="0">Pasif</option>
												<option value="1">Aktif</option>
											<?php }?>
										</select>
									</div>
									<div class="col-md-2">
										<button style="cursor: pointer;" type="submit" name="odemeduzenle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Kaydet</button>
									</div>
								</div>
							</div>
						</form>
						<form method="POST" action="" class="form-horizontal">
							<div class="form-group">
								<div class="row">
									<input type="hidden" name="ayar_id" value="<?php echo $settingsprint['ayar_id']; ?>"  class="form-control">
									<div class="col-md-5">
										<input type="text" placeholder="Sanal Pos Seçimi" readonly class="form-control">
									</div>
									<div class="col-md-5">
										<select name="ayar_pos" class="form-control m-b">
											<?php if ($settingsprint['ayar_pos']==1) { ?>
												<option value="1">PayTR</option>
												<option value="0">Shopier</option>
												<?php
											} else {?>
												<option value="0">Shopier</option>
												<option value="1">PayTR</option>
											<?php }?>
										</select>
									</div>
									<div class="col-md-2"><div>
										<button style="cursor: pointer;" type="submit" name="posduzenle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Kaydet</button></div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<?php if ($settingsprint['ayar_pos']!=1) { ?>
					<div class="card">
						<div class="card-heading card-default">
							SHOPİER AYARLARI <small>(Aşağıda bulunan bilgileri SHOPİER hesabım sayfasından bulabilirsiniz.)</small>
						</div>
						<div role="tabpanel" class="tab-pane" id="paytr">
							<div class="widget white-bg">
								<?php 
								$shopier=$db->prepare("SELECT * from shopier where shopier_id=?");
								$shopier->execute(array(1));
								$shopierprint=$shopier->fetch(PDO::FETCH_ASSOC);
								?>
								<div class="card-block">
									<form id="signupForm" method="post" class="form-horizontal" action="">
										<input type="hidden" name="shopier_id" value="<?php echo $shopierprint['shopier_id']; ?>" class="form-control form-control-rounded">
										<div class="form-group">
											<label>Geri Dönüş URL <small>SHOPİER PANELİNİZDE GERİ DÖNÜŞ URL OLARAK BELİRTİN!</small></label>
											<input type="text" name="paytr_magaza" readonly="" value="<?php echo $settingsprint['ayar_siteurl']."response.php"; ?>" class="form-control form-control-rounded">
										</div>

										<div class="form-group">
											<label>Mağaza Kodu</label>
											<input type="text" name="shopier_apikey" value="<?php echo $shopierprint['shopier_apikey']; ?>" class="form-control form-control-rounded">
										</div>

										<div class="form-group">
											<label>Mağaza Parola </label>
											<input name="shopier_apisecret" type="text" value="<?php echo $shopierprint['shopier_apisecret']; ?>" class="form-control form-control-rounded">
										</div>
										<div class="form-group">
											<button type="submit" class="btn btn-primary" name="shopierduzenle" >Güncelle</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				<?php } else { ?>
					<div class="card">
						<div class="card-heading card-default">
							PayTR <small>(Aşağıda bulunan bilgileri PAYTR hesabım sayfasından bulabilirsiniz.)</small>
						</div>
						<div role="tabpanel" class="tab-pane" id="paytr">
							<div class="widget white-bg">
								<?php 
								$paytr=$db->prepare("SELECT * from paytr where paytr_id=?");
								$paytr->execute(array(1));
								$paytrprint=$paytr->fetch(PDO::FETCH_ASSOC);
								?>
								<div class="card-block">
									<form id="signupForm" method="post" class="form-horizontal" action="">
										<input type="hidden" name="paytr_id" value="<?php echo $paytrprint['paytr_id']; ?>" class="form-control form-control-rounded">
										<div class="form-group">
											<label>Geri Dönüş URL <small>PAYTR PANELİNİZDE GERİ DÖNÜŞ URL OLARAK BELİRTİN!</small></label>
											<input type="text" readonly="" value="<?php echo $settingsprint['ayar_siteurl']."pay_int.php"; ?>" class="form-control form-control-rounded">
										</div>

										<div class="form-group">
											<label>Mağaza Kodu</label>
											<input type="text" name="paytr_magaza" value="<?php echo $paytrprint['paytr_magaza']; ?>" class="form-control form-control-rounded">
										</div>

										<div class="form-group">
											<label>Mağaza Parola </label>
											<input name="paytr_key" type="text" value="<?php echo $paytrprint['paytr_key']; ?>" class="form-control form-control-rounded">
										</div>

										<div class="form-group">
											<label>Mağaza Gizli Anahtar </label>
											<input type="text" name="paytr_salt" value="<?php echo $paytrprint['paytr_salt']; ?>" class="form-control form-control-rounded">
										</div>
										<div class="form-group">
											<button type="submit" class="btn btn-primary" name="paytrduzenle" >Güncelle</button>
										</div>
									</form>
								</div>
								<!-- FORM SON -->
							</div>
						</div>
					</div>
				<?php } ?>
			</div>
		</div>
		<?php include 'footer.php'; ?>
