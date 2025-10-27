<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
include 'controller/seo.php';
$urunsor=$db->prepare("SELECT * from urunler where urun_paket= ? order by urun_id ASC");
$urunsor->execute(array('0'));
?>		
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
	<div class="page-header">
		<h2>Ürün İşlemleri</h2>
	</div>
	<div class="row">
		<!-- İLETİŞİM MESAJLARI -->
		<div class="col-md-12">
			<div class="card">
				<div class="card-heading card-default">
					<div style="margin-left: 10px;" class="pull-right mr-10 mt-10">
						<a href="urun-ekle.php" class="btn btn-primary btn-icon"><i class="fa fa-plus"></i>Ürün Ekle</a>
					</div>
					Ürünler
				</div>
				<div class="card-block">
					<table id="datatable1" class="table table-striped dt-responsive nowrap table-hover">
						<thead>
							<tr>
								<th class="text-left">
									<strong>Ürün ID</strong>
								</th>
								<th class="text-left">
									<strong>Ürün Resim</strong>
								</th>
								<th class="text-left">
									<strong>Ürün İsmi</strong>
								</th>
								<th class="text-left">
									<strong>Ürün Açıklama</strong>
								</th>
								<th class="text-left">
									<strong>Ürün Kategori</strong>
								</th>
								<th class="text-center">
									<strong>Resimler</strong>
								</th>
								<th class="text-center">
									<strong>İşlemler</strong>
								</th>
							</tr>
						</thead>
						<tbody>
							<?php 
							while ($uruncek=$urunsor->fetch(PDO::FETCH_ASSOC)) {
								$eskikategori=$db->prepare("SELECT * from kategoriler where kategori_id=:kategori_id");
								$eskikategori->execute(array(
									'kategori_id' => $uruncek['urun_kategori']
								));
								$eskikategoriyaz=$eskikategori->fetch(PDO::FETCH_ASSOC);
								
								$urunaciklama=mb_substr(strip_tags($uruncek['urun_aciklama']), 0, 40, 'UTF-8')."...";
								$resimsor=$db->prepare("SELECT * from resim where resim_urun=:resim_id limit 1");
								$resimsor->execute(array(
									'resim_id' => $uruncek['urun_id']
								));
								$resimcek=$resimsor->fetch(PDO::FETCH_ASSOC);
								?>
								<tr>
									<td>#<?php echo $uruncek['urun_id']; ?></td>
									<td><img style="max-height: 40px;max-width: 40px;" src="<?php echo $resimcek['resim_link']; ?>"></td>
									<td><?php echo $uruncek['urun_baslik']; ?></td>
									<td><?php echo $urunaciklama; ?></td>
									<td>
										<a target="_blank" href="<?php echo $settingsprint['ayar_siteurl']; ?><?=seo('urun-kategori-'.$eskikategoriyaz["kategori_ad"]).'-'.$eskikategoriyaz["kategori_id"]?>" title="Düzenle" class="btn btn-sm btn-warning"><i class="fa fa-external-link"></i></a> <?php echo $eskikategoriyaz['kategori_ad'] ?></td>
										<td class="text-center">
											<a href="urun-resim-duzenle.php?urun_id=<?php echo $uruncek['urun_id']; ?>" class="btn btn-primary btn-icon"><i class="icon-picture"></i> Resim Ayarları</a>
										</td>
										<td class="text-center">
											<a href="urun-duzenle.php?urun_id=<?php echo $uruncek['urun_id']; ?>" title="Düzenle" class="btn btn-sm btn-success"><i class="fa fa-edit"></i></a>
											<a href="controller/function.php?urunsil=ok&urun_id=<?php echo $uruncek['urun_id']; ?>&urun_resim=<?php echo $resimcek['resim_link']; ?>" title="Sil" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></a>
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
