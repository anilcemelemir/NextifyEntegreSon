<?php 
include 'header.php';
include 'topbar.php';
include '../admin/controller/seo.php';
include 'sidebar.php';
$siparissor=$db->prepare("SELECT * from siparis where siparis_ad=:siparis_ad");
$siparissor->execute(array(
	'siparis_ad' => $userprint['uye_id']
));
?>		
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
	<div class="page-header">
		<h2>Üye Sipariş İşlemleri</h2> 
		<?php if (isset($_POST['siparissil'])) {


			$sil     = $db->prepare( "DELETE from siparis where siparis_id=:siparis_id" );
			$kontrol = $sil->execute(
				array(
					'siparis_id' => $_POST[ 'siparis_id' ]
				)
			);

			if ( $kontrol )
			{


				Header( "Location:?status=ok" );
				

			}
			else
			{

				Header( "Location:?status=no" );
			}
			
		} ?>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-heading card-default">
					Tüm Siparişler
				</div>
				<div class="card-block">
					<table id="datatable2" class="table table-striped dt-responsive nowrap">
						<thead>
							<tr>
								<th>
									<strong>Sipariş Tarih</strong>
								</th>
								<th>
									<strong>Sipariş No</strong>
								</th>
								<th>
									<strong>Sipariş Fiyat</strong>
								</th>
								<th>
									<strong>Sipariş Ödeme</strong>
								</th>
								<th>
									<strong>Sipariş Durum</strong>
								</th>
								<th class="text-center">
									<strong>İşlemeler</strong>
								</th>
							</tr>
						</thead>
						<tbody>
							<?php 
							while ($sipariscek=$siparissor->fetch(PDO::FETCH_ASSOC)) {
								?>
								<tr>
									<td><?php echo $sipariscek['siparis_tarih']; ?></td>
									<td>#<?php echo $sipariscek['siparis_id']; ?></td>
									<td><?php echo $sipariscek['siparis_fiyat']; ?>TL</td>
									<td><?php echo $sipariscek['siparis_odeme']; ?></td>
									<td><?php 
									if ($sipariscek['siparis_durum']=="1") {
										?>	<span style="font-size: 12px;" class="label label-info">Yeni Sipariş</span> <?php
									} else {
										?>	<span style="font-size: 12px;" class="label label-warning">Tamamlanan Sipariş</span> <?php
									}
									
									?></td>
									<td class="text-center">
										<form action="" method="POST">
											<input type="hidden" name="siparis_id" value="<?php echo $sipariscek['siparis_id']; ?>">
											<a href="siparis-detay?siparis_id=<?=$sipariscek['siparis_id']?>" title="Göster" class="btn btn-sm btn-default"><i class="fa fa-eye"></i></a>
										</form>
									</td>
								</tr>
							<?php } ?>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>

	<?php include 'footer.php'; ?>
