<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';


if ( isset( $_POST[ 'paytrduzenle' ] ) )

{



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
?>		
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
	<div class="page-header">
		<h2>Shopier İşlemleri</h2>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-heading card-default">
					SANAL POS
				</div>
					<div role="tabpanel" class="tab-pane" id="paytr">
						<div class="widget white-bg">
							<!-- FORM BAŞLA -->
							<div class="card-heading card-default">
								PAYTR AYARLARI <small>(Aşağıda bulunan bilgileri PAYTR hesabım sayfasından bulabilirsiniz.)</small>
							</div>
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
		</div>
	</div>
	<?php include 'footer.php'; ?>
