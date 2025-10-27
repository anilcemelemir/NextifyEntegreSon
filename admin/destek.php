<?php 
include 'header.php';
include 'topbar.php';
include 'controller/seo.php';
include 'sidebar.php';

$hesapsor=$db->prepare("SELECT * from destek order by destek_tarih DESC");
$hesapsor->execute(array(
));
//say
$bekleyensor=$db->prepare("SELECT * from destek where destek_durum='1'");
$bekleyensor->execute(array(
));
$bekleyen=$bekleyensor->RowCount();
//say
$topsor=$db->prepare("SELECT * from destek ");
$topsor->execute(array(
));
$toplam=$topsor->RowCount();
//say
$okusor=$db->prepare("SELECT * from destek where destek_adminoku='0'");
$okusor->execute(array(
));
$okunmamıs=$okusor->RowCount();
//say
$tamamsor=$db->prepare("SELECT * from destek where destek_durum='0'");
$tamamsor->execute(array(
));
$tamamlanmis=$tamamsor->RowCount();


if ( isset( $_POST[ 'destekoku' ] ) )
{
	$id=$_POST['id'];
	
	$desksor=$db->prepare("SELECT * from destek where destek_id=$id");
	$desksor->execute(array(0));
	$deskcek=$desksor->fetch(PDO::FETCH_ASSOC);
	
	$id=$deskcek["destek_id"];
	

	$ayarkaydet = $db->prepare(
		"UPDATE destek SET
		destek_adminoku=:uyeoku
		WHERE destek_id={$id}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'uyeoku'     => '1'
		)
	);

	if ( $update )
	{

		Header( "Location:destek-oku.php?destek_id=$id" );
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
		<h2>Destek İşlemleri</h2>
	</div>
	<div class="row">
		<!-- İLETİŞİM MESAJLARI -->
		<div class="col-md-12">
			<div class="card">
				<div class="card-heading card-default">
					Destek Talepleri
					<p class="text-muted">Bu listede oluşturduğunuz destek taleplerini listeleyebilir okuyabilir ve yeni destekler oluşturabilirsiniz.</p>

				</div>

				<div class="card-block">
					<div class="row">
						<div class="col">
							<div class="widget bg-primary padding-15">
								<div class="row row-table">
									<div class="col-xs-8 padding-15 text-center">
										<h4 class="mv-0"><?php echo $toplam; ?></h4>
										<div class="margin-b-0 ">Toplam Destek</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="widget bg-warning padding-15">
								<div class="row row-table">
									<div class="col-xs-8 padding-15 text-center">
										<h4 class="mv-0"><?php echo $okunmamıs; ?></h4>
										<div class="margin-b-0">Okunmamış Destek</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="widget bg-success padding-15">
								<div class="row row-table">
									<div class="col-xs-8 padding-15 text-center">
										<h4 class="mv-0"><?php echo $tamamlanmis; ?></h4>
										<div class="margin-b-0">Tamamlanmış Destek</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="widget bg-danger padding-15">
								<div class="row row-table">
									<div class="col-xs-8 padding-15 text-center">
										<h4 class="mv-0"><?php echo $bekleyen; ?></h4>
										<div class="margin-b-0">Bekleyen Destek</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<table id="datatable1" class="table table-striped dt-responsive nowrap table-hover">
						<thead>
							<tr>
								<th class="text-left">
									<strong>Son Yanıt</strong>
								</th>
								<th class="text-left">
									<strong>Tarih</strong>
								</th>
								<th class="text-left">
									<strong>Üye</strong>
								</th>
								<th class="text-left">
									<strong>Departman</strong>
								</th>
								<th class="text-left">
									<strong>Konu</strong>
								</th>
								<th class="text-left">
									<strong>Durum</strong>
								</th>
								<th class="text-left">
									<strong>Önem</strong>
								</th>
								<th class="text-center">
									<strong>İşlemler</strong>
								</th>
							</tr>
						</thead>
						<tbody>
							<?php 
							while ($hesapcek=$hesapsor->fetch(PDO::FETCH_ASSOC)) {
								$uyesor=$db->prepare("SELECT * from uye where uye_id=:uye_id");
								$uyesor->execute(array(
									'uye_id' => $hesapcek['destek_uye']
								));
								$uyecek=$uyesor->fetch(PDO::FETCH_ASSOC);



								$sonmesaj=$db->prepare("SELECT * from destekmesaj where destekmesaj_destek=:destekm_id order by destekmesaj_tarih DESC Limit 1");
								$sonmesaj->execute(array(
									'destekm_id' => $hesapcek['destek_id']
								));
								$sonmesajcek=$sonmesaj->fetch(PDO::FETCH_ASSOC);
								if ($hesapcek['destek_adminoku']=='0') {
									?>
									<tr>
										<td><b><?php echo $sonmesajcek['destekmesaj_tarih'] ?></b></td>
										<td><b><?php echo $hesapcek['destek_tarih']; ?></b></td>
										<td><b><?php echo $uyecek['uye_ad']." ".$uyecek['uye_soyad']; ?></b></td>
										<td><b><?php echo $hesapcek['destek_departman']; ?></b></td>
										<td><b><?php echo $hesapcek['destek_baslik']; ?></b></td>
										<td class="text-center"> 
											<?php
											if ($hesapcek['destek_durum']=='0') { ?> 
												<span style="font-size: 12px;" class="label label-default">Kapalı</span>
											<?php } else { ?>
												<span style="font-size: 14px;" class="label label-teal">Açık</span>
											<?php } ?> 
										</td>
										<td class="text-center"> 
											<?php
											if ($hesapcek['destek_onem']=='1') { ?> 
												<span style="font-size: 12px;" class="label label-info">Düşük</span>
											<?php } elseif ($hesapcek['destek_onem']=='2') { ?>
												<span style="font-size: 14px;" class="label label-warning">Orta</span>
											<?php } elseif ($hesapcek['destek_onem']=='3') { ?>
												<span style="font-size: 14px;" class="label label-danger">Yüksek</span>
											<?php } ?> 
										</td>
										<td class="text-center">
											<form method="POST" action="">
												<input type="hidden" name="id" value="<?php echo $hesapcek['destek_id']; ?>">
												<button style="cursor: pointer; align-items: right" type="submit" name="destekoku" class="btn btn-sm btn-warning"><i class="icon-paper-plane"></i> Talebi Oku</button>
											</form>
										</td>
									</tr>

								<?php } else { 
									?>
									<tr>
										<td><?php echo $sonmesajcek['destekmesaj_tarih'] ?></td>
										<td><?php echo $hesapcek['destek_tarih']; ?></td>
										<td><?php echo $uyecek['uye_ad']." ".$uyecek['uye_soyad']; ?></td>
										<td><?php echo $hesapcek['destek_departman']; ?></td>
										<td><?php echo $hesapcek['destek_baslik']; ?></td>
										<td class="text-center"> 
											<?php
											if ($hesapcek['destek_durum']=='0') { ?> 
												<span style="font-size: 12px;" class="label label-default">Kapalı</span>
											<?php } else { ?>
												<span style="font-size: 14px;" class="label label-teal">Açık</span>
											<?php } ?> 
										</td>
										<td class="text-center"> 
											<?php
											if ($hesapcek['destek_onem']=='1') { ?> 
												<span style="font-size: 12px;" class="label label-info">Düşük</span>
											<?php } elseif ($hesapcek['destek_onem']=='2') { ?>
												<span style="font-size: 14px;" class="label label-warning">Orta</span>
											<?php } elseif ($hesapcek['destek_onem']=='3') { ?>
												<span style="font-size: 14px;" class="label label-danger">Yüksek</span>
											<?php } ?> 
										</td>
										<td class="text-center">
											<form method="POST" action="">
												<input type="hidden" name="id" value="<?php echo $hesapcek['destek_id']; ?>">
												<button style="cursor: pointer; align-items: right" type="submit" name="destekoku" class="btn btn-sm btn-default"><i class="icon-paper-plane"></i> Talebi Oku</button>
											</form>
										</td>
									</tr>

									<?php
								} } ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- İLETİŞİM MESAJLARI -->
		</div>

		<?php include 'footer.php'; ?>
