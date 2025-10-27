<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';

$ip_adresi = GetIP();
$destsor=$db->prepare("SELECT * from destek where destek_id=:destek_id");
$destsor->execute(array(
	'destek_id' => $_GET['destek_id']
));
$hesapcek=$destsor->fetch(PDO::FETCH_ASSOC);



$ayarkaydet = $db->prepare(
	"UPDATE destek SET
	destek_uyeoku=:uyeoku
	WHERE destek_id={$_GET['destek_id']}"
);
$update     = $ayarkaydet->execute(
	array(
		'uyeoku'     => '1'
	)
);

$adminsor=$db->prepare("SELECT * from kullanici where kullanici_id=?");
$adminsor->execute(array(0));
$admincek=$adminsor->fetch(PDO::FETCH_ASSOC);



$mesajsor=$db->prepare("SELECT * from destekmesaj where destekmesaj_destek=:destek_id order by destekmesaj_tarih DESC");
$mesajsor->execute(array(
	'destek_id' => $_GET['destek_id']
));

$sonmesaj=$db->prepare("SELECT * from destekmesaj where destekmesaj_destek=:destekm_id order by destekmesaj_tarih DESC Limit 1");
$sonmesaj->execute(array(
	'destekm_id' => $_GET['destek_id']
));
$sonmesajcek=$sonmesaj->fetch(PDO::FETCH_ASSOC);

?>		
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
	<div class="page-header">
		<h2>Destek İşlemleri</h2>  
		
	</div>
	<div class="row">
		<div class="col">
			<div style="border: 1px solid #6b6b6b;" class="widget bg-default padding-15">
				<div class="row row-table">
					<div class="col-xs-8 padding-15 text-center">
						<h4 class="mv-0"><?php echo $hesapcek['destek_tarih']; ?></h4>
						<div class="margin-b-0 ">Destek Tarihi</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col">
			<div style="border: 1px solid #6b6b6b;" class="widget bg-default padding-15">
				<div class="row row-table">
					<div class="col-xs-8 padding-15 text-center">
						<h4 class="mv-0"><?php echo $hesapcek['destek_departman']; ?></h4>
						<div class="margin-b-0">Destek Departmanı</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col">
			<div style="border: 1px solid #6b6b6b;" class="widget bg-default padding-15">
				<div class="row row-table">
					<div class="col-xs-8 padding-15 text-center">
						<h4 class="mv-0"><?php echo $sonmesajcek['destekmesaj_tarih'] ?></h4>
						<div class="margin-b-0">Son Mesaj</div>
					</div>
				</div>
			</div>
		</div>
		<?php
		if ($hesapcek['destek_onem']=='1') { ?> 
			<div class="col">
				<div style="border: 1px solid #6b6b6b;" class="widget bg-info padding-15">
					<div class="row row-table">
						<div class="col-xs-8 padding-15 text-center">
							<h4 class="mv-0">

								<span style="font-size: 22px;" class="label label-info">Düşük</span>
							</h4>
							<div class="margin-b-0">Destek Önceliği</div>
						</div>
					</div>
				</div>
			</div>
		<?php } elseif ($hesapcek['destek_onem']=='2') { ?>
			<div class="col">
				<div style="border: 1px solid #6b6b6b;" class="widget bg-warning padding-15">
					<div class="row row-table">
						<div class="col-xs-8 padding-15 text-center">
							<h4 class="mv-0">
								<span style="font-size: 24px;" class="label label-warning">Orta</span>
							</h4>
							<div class="margin-b-0">Destek Önceliği</div>
						</div>
					</div>
				</div>
			</div>
		<?php } elseif ($hesapcek['destek_onem']=='3') { ?>
			<div class="col">
				<div style="border: 1px solid #6b6b6b;" class="widget bg-danger padding-15">
					<div class="row row-table">
						<div class="col-xs-8 padding-15 text-center">
							<h4 class="mv-0">
								<span style="font-size: 24px;" class="label label-danger">Yüksek</span>
							</h4>
							<div class="margin-b-0">Destek Önceliği</div>
						</div>
					</div>
				</div>
			</div>
		<?php } ?> 

	</div>
	<?php

	?>
	<div class="row">
		<!-- İLETİŞİM MESAJLARI -->
		<div class="col-md-12">
			<div class="card">
				<div class="card-heading card-default">
					<div class="pull-right mt-10">

						<?php
						if ($hesapcek['destek_durum']=='1') { ?>
							<form method="POST" action="../admin/controller/function.php">
								<a href="destekler" style="cursor: pointer; align-items: right" class="btn btn-warning btn-rounded btn-icon"><i class="icon-action-undo"></i>Geri Dön</a>
								<a style="cursor: pointer; align-items: right" class="btn btn-success btn-rounded btn-icon" data-toggle="modal" data-target="#loginModal"><i class="icon-note"></i>Destek Talebini Cevapla</a>
								<input type="hidden" name="id" value="<?php echo $hesapcek['destek_id']; ?>">
								<button style="cursor: pointer; align-items: right" type="submit" name="destekkapat" class="btn btn-danger btn-rounded btn-icon"><i class="icon-close"></i> Talebi Kapat</button>
							</form>
						<?php } else {
							?>
							<a href="destekler" style="cursor: pointer; align-items: right" class="btn btn-warning btn-rounded btn-icon"><i class="icon-action-undo"></i>Geri Dön</a>
							<a style="cursor: pointer; align-items: right" class="btn btn-success btn-rounded btn-icon" data-toggle="modal" data-target="#loginModal"><i class="icon-note"></i>Destek Talebini Cevapla</a>
							<?php
						} ?>
					</div>
					<b>KONU: </b><?php echo $hesapcek['destek_baslik']; ?>
				</div>

				<div class="row">
					<div class="col-md-12">


						<div class="card-block no-padding">

							<div class="row">
								<div class="col-md-12">

									<div class="chat-room padding-20">
										<ul style="padding-left: 40px; padding-right: 40px; max-height: 3750px;overflow: auto;"  class="chat-list list-unstyled">
											<?php while ($mesajcek=$mesajsor->fetch(PDO::FETCH_ASSOC)) {
												if ($mesajcek['destekmesaj_kim']==1) {
													?>
													<li class="clearfix chat-element media">
														<img style="border: 1px solid #f1f1f1; width: 100px;" src="../admin/<?php echo $admincek['kullanici_resim']; ?>" alt="" class="rounded-circle">

														<div class="media-body">
															<div class="speech-box">
																<strong><?php echo $admincek['kullanici_adsoyad']; ?> <span class="label label-danger">Yetkili</span></strong>
																<p class="margin-b-0">
																	<?php echo $mesajcek['destekmesaj_aciklama']; ?>
																</p>
																<br>
																<?php if ($mesajcek['destekmesaj_resim']!='0') {
																	?>
																	<a style="margin-top: 10px;" href="../admin/<?php echo $mesajcek['destekmesaj_resim']; ?>" class="btn btn-primary btn-warning btn-icon" download><i class="fa fa-cloud-download"></i> Görseli indir</a>
																	<?php
																} ?>
																<br>
																<br>
																<?php echo $settingsprint['ayar_imza']; ?>
																<hr>
																<small><?php echo $mesajcek['destekmesaj_tarih']; ?></small>
															</div>
														</div>
													</li>
												<?php } elseif ($mesajcek['destekmesaj_kim']==2) { ?>

													<li class="clearfix chat-element right media">
														<div class="media-body">
															<div class="speech-box">
																<strong><?php echo $userprint['uye_ad']." ".$userprint['uye_soyad'] ?> <span class="label label-success">Müşteri</span></strong>
																<p class="margin-b-0">
																	<?php echo $mesajcek['destekmesaj_aciklama']; ?>
																</p>
																<?php if ($mesajcek['destekmesaj_resim']!='0') {
																	?>
																	<a style="margin-top: 10px;" href="../admin/<?php echo $mesajcek['destekmesaj_resim']; ?>" class="btn btn-primary btn-warning btn-icon" download><i class="fa fa-cloud-download"></i> Görseli indir</a>
																	<?php
																} ?>
																<hr>
																<small><?php echo $mesajcek['destekmesaj_tarih']; ?> <br>
																	<b>IP ADRESS:</b><?php echo $ip_adresi; ?></small>
																</div>
															</div>
															<?php if ($userprint['uye_resim']=='0') {
																?> 
																<img style="border: 1px solid #f1f1f1; width: 100px;" src="../admin/assets/img/genel/user.png" alt="" class="rounded-circle">
															<?php } else { ?>
																<img style="border: 1px solid #f1f1f1; width: 100px;" src="../<?php echo $userprint['uye_resim']; ?>" alt="" class="rounded-circle">
															<?php } ?>
														</li>
													<?php } ?>




												<?php }  ?>


											</ul>
										</div>
									</div>
								</div>
							</div>


						</div>
					</div>
				</div>
			</div>
			<!-- İLETİŞİM MESAJLARI -->
		</div>


		<!-- Modal -->
		<div class="modal fade bs-example-modal-lg" id="loginModal">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Destek Bileti Cevaplama</h5>
					</div>
					<div class="modal-body">
						<form role="form" enctype="multipart/form-data" action="../admin/controller/function.php" method="POST">
							<input type="hidden" name="destekmesaj_kim" value="2">
							<input type="hidden" name="destekmesaj_destek" value="<?php echo $hesapcek['destek_id']; ?>">
							<div class="form-group">
								<label>Ad Soyad</label>
								<input type="text" readonly value="<?php echo $userprint['uye_ad']." ".$userprint['uye_soyad']; ?>" class="form-control">
							</div>
							<div class="form-group">
								<label>Destek</label>
								<textarea type="text" required="" name="destekmesaj_aciklama" class="form-control" style="height: 150px;" placeholder="Destek açıklaması yazınız"></textarea>
							</div>
							<div class="form-group">
								<label>Görsel Ekle (Lütfen jpg ve png dışında bir dosya yüklemeyiniz.)</label>
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
								<button style="margin-right: 5px; cursor: pointer;" type="submit" name="destekat" class="btn  btn-primary pull-right">Gönder</button>
								<button style="margin-right: 5px; cursor: pointer;" type="button" class="btn  btn-warning pull-right" data-dismiss="modal" aria-label="Close">Kapat</button>
							</div>
						</form>
						<hr>
						<div class="">
							<p><small><b>UYARI:</b> Gönderdiğiniz destek talepleri yoğunluğa bağlı olarak 2-12 saat arasında değişmektedir. Bir önceki destek talebine cevap verilmeden yeni destek talebi atmanız destek cevaplarının gecikmesine sebep olacaktır. Anlayışınız için teşekkür ederiz.</small></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<?php include 'footer.php'; ?>
