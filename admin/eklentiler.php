<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
$hesapsor=$db->prepare("SELECT * from eklenti order by id DESC");
$hesapsor->execute(array(0));
?>		
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
	<div class="page-header">
		<h2>Eklenti İşlemleri</h2>
	</div>
	<div class="row">
		<!-- İLETİŞİM MESAJLARI -->
		<div class="col-md-12">
			<div class="card">
				<div class="card-heading card-default">
					<div class="pull-right mt-10">
						<a href="eklenti-ekle.php" class="btn btn-primary btn-icon"><i class="fa fa-plus"></i> Eklenti Ekle</a>
					</div>
					Eklentiler
				</div>

				<div class="card-block">
					<table id="datatable1" class="table table-striped dt-responsive nowrap table-hover">
						<thead>
							<tr>
								<th class="text-left">
									<strong>Eklenti Adı</strong>
								</th>
								<th class="text-left">
									<strong>Eklenti Fiyat</strong>
								</th>
								<th class="text-left">
									<strong>Eklenti Cinsi</strong>
								</th>
								<th class="text-center">
									<strong>İşlemler</strong>
								</th>
							</tr>
						</thead>
						<tbody>
							<?php 
							while ($hesapcek=$hesapsor->fetch(PDO::FETCH_ASSOC)) {
								?>
								<tr>
									<td><?php echo $hesapcek['ad']; ?></td>
									<td><?php echo $hesapcek['fiyat']; ?>TL</td>
									<td><?php if ($hesapcek['cinsi']==0) {
										echo "Hosting";
									} else { 
										echo "Eklenti"; 
									} ?></td>
									<td class="text-center">
										<a href="eklenti-duzenle.php?eklenti_id=<?php echo $hesapcek['id']; ?>" title="Düzenle" class="btn btn-sm btn-success"><i class="fa fa-edit"></i></a>
										<a href="controller/function.php?eklentisil=ok&eklenti_id=<?php echo $hesapcek['id']; ?>" title="Sil" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></a>
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
