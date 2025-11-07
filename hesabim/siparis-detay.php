<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';

$inovance=$db->prepare("SELECT * from siparis where siparis_id=:siparis_id");
$inovance->execute(array(
	'siparis_id' => $_GET['siparis_id']
));
$inovanceprint=$inovance->fetch(PDO::FETCH_ASSOC);

$siparis=$inovanceprint['siparis_ad'];

$uye=$userprint['uye_id'];

$surunsor1=$db->prepare("SELECT * from surun where surun_siparis=:surun_id");
$surunsor1->execute(array(
	'surun_id' => $inovanceprint['siparis_id'] 

));

$product=$db->prepare("SELECT * from urunler where urun_id=:urun_id");
$product->execute(array(
	'urun_id' => $inovanceprint['siparis_urun']
));
$productprint=$product->fetch(PDO::FETCH_ASSOC);
$urunicerik=mb_substr(strip_tags($productprint['urun_aciklama']), 0, 80, 'UTF-8')."...";

if ($siparis==$uye) {
} else {
	header("Location:../index.php");
}


$odeme=$db->prepare("SELECT * from odemebildirim where siparis=:siparis_id");
$odeme->execute(array(
	'siparis_id' => $inovanceprint['siparis_id']
));
$odemeprint=$odeme->fetch(PDO::FETCH_ASSOC);
$sayBildirim = $odeme->rowCount();

?>		
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
						<div class="col-md-6 text-right">
							<div>
								<button style="cursor: pointer;" class="btn btn-success" onclick="window.print();"><i class="fa fa-print"></i> Yazdır</button>  
								<?php if ($inovanceprint['siparis_durum']=='1') { ?>          
									<a href="siparisler" class="btn btn-warning btn-icon"><i class="fa fa-reply"></i>Geri Dön</a>   
								<?php } else { ?>
									<a href="siparisler" class="btn btn-warning btn-icon"><i class="fa fa-reply"></i>Geri Dön</a>
								<?php } ?>       
							</div>
						</div>
					</div>
				</div>
				<div class="card-block">
					<div class="row margin-b-40">
						<div class="col-sm-12">
							<h6><b>Sipariş Durumu :</b> 
								<?php if ($inovanceprint['siparis_durum']=='1') { ?>
									<b style="color: green;">Yeni Sipariş</b>

									<?php if ($sayBildirim>=1) { ?>
										<b style="color: red;">( Havale Ödeme Bildirimi Yapılmıştır! ( <?php echo $odemeprint['tarih'] ?> ))</b>
									<?php } ?>

								<?php } else {?>
									<b style="color: #ffb822;">Tamamlanmış Sipariş</b>
								<?php } ?>
							</h6>	
							<h6>
								<b>Ödeme Yöntemi : <?php echo $inovanceprint['siparis_odeme'] ?></b>
							</h6>
							<?php if ($inovanceprint['siparis_not']) {  ?>
								<p>
									<?php echo $inovanceprint['siparis_not']; ?>
								</p>
							<?php } ?>
							<form method="POST" action="yeni-destek">
								<button style="cursor: pointer;" type="submit" name="siparisdestek" class="btn btn-success btn-icon" value="Sipariş No: #<?php echo $inovanceprint['siparis_id'] ?> hk."><i class="fa fa-save"></i>DESTEK AL</button>
							</form>
						</div>

					</div>

					<div class="table-responsive margin-b-40">
						<table class="table table-striped">
							<thead>
								<tr><?php if ($inovanceprint['siparis_durum']=='0') { ?>
									<th style="width: 35%;">Ürün Bilgileri</th>
								<?php } else { ?>
									<th style="width: 70%;">Ürün Bilgileri</th>
								<?php } if ($inovanceprint['siparis_durum']=='0') { ?>
									<th style="width: 35%;">Teslim Bilgisi</th>
								<?php } ?>
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
									<?php if ($inovanceprint['siparis_durum']=='0') { ?>
										<td>
											<?php echo "<br> ".$suruncek1['surun_adet']; ?>
										</td>
									<?php } ?>
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
											<td>(%20)  <i class="fa fa-try"></i><?php echo $inovanceprint['siparis_fiyat']-$inovanceprint['siparis_fiyat_kdvsiz']; ?></td>
										</tr>
										<tr>
											<td><strong>TOPLAM :</strong></td>
											<td><i class="fa fa-try"></i><?php echo $inovanceprint['siparis_fiyat']; ?></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<?php if ($inovanceprint['siparis_durum']=='1') { ?>
							<form action="../admin/controller/function.php" method="POST">
								<input type="hidden" name="siparis_id" value="<?php echo $inovanceprint['siparis_id']; ?>">
								<div class="form-group">
									<label>ÖDEME YÖNTEMİ</label>
									<select name="siparis_odeme" required="" class="form-control m-b" style="background: #f2f4f8; color: #455a64;">
										<option value="Kredi Kartı">Kredi Kartı ile Öde</option>
										<?php if ($sayBildirim>=1) { ?>
											<option value="" disabled="">Havale Ödeme Bildirimi Yap - (Daha Önce Havale Bildirimi Yapılmıştır!)</option>
										<?php } else { ?>
											<option value="Havale">Havale Ödeme Bildirimi Yap</option>
										<?php } ?>
									</select>
								</div>
								<div class="row">
									<!-- RECAPTCHA KODU KALDIRILDΙ -->
									<div class="col-md-12 text-right">
										<div>            
											<button style="cursor: pointer;" type="submit" name="odemedevam" class="btn btn-primary">Ödemeyi Tamamla</button>            
										</div>
									</div>
								</div>
							</form>
						<?php } ?>
					</div>
				</div>
			</div>
		</div>

		<?php include 'footer.php'; ?>