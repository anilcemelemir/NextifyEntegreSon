<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
include 'controller/seo.php';
$urunsor=$db->prepare("SELECT * from urunler where urun_paket=1 order by urun_id ASC");
$urunsor->execute(array(0));
?>		
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
	<div class="page-header">
		<h2>Paket İşlemleri</h2>
	</div>
	<div class="row">
		<!-- İLETİŞİM MESAJLARI -->
		<div class="col-md-12">
			<div class="card">
				<div class="card-heading card-default">
					<div style="margin-left: 10px;"  class="pull-right mt-10">
						<a href="paket-ekle.php" class="btn btn-primary btn-icon"><i class="fa fa-plus"></i> Paket Ekle</a>
					</div>
					Paket
				</div>
				<div class="card-block">
					<table id="datatable1" class="table table-striped dt-responsive nowrap table-hover">
						<thead>
							<tr>
								<th class="text-left">
									<strong>Paket İsmi</strong>
								</th>
								<th class="text-left">
									<strong>Kategori</strong>
								</th>
								<th class="text-center">
									<strong>Aylık Fiyat</strong>
								</th>
								<th class="text-center">
									<strong>Yıllık Fiyat</strong>
								</th>
								<th class="text-center">
									<strong>İşlemler</strong>
								</th>
							</tr>
						</thead>
						<tbody>
							<?php 
							while ($uruncek=$urunsor->fetch(PDO::FETCH_ASSOC)) {
								$eskikategori=$db->prepare("SELECT * from kategoripaket where kategori_id=:kategori_id");
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
									<td><?php echo $uruncek['urun_baslik']; ?></td>
									<td>
										<?php echo $eskikategoriyaz['kategori_ad'] ?>
									</td>
									<td class="text-center">
										<?php echo number_format($uruncek['urun_aylik_fiyat'], 2, ',', '.'); ?> ₺
									</td>
									<td class="text-center">
										<?php echo number_format($uruncek['urun_yillik_fiyat'], 2, ',', '.'); ?> ₺
									</td>
									<td class="text-center">
										<a target="_blank" href="<?php echo $settingsprint['ayar_siteurl']; ?><?=seo('paket-'.$eskikategoriyaz["kategori_ad"]).'-'.$eskikategoriyaz["kategori_id"]?>" title="Görüntüle" class="btn btn-sm btn-warning"><i class="fa fa-external-link"></i></a>
										<a href="paket-duzenle.php?urun_id=<?php echo $uruncek['urun_id']; ?>" title="Düzenle" class="btn btn-sm btn-success"><i class="fa fa-edit"></i></a>
										<a href="controller/function.php?paketsil=ok&urun_id=<?php echo $uruncek['urun_id']; ?>" title="Sil" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></a>
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