<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
$widget=$db->prepare("SELECT * from widget");
$widget->execute(array(0));
$widgetprint=$widget->fetch(PDO::FETCH_ASSOC);

if ( isset( $_POST[ 'uyelikduzenle' ] ) )
{

	$ayarkaydet = $db->prepare(
		"UPDATE widget SET
		widget_onaymail=:onaymail,
		widget_onaytel=:onaytel
		WHERE widget_id='1'"
	);
	$update     = $ayarkaydet->execute(
		array(
			'onaymail'     => $_POST[ 'widget_onaymail' ],
			'onaytel'     => $_POST[ 'widget_onaytel' ]
		)
	);

	if ( $update )
	{

		Header( "Location:uye-ayarlari.php?status=ok" );
	}
	else
	{

		Header( "Location:uye-ayarlari.php?status=no" );
	}
}
?>		
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
	<div class="page-header">
		<h2>Sistem Üyelik İşlemleri</h2>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-heading card-default">
					Sistem Üyeliği Düzenle
				</div>

				<div class="card-block">
					<!-- AYAR  -->
					<form method="POST" action="" class="form-horizontal">
						
						<div class="form-group">
							<div class="row">

								<input type="hidden" name="widget_id" value="1"  class="form-control">
								<input type="hidden" name="widget_onaytel" value="1"  class="form-control">

								<div class="col-md-6">
									<label>Modül Adı</label>
									<input type="text" readonly="" value="Üyelik Mail Onayı" class="form-control">
								</div>
								<div class="col-md-6">
									<label>Modül Durum</label>
									<select name="widget_onaymail" class="form-control m-b">
										<?php if ($widgetprint['widget_onaymail']==1) { ?>
											<option value="1">Aktif</option>
											<option value="0">Pasif</option>
											<?php
										} else {?>
											<option value="0">Pasif</option>
											<option value="1">Aktif</option>
										<?php }?>
									</select>
								</div>							
							</div>
						</div>
						<button style="cursor: pointer;" type="submit" name="uyelikduzenle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Güncelle</button>
					</form>
					<!--#AYAR  -->
				</div>
			</div>
		</div>
	</div>
	<?php include 'footer.php'; ?>
