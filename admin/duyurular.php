<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
$duyurusor=$db->prepare("SELECT * from duyuru");
$duyurusor->execute(array(0));
?>		
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
	<div class="page-header">
		<h2>Duyuru İşlemleri</h2>
	</div>
	<div class="row">
		<!-- İLETİŞİM MESAJLARI -->
		<div class="col-md-12">
			<div class="card">
				<div class="card-heading card-default">
					<div class="pull-right mt-10">
						<a href="duyuru-ekle.php" class="btn btn-primary btn-icon"><i class="fa fa-plus"></i> Duyuru Ekle</a>
					</div>
					Duyurular
				</div>
				<div class="card-block">
					<table id="datatable1" class="table table-striped dt-responsive nowrap table-hover">
						<thead>
							<tr>
								<th class="text-left">
									<strong>Duyuru Tarih</strong>
								</th>
								<th class="text-left">
									<strong>Duyuru durum</strong>
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
							while ($duyurucek=$duyurusor->fetch(PDO::FETCH_ASSOC)) {
								$duyurucekcerik=mb_substr(strip_tags($duyurucek['duyuru_detay']), 0, 80, 'UTF-8');
								?>
								<tr>
									<td><?php echo $duyurucek['duyuru_tarih']; ?></td>
									<td>	
										<?php
										if ($duyurucek['duyuru_durum']=='0') { ?> 
											<span style="font-size: 12px;" class="label label-default">Pasif</span>
										<?php } else { ?>
											<span style="font-size: 14px;" class="label label-teal">Aktif</span>
										<?php } ?> 
									</td>
									<td><?php echo $duyurucek['duyuru_baslik']; ?></td>
									<td><?php echo $duyurucekcerik; ?></td>
									<td class="text-center">
										<a href="duyuru-duzenle.php?duyuru_id=<?php echo $duyurucek['duyuru_id']; ?>" title="Düzenle" class="btn btn-sm btn-success"><i class="fa fa-edit"></i></a>
										<a href="controller/function.php?duyurusil=ok&duyuru_id=<?php echo $duyurucek['duyuru_id']; ?>" title="Sil" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></a>
									</td>
								</tr>
							<?php } ?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- İLETİŞİM MESAJLARI -->
	</div>

	<?php include 'footer.php'; ?>
