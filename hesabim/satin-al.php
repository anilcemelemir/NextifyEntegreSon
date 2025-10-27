<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
include '../admin/controller/seo.php';
$urunler = @$_SESSION['urunler'];

$say = count(@$urunler);

if ($say==0) {
	header("Location:../sepet");
	exit;
}
$html=$db->prepare("SELECT * from widget");
$html->execute(array());
$htmlwrite=$html->fetch(PDO::FETCH_ASSOC);
?>		
<section class="main-content container">
	<div class="page-header">
		<h2>GÜVENLİ SATIN AL</h2>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-block">
					<div class="row">
						<div class="col-md-12" style="margin-bottom: 20px;">
							<div class="text-right">
								<a href="../sepet" class="btn btn-default btn-sm"><i class="fa fa-pencil"></i> Sepeti Düzenle </a>
							</div>
						</div>
						<div class="col-md-12">
							<div class="alert bg-info alert-dismissible" role="alert" style="background-color: #a9bde4 !important;border-color: #88a7e4 !important;"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Bilgi!</strong> Sipariş sonrası faturanızın kesilebilmesi için bilgilerinizi doldurduğunuzdan ve doğruluğundan emin olunuz! => <b><a style="color: #fff;" target="_blank" href="hesap-ayarlari">Hesap Ayarları</a></b></div>
						</div>
					</div>
				</div>
				<div class="card-block">

					<div class="table-responsive margin-b-40">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Ürün / Hizmet</th>
									<th class="text-center">Adet</th>
									<th class="text-right">Total Price</th>
								</tr>
							</thead>
							<tbody>
								<?php
								foreach($urunler as $key => $urun) {
									$toplam += $urun['fiyat']; 
									$urunsorxc=$db->prepare("SELECT * from urunler where urun_id=:urun_id");
									$urunsorxc->execute(array(
										'urun_id' => $urun['id']
									));
									$uruncekxc=$urunsorxc->fetch(PDO::FETCH_ASSOC);
									?>
									<tr>
										<td>
											<?php if ($urun['paket']==0) {
												$resimsor=$db->prepare("SELECT * from resim where resim_urun=:resim_urun Limit 1");
												$resimsor->execute(array(
													'resim_urun' => $urun["id"]
												));
												$resimcek=$resimsor->fetch(PDO::FETCH_ASSOC); ?>
												<div class="row">
													<div class="col-md-2">
														<a target="_blank" href="../<?=seo('detay-'.$uruncekxc["urun_baslik"]).'-'.$uruncekxc["urun_id"]?>">
															<img width="100" height="auto" src="../admin/<?php echo $resimcek['resim_link'] ?>" alt="<?php echo $uruncekxc["urun_baslik"] ?>">
														</a>
													</div>
												<?php }  if ($urun['paket']==0) { ?>
													<div class="col-md-10">
														<a style="color: #000" target="_blank" href="<?=seo('detay-'.$uruncekxc["urun_baslik"]).'-'.$uruncekxc["urun_id"]?>"><?php echo $urun["urun"] ?></a>
													</div>
												</div>
											<?php } else { ?><b><?php echo $uruncekxc["urun_baslik"] ?></b><?php } ?>
										</td>
										<td class="text-center">1</td>
										<td class="text-right"><span><i class="fa fa-try"></i></span><?php echo $urun['fiyat']; ?></td>
									</tr>
									<?php $geneltoplam += $toplam; } ?>
								</tbody>
							</table>
						</div>
						<div class="row">
							<div class="col-md-12 col-md-offset-1 text-right">
								<table class="table table-striped text-right">
									<tbody>
										<tr>
											<td><strong>Toplam :</strong></td>
											<td><i class="fa fa-try"></i><?=$toplam?></td>
										</tr>
										<?php 
										$fiyat=$toplam;

										$kdv=ceil($fiyat*18/100);

										$geneltoplamkdv=$fiyat+$kdv;
										?>
										<tr>
											<td><strong>KDV :</strong></td>
											<td><i class="fa fa-try"></i><?=$kdv?></td>
										</tr>
										<tr>
											<td><strong>GENEL TOPLAM (ÖDENECEK TUTAR):</strong></td>
											<td><i class="fa fa-try"></i><?=$geneltoplamkdv?></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<form action="../admin/controller/function.php" method="POST">
							<div class="form-group">
								<label>ÖDEME YÖNTEMİ</label>
								<select name="siparis_odeme" required="" class="form-control m-b" style="background: #f2f4f8; color: #455a64;">
									<option value="">Seçim yapınız</option>
									<?php
									$odeme=$db->prepare("SELECT * from odeme where odeme_durum=1");
									$odeme->execute();
									while($odemecek=$odeme->fetch(PDO::FETCH_ASSOC)) { ?>
										<option value="<?php echo $odemecek['odeme_adi']; ?>"><?php echo $odemecek['odeme_adi']; ?> - <?php echo $odemecek['odeme_not']; ?></option>
									<?php } ?>
								</select>
							</div>
							<input type="hidden" name="siparis_fiyat" value="<?=$geneltoplamkdv?>-<?=$toplam?>">
							<div class="form-check text-right">
								<input required="" type="checkbox" class="form-check-input" id="exampleCheck1">
								<label class="form-check-label" style="padding-left: 0;" for="exampleCheck1"><a href="#" data-toggle="modal" data-target="#textModal">Satış Sözleşmesini</a> Okudum Anladım ve Onaylıyorum!</label>
							</div>
							<div class="row">
								<div class="col-md-12 text-right">
									<div class="g-recaptcha text-center" data-sitekey="<?=$linkApi['ranahtar']?>"></div>
								</div>
								<div class="col-md-12 text-right">
									<div>            
										<button style="cursor: pointer;" type="submit" name="siparisver" class="btn btn-primary">Siparişi Kaydet ve Devam et</button>            
									</div>
								</div>
							</div>
						</form>
						<div class="modal fade" id="textModal" tabindex="-1" role="dialog" aria-labelledby="textModal">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div style="text-align: left;" class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="fa fa-times"></span></button>
										<h3 class="modal-title" id="myModalLabel">SÖZLEŞME</h3>
									</div>
									<div class="modal-body">
										<p>
											<?php echo $htmlwrite['widget_satissozlesme']; ?>
										</p><br>
										<div class="text-center">
											
											<button style="cursor: pointer;" data-dismiss="modal" aria-label="Close" type="button" class="btn btn-warning btn-lg">ONAYLIYORUM</button>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<?php include 'footer.php'; ?>
