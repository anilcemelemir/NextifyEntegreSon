<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
$hesapedit=$db->prepare("SELECT * from eklenti where id=:hesap_id");
$hesapedit->execute(array(
	'hesap_id' => $_GET['eklenti_id']
));
$hesapwrite=$hesapedit->fetch(PDO::FETCH_ASSOC);

?>		
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
	<div class="page-header">
		<h2>Eklenti İşlemleri</h2>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-heading card-default">
					<div class="pull-right mt-10">
						<a href="eklentiler.php" class="btn btn-warning btn-icon"><i class="fa fa-reply"></i>Geri Dön</a>
					</div>
					Eklenti Düzenle
				</div>
				<div class="card-block">

					<form method="POST" action="controller/function.php" class="form-horizontal">
						<div class="form-group">
							<input type="hidden" name="id" value="<?php echo $hesapwrite['id']; ?>">
						</div>
						<div class="form-group">
							<label>Eklenti Adı</label>
							<input type="text" name="ad" value="<?php echo $hesapwrite['ad']; ?>" class="form-control">
						</div>
						<div class="form-group">
							<label>Eklenti Cinsi</label>
							<select name="cinsi" class="form-control m-b">
								<?php if ($hesapwrite['cinsi']==1) { ?>
									<option value="1">Eklenti</option>
									<option value="0">Hosting</option>
									<?php
								} else {?>
									<option value="0">Hosting</option>
									<option value="1">Eklenti</option>
								<?php }?>
							</select>
						</div>
						<div class="form-group">
							<label>Eklenti Fiyat</label>
							<input type="text" name="fiyat" value="<?php echo $hesapwrite['fiyat']; ?>" class="form-control">
						</div>
						<div class="form-group">
							<label>Eklenti Ek Açıklama (Cinsi Eklenti Olanlar İçindir.)</label>
							<input type="text" name="aciklama" value="<?php echo $hesapwrite['aciklama']; ?>" class="form-control">
						</div>
						<div class="form-group">
							<label>Sira</label>
							<input type="number" min="0" name="sira" value="<?php echo $hesapwrite['sira']; ?>" class="form-control">
						</div>
						<button style="cursor: pointer;" type="submit" name="eklentiduzenle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Güncelle</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<?php include 'footer.php'; ?>
