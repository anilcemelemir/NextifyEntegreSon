<?php 

include 'header.php';

include 'topbar.php';

include 'sidebar.php';

$siparissor=$db->prepare("SELECT * from siparis where siparis_durum=0 order by siparis_tarih ASC");

$siparissor->execute(array(0));

?>		

<section class="main-content container">

	<div class="page-header">

		<h2>Sipariş İşlemleri</h2>

	</div>

	<div class="row">

		<div class="col-md-12">

			<div class="card">

				<div class="card-heading card-default">

					Tamamlanan Siparişler

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

									<strong>Sipariş Ad</strong>

								</th>

								<th>

									<strong>Sipariş Mail</strong>

								</th>

								<th>

									<strong>Sipariş Tel</strong>

								</th>

								<th>

									<strong>Sipariş Fiyat</strong>

								</th>

								<th>

									<strong>Sipariş Ödeme</strong>

								</th>

								<th class="text-center">

									<strong>İşlemeler</strong>

								</th>

							</tr>

						</thead>

						<tbody>

							<?php 

							while ($sipariscek=$siparissor->fetch(PDO::FETCH_ASSOC)) {

								$user=$db->prepare("SELECT * from uye where uye_id=:uye_mail");

								$user->execute(array(

									'uye_mail' => $sipariscek['siparis_ad']

								));

								$userprint=$user->fetch(PDO::FETCH_ASSOC);

								?>

								<tr>

									<td><?php echo $sipariscek['siparis_tarih']; ?></td>

									<td><?php echo $sipariscek['siparis_id']; ?></td>

									<td><?php echo $userprint['uye_ad']; ?></td>

									<td><?php echo $userprint['uye_mail']; ?></td>

									<td><?php echo $userprint['uye_tel']; ?></td>

									<td><?php echo $sipariscek['siparis_fiyat']; ?>TL</td>

									<td>

										<?php if ($sipariscek['siparis_odeme']=="credit_card") { echo "Kredi Kartı"; } else { echo $sipariscek['siparis_odeme']; } ?>

									</td>

									<td class="text-center">

										<a href="siparis-detay.php?siparis_id=<?php echo $sipariscek['siparis_id']; ?>" title="Göster" class="btn btn-sm btn-default"><i class="fa fa-eye"></i></a>

										<a href="controller/function.php?siparissil=ok&siparis_id=<?php echo $sipariscek['siparis_id']; ?>" title="Sil" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></a>

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

