<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';

$uye_id = $userprint['uye_id'];

// Kullanıcının aboneliklerini getir
$abonesor = $db->prepare("
    SELECT a.*, u.urun_baslik, u.urun_aylik_fiyat, u.urun_yillik_fiyat
    FROM abonelikler a
    JOIN urunler u ON a.abone_urun = u.urun_id
    WHERE a.abone_uye = ?
    ORDER BY a.abone_tarih DESC
");
$abonesor->execute(array($uye_id));
$abonelikler = $abonesor->fetchAll(PDO::FETCH_ASSOC);

// Başarısız ödemeleri getir
$odemeler = $db->prepare("
    SELECT ao.* FROM abonelik_odemeler ao
    WHERE ao.odeme_uye = ? AND ao.odeme_durum = 'basarisiz'
    ORDER BY ao.odeme_olusturma_tarihi DESC
");
$odemeler->execute(array($uye_id));
$basarisiz_odemeler = $odemeler->fetchAll(PDO::FETCH_ASSOC);

?>		
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
	<div class="page-header">
		<h2>Aboneliklerim</h2>
	</div>

	<div class="row">
		<!-- Başarısız Ödemeler Uyarısı -->
		<?php if (count($basarisiz_odemeler) > 0): ?>
		<div class="col-md-12">
			<div class="alert alert-danger alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<strong>Uyarı!</strong> <?php echo count($basarisiz_odemeler); ?> adet başarısız ödemeniz bulunmaktadır. 
				Lütfen <a href="#basarisiz-odemeler" class="alert-link"><strong>aşağıdaki bölümü</strong></a> kontrol ediniz.
			</div>
		</div>
		<?php endif; ?>

		<!-- Status Mesajları -->
		<?php if (isset($_GET['status'])): ?>
			<?php if ($_GET['status'] === 'ok'): ?>
			<div class="col-md-12">
				<div class="alert alert-success alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<strong>Başarılı!</strong> Aboneliğiniz başarıyla oluşturuldu.
				</div>
			</div>
			<?php elseif ($_GET['status'] === 'payment_failed'): ?>
			<div class="col-md-12">
				<div class="alert alert-warning alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<strong>Dikkat!</strong> Ödeme başarısız oldu. Lütfen tekrar deneyin.
				</div>
			</div>
			<?php endif; ?>
		<?php endif; ?>
	</div>

	<!-- Aktif Abonelikler -->
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-heading card-default">
					<i class="icon-basket-loaded"></i> Aktif Abonelikler
				</div>
				<div class="card-block">
					<?php if (count($abonelikler) > 0): ?>
					<div class="table-responsive">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th><strong>Paket Adı</strong></th>
									<th class="text-center"><strong>Tür</strong></th>
									<th class="text-center"><strong>Durum</strong></th>
									<th class="text-center"><strong>Bitiş Tarihi</strong></th>
									<th class="text-center"><strong>Sonraki Ödeme</strong></th>
									<th class="text-center"><strong>İşlemler</strong></th>
								</tr>
							</thead>
							<tbody>
								<?php foreach ($abonelikler as $abone): ?>
								<tr>
									<td>
										<strong><?php echo htmlspecialchars($abone['urun_baslik']); ?></strong>
									</td>
									<td class="text-center">
										<?php if ($abone['abone_tur'] === 'yillik'): ?>
										<span class="label label-info">Yıllık</span>
										<?php else: ?>
										<span class="label label-warning">Aylık</span>
										<?php endif; ?>
									</td>
									<td class="text-center">
										<?php if ($abone['abone_durum'] === 'aktif'): ?>
										<span class="label label-success">Aktif</span>
										<?php elseif ($abone['abone_durum'] === 'bekleme'): ?>
										<span class="label label-warning">Bekleme</span>
										<?php else: ?>
										<span class="label label-danger">İptal</span>
										<?php endif; ?>
									</td>
									<td class="text-center">
										<?php 
										$bitis = strtotime($abone['abone_bitis_tarih']);
										if ($bitis < time()) {
											echo '<span class="text-danger"><strong>' . date('d.m.Y', $bitis) . '</strong></span>';
										} else {
											echo date('d.m.Y', $bitis);
										}
										?>
									</td>
									<td class="text-center">
										<span class="label label-primary"><?php echo date('d.m.Y', strtotime($abone['abone_sonraki_odeme_tarih'])); ?></span>
									</td>
									<td class="text-center">
										<?php if ($abone['abone_durum'] === 'aktif'): ?>
										<button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#detayModal" 
												onclick="detayGoster('<?php echo htmlspecialchars(json_encode($abone)); ?>')">
											<i class="fa fa-eye"></i> Detay
										</button>
										<?php else: ?>
										<span class="text-muted">-</span>
										<?php endif; ?>
									</td>
								</tr>
								<?php endforeach; ?>
							</tbody>
						</table>
					</div>
					<?php else: ?>
					<div class="alert alert-info">
						<i class="fa fa-info-circle"></i> Henüz bir aboneliğiniz bulunmamaktadır.
						<a href="<?php echo $settingsprint['ayar_siteurl']; ?>paketler" class="alert-link">Paketleri incelemek için tıklayın.</a>
					</div>
					<?php endif; ?>
				</div>
			</div>
		</div>
	</div>

	<!-- Başarısız Ödemeler -->
	<?php if (count($basarisiz_odemeler) > 0): ?>
	<div class="row" id="basarisiz-odemeler">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-heading card-default" style="background-color: #f8d7da; color: #721c24;">
					<i class="fa fa-exclamation-triangle"></i> Başarısız Ödemeler
				</div>
				<div class="card-block">
					<div class="table-responsive">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th><strong>Paket</strong></th>
									<th class="text-center"><strong>Tutar</strong></th>
									<th class="text-center"><strong>Neden</strong></th>
									<th class="text-center"><strong>Tarih</strong></th>
									<th class="text-center"><strong>İşlemler</strong></th>
								</tr>
							</thead>
							<tbody>
								<?php foreach ($basarisiz_odemeler as $odeme): 
									$abone_info = $db->prepare("SELECT u.urun_baslik FROM abonelikler a 
										JOIN urunler u ON a.abone_urun = u.urun_id 
										WHERE a.abone_id = ?");
									$abone_info->execute(array($odeme['odeme_abone']));
									$paket = $abone_info->fetch(PDO::FETCH_ASSOC);
								?>
								<tr class="table-danger">
									<td><strong><?php echo htmlspecialchars($paket['urun_baslik']); ?></strong></td>
									<td class="text-center"><?php echo number_format($odeme['odeme_tutar'], 2, ',', '.'); ?> ₺</td>
									<td class="text-center">
										<span class="label label-danger"><?php echo htmlspecialchars($odeme['odeme_basarisiz_neden']); ?></span>
									</td>
									<td class="text-center"><?php echo date('d.m.Y H:i', strtotime($odeme['odeme_olusturma_tarihi'])); ?></td>
									<td class="text-center">
										<button class="btn btn-sm btn-warning" data-toggle="modal" data-target="#odemeyenideModal"
												onclick="odemeyenidenKisiGoster('<?php echo htmlspecialchars(json_encode($odeme)); ?>')">
											<i class="fa fa-refresh"></i> Yeniden Dene
										</button>
									</td>
								</tr>
								<?php endforeach; ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<?php endif; ?>

	<?php include 'footer.php'; ?>
</section>

<!-- Detay Modal -->
<div class="modal fade" id="detayModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Abonelik Detayları</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" id="detayIcerik">
				<!-- Detaylar JavaScript tarafından yüklenecek -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
			</div>
		</div>
	</div>
</div>

<!-- Ödeme Yeniden Dene Modal -->
<div class="modal fade" id="odemeyenideModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Ödemeyi Yeniden Dene</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>Bu ödemeyi yeniden denemek istediğinize emin misiniz?</p>
				<div id="odemeyenidenDetay"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">İptal</button>
				<button type="button" class="btn btn-primary" id="odemeyenidenBtn">Ödemeyi Yeniden Yap</button>
			</div>
		</div>
	</div>
</div>

<script>
function detayGoster(abonelikJson) {
	var abone = JSON.parse(abonelikJson);
	var icerik = '<div class="table-responsive">' +
		'<table class="table">' +
		'<tr><td><strong>Paket:</strong></td><td>' + abone.urun_baslik + '</td></tr>' +
		'<tr><td><strong>Tür:</strong></td><td>' + (abone.abone_tur === 'yillik' ? 'Yıllık' : 'Aylık') + '</td></tr>' +
		'<tr><td><strong>Başlangıç Tarihi:</strong></td><td>' + new Date(abone.abone_baslangic_tarih).toLocaleDateString('tr-TR') + '</td></tr>' +
		'<tr><td><strong>Bitiş Tarihi:</strong></td><td>' + new Date(abone.abone_bitis_tarih).toLocaleDateString('tr-TR') + '</td></tr>' +
		'<tr><td><strong>Sonraki Ödeme:</strong></td><td>' + new Date(abone.abone_sonraki_odeme_tarih).toLocaleDateString('tr-TR') + '</td></tr>' +
		'<tr><td><strong>Yıl Sayısı:</strong></td><td>' + abone.abone_yil_sayisi + '</td></tr>' +
		'<tr><td><strong>Durum:</strong></td><td>' + 
		(abone.abone_durum === 'aktif' ? '<span class="label label-success">Aktif</span>' : 
		 abone.abone_durum === 'bekleme' ? '<span class="label label-warning">Bekleme</span>' : 
		 '<span class="label label-danger">İptal</span>') + 
		'</td></tr>' +
		'</table></div>';
	
	document.getElementById('detayIcerik').innerHTML = icerik;
}

function odemeyenidenKisiGoster(odemeJson) {
	var odeme = JSON.parse(odemeJson);
	var detay = '<p><strong>Tutar:</strong> ' + parseFloat(odeme.odeme_tutar).toFixed(2) + ' ₺</p>' +
		'<p><strong>Başarısız Nedeni:</strong> ' + odeme.odeme_basarisiz_neden + '</p>';
	
	document.getElementById('odemeyenidenDetay').innerHTML = detay;
	
	document.getElementById('odemeyenidenBtn').onclick = function() {
		// PayTR yeniden yöndendirme yapılabilir
		alert('Ödeme sistemi yeniden başlatılıyor...');
		// window.location.href = 'odeme-sayfasi?odeme_id=' + odeme.odeme_id;
	};
}
</script>