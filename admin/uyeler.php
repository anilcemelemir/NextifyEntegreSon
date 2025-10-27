<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
$uyesor=$db->prepare("SELECT * from uye");
$uyesor->execute(array(0));
?>		
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
	<div class="page-header">
		<h2>Üye İşlemleri</h2>
	</div>
	<div class="row">
		<!-- İLETİŞİM MESAJLARI -->
		<div class="col-md-12">
			<div class="card">
				<div class="card-heading card-default">
					Üyeler
				</div>
				<div class="card-block">
					<table id="datatable1" class="table table-striped dt-responsive nowrap table-hover">
						<thead>
							<tr>
								<th class="text-left">
									<strong>Üyelik Tarihi</strong>
								</th>
								<th class="text-left">
									<strong>Üye Resim</strong>
								</th>
								<th class="text-left">
									<strong>Üye Adısoyadı</strong>
								</th>
								<th class="text-left">
									<strong>Üye Tel</strong>
								</th>
								<th class="text-left">
									<strong>Üye Mail</strong>
								</th>
								<th class="text-left">
									<strong>Üye Mail Durum</strong>
								</th>
								<th class="text-center">
									<strong>İşlemler</strong>
								</th>
							</tr>
						</thead>
						<tbody>
							<?php 
							while ($uyecek=$uyesor->fetch(PDO::FETCH_ASSOC)) {
								?>
								<tr>
									<td><?php echo $uyecek['uye_tarih']; ?></td>
									<td><img style="max-height: 40px;max-width: 40px;" src="<?php
									if ($uyecek['uye_resim']=='0') {

										?> ../admin/assets/img/genel/user.png <?php
										} else {
											?>../<?php echo $uyecek['uye_resim']; 
										}
										?>"></td>
										<td><?php echo $uyecek['uye_ad']." ".$uyecek['uye_soyad']; ?></td>
										<td><?php echo $uyecek['uye_tel']; ?></td>
										<td><?php echo $uyecek['uye_mail']; ?></td>
										<td><?php 
										if ($uyecek['uye_onaymail']=='0') {
											?> <span style="font-size: 12px;" class="label label-default">Onay Bekliyor</span> <?php 
										} else {
											?> <span style="font-size: 14px;" class="label label-teal">Onaylı</span> <?php 
										}
										?></td>
										<td class="text-center">
											<a href="uye-duzenle.php?uye_id=<?php echo $uyecek['uye_id']; ?>" title="Düzenle" class="btn btn-sm btn-success"><i class="fa fa-edit"></i></a>
											<a href="controller/function.php?uyesil=ok&uye_id=<?php echo $uyecek['uye_id']; ?>" title="Sil" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></a>
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
