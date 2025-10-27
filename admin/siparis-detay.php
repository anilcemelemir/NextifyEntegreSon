<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
$inovance=$db->prepare("SELECT * from siparis where siparis_id=:siparis_id");
$inovance->execute(array(
	'siparis_id' => $_GET['siparis_id']
));
$inovanceprint=$inovance->fetch(PDO::FETCH_ASSOC);

$product=$db->prepare("SELECT * from urunler where urun_id=:urun_id");
$product->execute(array(
	'urun_id' => $inovanceprint['siparis_urun']
));
$productprint=$product->fetch(PDO::FETCH_ASSOC);

$surunsor1=$db->prepare("SELECT * from surun where surun_siparis=:surun_id");
$surunsor1->execute(array(
	'surun_id' => $inovanceprint['siparis_id'] 
));

$urunicerik=mb_substr(strip_tags($productprint['urun_aciklama']), 0, 80, 'UTF-8')."...";

$user=$db->prepare("SELECT * from uye where uye_id=:uye_mail");
$user->execute(array(
	'uye_mail' => $inovanceprint['siparis_ad']
));
$userprint=$user->fetch(PDO::FETCH_ASSOC);

$odeme=$db->prepare("SELECT * from odemebildirim where siparis=:siparis_id");
$odeme->execute(array(
	'siparis_id' => $inovanceprint['siparis_id']
));
$odemeprint=$odeme->fetch(PDO::FETCH_ASSOC);
$sayBildirim = $odeme->rowCount();
?>		
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
	<div class="page-header">
		<h2>Sipariş Detay</h2>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-block">
					<div class="row">
						<div class="col-md-6">
							<h4>Sipariş No : <small>#00<?php echo $inovanceprint['siparis_id']; ?></small></h4>
						</div>
						<div class="col-md-6">
							<div class="text-right">
								<a href="controller/function.php?siparissil=ok&siparis_id=<?php echo $inovanceprint['siparis_id']; ?>" title="Sil" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i> Siparişi Sil </a>
								<?php if ($inovanceprint['siparis_durum']=='1') { ?>
									<a href="controller/function.php?siparisonay=ok&siparis_id=<?php echo $inovanceprint['siparis_id']; ?>" title="Tamamla" class="btn btn-success btn-sm"><i class="fa fa-check"></i>Siparişi Tamamla</a>
								<?php } else {} ?>
							</div>
						</div>
					</div>
				</div>
				<div class="card-block">
					<div class="row margin-b-40">
						<div class="col-sm-6">

							<h6>#Sipariş Durumu : <?php if ($inovanceprint['siparis_durum']=='1') { ?>
								<b style="color: green;">Yeni Sipariş</b>
								<?php if ($sayBildirim>=1) { ?>
									<b style="color: red;">( Havale Ödeme Bildirimi Yapılmıştır! ( <?php echo $odemeprint['tarih'] ?> ))</b>
								<?php } ?>
							<?php } else {?>
								<b style="color: #ffb822;">Tamamlanmış Sipariş</b>
							<?php } ?>
						</h6>

						<address>
							<strong>Müşteri Bilgileri : </strong><br>
							<?php echo "Ad soyad : ".$userprint['uye_ad']; ?><br>
							<?php echo "Mail: ".$userprint['uye_mail']; ?><br>
							<abbr title="Phone">Tel:</abbr> <?php echo $userprint['uye_tel']; ?><br>
							<?php echo "Siparis Ödeme: ".$inovanceprint['siparis_odeme']; ?><br>
							<a target="_blank" href="uye-duzenle.php?uye_id=<?php echo $userprint['uye_id']; ?>"><b>Üye Profiline Git</b></a>
						</address>
					</div>
				</div>

				<div class="table-responsive margin-b-40">
					<table class="table table-striped">
						<thead>
							<tr>
								<th style="width: 35%;">Ürün Bilgileri</th>
								<th style="width: 35%;">Teslim Bilgisi</th>
								<th style="width: 10%;" class="text-center">Fiyat</th>
								<th style="width: 10%;" class="text-center">Adet</th>
								<th style="width: 20%;" class="text-right">Toplam Fiyat</th>
							</tr>
						</thead>
						<tbody>
							<?php while($suruncek1=$surunsor1->fetch(PDO::FETCH_ASSOC)) { ?>
								<tr>
									<td>
										<div><strong><?php echo $suruncek1['surun_urun']; ?></strong></div>
									</td>

									<td>
										<?php echo "<br> ".$suruncek1['surun_adet']; ?>
									</td>
									<td class="text-center"><i class="fa fa-try"></i><?php echo $suruncek1['surun_fiyat']; ?></td>
									<td class="text-center">1</td>
									<td class="text-right"><i class="fa fa-try"></i>
										<?php 
										$toplam = $suruncek1['surun_fiyat']*1;

										echo $toplam; ?></td>
									</tr>

									<?php $geneltoplam += strip_tags(htmlspecialchars($toplam)); } ?>
								</tbody>
							</table>
						</div>
						<?php  ?>
						<div class="row">
							<div class='col-md-8'>
								
							</div>
							<div class="col-md-4 col-md-offset-2">
								<table class="table table-striped text-right">
									<tbody>
										<tr>
											<td><strong>Ara Toplam :</strong></td>
											<td><i class="fa fa-try"></i><?php echo $inovanceprint['siparis_fiyat_kdvsiz']; ?></td>
										</tr>
										<tr>
											<td><strong>KDV :</strong></td>
											<td>(%18)  <i class="fa fa-try"></i><?php echo $inovanceprint['siparis_fiyat']-$inovanceprint['siparis_fiyat_kdvsiz']; ?></td>
										</tr>
										<tr>
											<td><strong>TOPLAM :</strong></td>
											<td><i class="fa fa-try"></i><?php echo $inovanceprint['siparis_fiyat']; ?></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12 text-right">
								<div>
									<button class="btn btn-success" onclick="window.print();"><i class="fa fa-print"></i> Yazdır</button>  
									<?php if ($inovanceprint['siparis_durum']=='1') { ?>          
										<a href="yeni-siparisler.php" class="btn btn-warning btn-icon"><i class="fa fa-reply"></i>Geri Dön</a>   
									<?php } else { ?>
										<a href="tamamlanan-siparisler.php" class="btn btn-warning btn-icon"><i class="fa fa-reply"></i>Geri Dön</a>
									<?php } ?>       
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>





		<?php if (isset($_POST['notekle'])) {

			$ayarkaydet = $db->prepare(
				"UPDATE siparis SET
				siparis_not=:not
				WHERE siparis_id={$_POST['siparis_id']}"
			);
			$update     = $ayarkaydet->execute(
				array(
					'not'     => $_POST[ 'siparis_not' ]
				)
			);

			$sprs = $_GET['siparis_id'];

			if ( $update )
			{

				Header( "Location:?siparis_id=$sprs&status=ok" );
			}
			else
			{

				Header( "Location:?siparis_id=$sprs&status=no" );
			}

		} ?>




		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-block">
						<div class="row">
							<div class="col-md-12">
								<h4>Siparişe Mesaj Ekle <small>Mesajı üye okuyacaktır. (örn. indirme linki veya sipariş aşamasını belirtiniz)</small></h4>
							</div>
						</div>
					</div>
					<div class="card-block">
						<form action="" method="POST">
							<input type="hidden" name="siparis_id" value="<?php echo $inovanceprint['siparis_id']; ?>">
							<div class="form-group">
								<textarea style="height: 100px;" class="summernote" id="summernote" name="siparis_not" rows="5" ><?php echo htmlspecialchars($inovanceprint['siparis_not']); ?></textarea>
							</div>
							<div class="form-group">
								<button style="cursor: pointer;" name="notekle" type="submit" class="btn btn-success btn-icon"><i class="fa fa-save"></i>Açıklama Kaydet</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
		<?php include 'footer.php'; ?>
