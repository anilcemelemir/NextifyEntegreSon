<?php 
include 'header.php';
include 'topbar.php';
include '../admin/controller/seo.php';
include 'sidebar.php';

/*
 * Çoklu ürün yapısı:
 * - surun.surun_siparis -> siparis.siparis_id
 * - surun.surun_urun    -> ürün adı (metin)
 *
 * Ürün adlarını alt sorguda GROUP_CONCAT ile birleştirip siparişe LEFT JOIN ediyoruz.
 * Bu yöntem ONLY_FULL_GROUP_BY modunda da sorunsuz çalışır.
 */
$siparissor = $db->prepare("
    SELECT s.*,
           agg.urunler
    FROM siparis s
    LEFT JOIN (
        SELECT 
            sd.surun_siparis AS siparis_id,
            GROUP_CONCAT(DISTINCT sd.surun_urun ORDER BY sd.surun_urun SEPARATOR ', ') AS urunler
        FROM surun sd
        GROUP BY sd.surun_siparis
    ) AS agg ON agg.siparis_id = s.siparis_id
    WHERE s.siparis_ad = :siparis_ad
    ORDER BY s.siparis_id DESC
");
$siparissor->execute([
    'siparis_ad' => $userprint['uye_id']
]);

// WhatsApp ayarlarını whatsapp-footer.php'deki gibi çekiyoruz
$whatsapp = $db->prepare("SELECT * from whatsapp where whats_id=0");
$whatsapp->execute(array(0));
$whatsappprint = $whatsapp->fetch(PDO::FETCH_ASSOC);
?>		
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
	<div class="page-header">
		<h2>Üye Sipariş İşlemleri</h2> 
		<?php if (isset($_POST['siparissil'])) {
			$sil     = $db->prepare("DELETE FROM siparis WHERE siparis_id=:siparis_id");
			$kontrol = $sil->execute(['siparis_id' => $_POST['siparis_id'] ?? null]);

			if ($kontrol) {
				Header("Location:?status=ok");
			} else {
				Header("Location:?status=no");
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

                    <?php if (!empty($whatsappprint) && (int)$whatsappprint['whats_durum'] === 1 && !empty($whatsappprint['whats_tel'])) { 
    $waUrl = "https://api.whatsapp.com/send?phone=90".rawurlencode($whatsappprint['whats_tel']);
?>
    <div class="alert alert-success" role="alert" style="margin-bottom:18px; display:flex; flex-wrap:wrap; align-items:center;">
        <span style="font-weight:500;">
            Sipariş İptali veya Bilgi İçin 
            '<a href="<?= $waUrl ?>" target="_blank" rel="noopener" style="text-decoration:none; color:#128C7E; font-weight:600;">
                <i class="fa fa-whatsapp" aria-hidden="true" style="font-size:16px; margin-right:4px;"></i>Whatsapp Linki
            </a>' Üzerinden İletişime Geçiniz.
        </span>
    </div>
<?php } ?>

					<table id="datatable2" class="table table-striped dt-responsive nowrap">
						<thead>
							<tr>
								<th><strong>Sipariş Tarih / Ürün(ler)</strong></th>
								<th><strong>Sipariş No</strong></th>
								<th><strong>Sipariş Fiyat</strong></th>
								<th><strong>Sipariş Ödeme</strong></th>
								<th><strong>Sipariş Durum</strong></th>
								<th class="text-center"><strong>İşlemler</strong></th>
							</tr>
						</thead>
						<tbody>
							<?php while ($sipariscek = $siparissor->fetch(PDO::FETCH_ASSOC)) { ?>
								<tr>
									<td>
										<?php 
											echo htmlspecialchars($sipariscek['siparis_tarih'] ?? '');
											echo ' - ';
											echo !empty($sipariscek['urunler']) ? htmlspecialchars($sipariscek['urunler']) : 'Ürün Yok';
										?>
									</td>
									<td>#<?php echo (int)($sipariscek['siparis_id'] ?? 0); ?></td>
									<td><?php echo htmlspecialchars($sipariscek['siparis_fiyat'] ?? '0'); ?> TL</td>
									<td><?php echo htmlspecialchars($sipariscek['siparis_odeme'] ?? ''); ?></td>
									<td>
										<?php if (($sipariscek['siparis_durum'] ?? '') === "1") { ?>
											<span style="font-size: 12px;" class="label label-info">Yeni Sipariş</span>
										<?php } else { ?>
											<span style="font-size: 12px;" class="label label-warning">Tamamlanan Sipariş</span>
										<?php } ?>
									</td>
									<td class="text-center">
										<form action="" method="POST">
											<input type="hidden" name="siparis_id" value="<?php echo (int)($sipariscek['siparis_id'] ?? 0); ?>">
											<?php 
											// 0 = Tamamlanan, 1 = Yeni Sipariş
											if (($sipariscek['siparis_durum'] ?? '') == 0) { ?>
												<a href="siparis-detay?siparis_id=<?php echo (int)$sipariscek['siparis_id']; ?>" 
												   title="Sipariş Özeti" 
												   class="btn btn-sm btn-info">
													<i class="fa fa-file-text"></i> Özeti Gör
												</a>
											<?php } else { ?>
												<a href="siparis-detay?siparis_id=<?php echo (int)$sipariscek['siparis_id']; ?>" 
												   title="Ödemeyi Tamamla" 
												   class="btn btn-sm btn-success">
													<i class="fa fa-check-circle"></i> Ödemeyi Tamamla
												</a>
											<?php } ?>
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
</section>