<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
include 'controller/seo.php';

// Başarısız ödemeleri getir
$odemeler = $db->prepare("
    SELECT ao.*, a.abone_urun, u.urun_baslik, uy.uye_ad, uy.uye_soyad, uy.uye_mail
    FROM abonelik_odemeler ao
    JOIN abonelikler a ON ao.odeme_abone = a.abone_id
    JOIN urunler u ON a.abone_urun = u.urun_id
    JOIN uye uy ON ao.odeme_uye = uy.uye_id
    WHERE ao.odeme_durum = 'basarisiz'
    ORDER BY ao.odeme_olusturma_tarihi DESC
");
$odemeler->execute();
$basarisiz_odemeler = $odemeler->fetchAll(PDO::FETCH_ASSOC);

// Aktif abonelikleri getir
$abonesor = $db->prepare("
    SELECT a.*, u.urun_baslik, uy.uye_ad, uy.uye_soyad, uy.uye_mail
    FROM abonelikler a
    JOIN urunler u ON a.abone_urun = u.urun_id
    JOIN uye uy ON a.abone_uye = uy.uye_id
    ORDER BY a.abone_tarih DESC
");
$abonesor->execute();
$abonelikler = $abonesor->fetchAll(PDO::FETCH_ASSOC);

?>
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
	<div class="page-header">
		<h2>Abonelik Yönetimi</h2>
	</div>

	<div class="row">
		<!-- Başarısız Ödemeler Kartı -->
		<div class="col-md-6">
			<div class="card">
				<div class="card-block bg-danger text-white text-center">
					<h4 class="card-title">⚠️ Başarısız Ödemeler</h4>
					<h1 style="font-size: 48px; margin: 10px 0;"><?php echo count($basarisiz_odemeler); ?></h1>
					<p>Dikkat gerektiren ödeme işlemleri</p>
				</div>
			</div>
		</div>

		<!-- Aktif Abonelikler Kartı -->
		<div class="col-md-6">
			<div class="card">
				<div class="card-block bg-success text-white text-center">
					<h4 class="card-title">✓ Aktif Abonelikler</h4>
					<h1 style="font-size: 48px; margin: 10px 0;"><?php 
						$aktif_count = count(array_filter($abonelikler, function($a) { return $a['abone_durum'] === 'aktif'; }));
						echo $aktif_count; 
					?></h1>
					<p>Canlı abonelik sayısı</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Başarısız Ödemeler Tablosu -->
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-heading card-default" style="background-color: #f8d7da; border-color: #f5c6cb; color: #721c24;">
					<strong><i class="fa fa-exclamation-triangle"></i> Başarısız Ödeme İşlemleri</strong>
				</div>
				<div class="card-block">
					<?php if (count($basarisiz_odemeler) > 0): ?>
					<div class="table-responsive">
						<table id="datatable1" class="table table-striped dt-responsive nowrap table-hover">
							<thead>
								<tr>
									<th><strong>Üye Adı</strong></th>
									<th class="text-center"><strong>E-mail</strong></th>
									<th class="text-center"><strong>Paket</strong></th>
									<th class="text-center"><strong>Tutar</strong></th>
									<th class="text-center"><strong>Başarısız Nedeni</strong></th>
									<th class="text-center"><strong>Tarih</strong></th>
									<th class="text-center"><strong>İşlemler</strong></th>
								</tr>
							</thead>
							<tbody>
								<?php foreach ($basarisiz_odemeler as $odeme): ?>
								<tr class="table-danger">
									<td>
										<strong><?php echo htmlspecialchars($odeme['uye_ad'] . ' ' . $odeme['uye_soyad']); ?></strong>
									</td>
									<td class="text-center">
										<a href="mailto:<?php echo htmlspecialchars($odeme['uye_mail']); ?>">
											<?php echo htmlspecialchars($odeme['uye_mail']); ?>
										</a>
									</td>
									<td class="text-center">
										<?php echo htmlspecialchars($odeme['urun_baslik']); ?>
									</td>
									<td class="text-center">
										<strong><?php echo number_format($odeme['odeme_tutar'], 2, ',', '.'); ?> ₺</strong>
									</td>
									<td class="text-center">
										<span class="label label-danger">
											<?php echo htmlspecialchars($odeme['odeme_basarisiz_neden']); ?>
										</span>
									</td>
									<td class="text-center">
										<?php echo date('d.m.Y H:i', strtotime($odeme['odeme_olusturma_tarihi'])); ?>
									</td>
									<td class="text-center">
										<button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#detayModal"
												onclick="detayGoster('<?php echo htmlspecialchars(json_encode($odeme)); ?>')">
											<i class="fa fa-eye"></i> Detay
										</button>
									</td>
								</tr>
								<?php endforeach; ?>
							</tbody>
						</table>
					</div>
					<?php else: ?>
					<div class="alert alert-success alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<i class="fa fa-check-circle"></i> Başarısız ödeme bulunmamaktadır.
					</div>
					<?php endif; ?>
				</div>
			</div>
		</div>
	</div>

	<!-- Tüm Abonelikler Tablosu -->
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-heading card-default">
					<strong><i class="fa fa-list"></i> Tüm Abonelikler</strong>
				</div>
				<div class="card-block">
					<div class="table-responsive">
						<table id="datatable2" class="table table-striped dt-responsive nowrap table-hover">
							<thead>
								<tr>
									<th><strong>Üye Adı</strong></th>
									<th class="text-center"><strong>Paket</strong></th>
									<th class="text-center"><strong>Tür</strong></th>
									<th class="text-center"><strong>Durum</strong></th>
									<th class="text-center"><strong>Bitiş Tarihi</strong></th>
									<th class="text-center"><strong>Sonraki Ödeme</strong></th>
									<th class="text-center"><strong>Yıl</strong></th>
								</tr>
							</thead>
							<tbody>
								<?php foreach ($abonelikler as $abone): ?>
								<tr>
									<td>
										<strong><?php echo htmlspecialchars($abone['uye_ad'] . ' ' . $abone['uye_soyad']); ?></strong>
										<br>
										<small style="color: #999;"><?php echo htmlspecialchars($abone['uye_mail']); ?></small>
									</td>
									<td class="text-center">
										<?php echo htmlspecialchars($abone['urun_baslik']); ?>
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
										<?php echo date('d.m.Y', strtotime($abone['abone_bitis_tarih'])); ?>
									</td>
									<td class="text-center">
										<span class="label label-primary">
											<?php echo date('d.m.Y', strtotime($abone['abone_sonraki_odeme_tarih'])); ?>
										</span>
									</td>
									<td class="text-center">
										<?php echo $abone['abone_yil_sayisi']; ?>
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

	<?php include 'footer.php'; ?>
</section>

<!-- Detay Modal -->
<div class="modal fade" id="detayModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header bg-danger text-white">
				<h5 class="modal-title">Başarısız Ödeme Detayları</h5>
				<button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
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

<script>
function detayGoster(odemeJson) {
	var odeme = JSON.parse(odemeJson);
	var icerik = '<div class="table-responsive">' +
		'<table class="table">' +
		'<tr><td><strong>Üye Adı:</strong></td><td>' + odeme.uye_ad + ' ' + odeme.uye_soyad + '</td></tr>' +
		'<tr><td><strong>E-mail:</strong></td><td><a href="mailto:' + odeme.uye_mail + '">' + odeme.uye_mail + '</a></td></tr>' +
		'<tr><td><strong>Paket:</strong></td><td>' + odeme.urun_baslik + '</td></tr>' +
		'<tr><td><strong>Tutar:</strong></td><td><strong>' + parseFloat(odeme.odeme_tutar).toFixed(2) + ' ₺</strong></td></tr>' +
		'<tr><td><strong>Başarısız Nedeni:</strong></td><td>' + odeme.odeme_basarisiz_neden + '</td></tr>' +
		'<tr><td><strong>Oluşturma Tarihi:</strong></td><td>' + new Date(odeme.odeme_olusturma_tarihi).toLocaleString('tr-TR') + '</td></tr>' +
		'</table></div>';
	
	document.getElementById('detayIcerik').innerHTML = icerik;
}
</script>