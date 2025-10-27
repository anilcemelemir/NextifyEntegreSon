<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';

$onaylidesteksay=$db->prepare("SELECT * from destek where destek_uye=:destek_uye and destek_durum='1'");
$onaylidesteksay->execute(array(
	'destek_uye' => $userprint['uye_id']
));
$onaylidestek=$onaylidesteksay->rowCount(); 

$bekleyendesteksay=$db->prepare("SELECT * from destek where destek_uye=:destek_uye and destek_durum='1'");
$bekleyendesteksay->execute(array(
	'destek_uye' => $userprint['uye_id']
));
$bekleyendestek=$bekleyendesteksay->rowCount(); 
//Saydırma
$siparissay=$db->prepare("SELECT * from siparis where siparis_ad=:siparis_ad and siparis_durum='1'");
$siparissay->execute(array(
	'siparis_ad' => $userprint['uye_id']
));
$yenisiparis=$siparissay->rowCount(); 

$onaylisiparissay=$db->prepare("SELECT * from siparis where siparis_ad=:siparis_ad and siparis_durum='0'");
$onaylisiparissay->execute(array(
	'siparis_ad' => $userprint['uye_id']
));
$onaylisiparis=$onaylisiparissay->rowCount(); 
//
//Saydırma
$onaylidesteksay=$db->prepare("SELECT * from destek where destek_uye=:destek_uye and destek_durum='1'");
$onaylidesteksay->execute(array(
	'destek_uye' => $userprint['uye_id']
));
$onaylidestek=$onaylidesteksay->rowCount(); 
//say
$topsor=$db->prepare("SELECT * from destek where destek_uye=:destek_uye ");
$topsor->execute(array(
	'destek_uye' => $userprint['uye_id']
));
$toplam=$topsor->RowCount();
?>		
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->

<section class="main-content container">
	<div class="row">
		<div class="col">
			<div class="widget bg-light padding-0">
				<div class="row row-table">
					<div class="col-xs-4 text-center padding-15 bg-primary">
						<em class="icon-basket fa-3x"></em>
					</div>
					<div class="col-xs-8 padding-15 text-right">
						<h2 class="mv-0"><?php echo $yenisiparis; ?></h2>
						<div class="margin-b-0 text-muted">Yeni Sipariş</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="widget bg-light padding-0">
				<div class="row row-table">
					<div class="col-xs-4 text-center padding-15 bg-teal">
						<em class="icon-basket fa-3x"></em>
					</div>
					<div class="col-xs-8 padding-15 text-right">
						<h2 class="mv-0"><?php echo $onaylisiparis; ?></h2>
						<div class="margin-b-0 text-muted">Toplam Sipariş</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="widget bg-light padding-0">
				<div class="row row-table">
					<div class="col-xs-4 text-center padding-15 bg-success">
						<em class="icon-support fa-3x"></em>
					</div>
					<div class="col-xs-8 padding-15 text-right">
						<h2 class="mv-0"><?php echo $bekleyendestek; ?></h2>
						<div class="margin-b-0 text-muted">Bekleyen Destek</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="widget bg-light padding-0">
				<div class="row row-table">
					<div class="col-xs-4 text-center padding-15 bg-indigo">
						<em class="icon-support fa-3x"></em>
					</div>
					<div class="col-xs-8 padding-15 text-right">
						<h2 class="mv-0"><?php echo $toplam; ?></h2>
						<div class="margin-b-0 text-muted">Toplam Destek</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<?php if ($userprint['uye_onaymail']=='0') { ?>
		<div class="row">
			<div class="col">
				<div class="card">
					<div class="card-block">
						<div class="alert bg-warning alert-dismissible" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Uyarı !</strong> Hizmetlerimizden yararlanabilmeniz için lütfen mail adresinizi onaylayın! <b> <a href="uye-onay"> >>TIKLA ONAYLA!<< </a></b></div>
					</div>
				</div>
			</div>
		</div>
	<?php } ?>
	<div class="row">
		<!-- İLETİŞİM MESAJLARI -->
		<div class="col-md-12">
			<div class="card">
				<div class="card-heading card-default">
					Duyuru & Kampanyalar
				</div>
				<div class="card-block">
					<table id="datatable1" class="table table-striped dt-responsive nowrap table-hover">
						<thead>
							<tr>
								<th class="text-left">
									<strong>Duyuru Tarihi</strong>
								</th>
								<th class="text-left">
									<strong>Duyuru Başlık</strong>
								</th>
								<th class="text-left">
									<strong>Duyuru İçerik</strong>
								</th>
								<th class="text-center">
									<strong>İşlemler</strong>
								</th>
							</tr>
						</thead>
						<tbody>
							<?php 
							$blogsor=$db->prepare("SELECT * from duyuru where duyuru_durum=1 order by duyuru_tarih DESC");
							$blogsor->execute(array(0));
							while ($blogcek=$blogsor->fetch(PDO::FETCH_ASSOC)) {
								$blogicerik=mb_substr(strip_tags($blogcek['duyuru_detay']), 0, 80, 'UTF-8');
								?>
								<tr>
									<td><?php echo substr($blogcek['duyuru_tarih'], 0, 10); ?></td>
									<td><?php echo $blogcek['duyuru_baslik']; ?></td>
									<td><?php echo $blogicerik; ?></td>
									<td class="text-center">
										<a href="#" title="Göster" class="btn btn-sm btn-default" data-toggle="modal" data-target="#textModal<?php echo $blogcek['duyuru_id']; ?>"><i class="fa fa-eye"></i></a>
									</td>
								</tr>

								<div class="modal fade" id="textModal<?php echo $blogcek['duyuru_id']; ?>" tabindex="-1" role="dialog" aria-labelledby="textModal<?php echo $blogcek['duyuru_id']; ?>">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div style="text-align: left;" class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times"></span></button>
												<h3 class="modal-title" id="myModalLabel"><?php echo $blogcek['duyuru_baslik']; ?></h3>
											</div>
											<div class="modal-body">
												<p>
													<?php echo $blogcek['duyuru_detay']; ?>
												</p><br>
												<div class="text-center">
													<input type="hidden" name="duyuru_id" value="<?php echo $blogcek['duyuru_id']; ?>">
													<button style="cursor: pointer;" data-dismiss="modal" aria-label="Close" type="button" class="btn btn-warning btn-lg">KAPAT</button>
													
												</div>
											</div>
										</div>
									</div>
								</div>
							<?php } ?>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>

	<?php include 'footer.php'; ?>
