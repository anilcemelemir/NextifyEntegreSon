<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
$kategoriedit=$db->prepare("SELECT * from kategoriproje where kategori_id=:kategori_id");
$kategoriedit->execute(array(
	'kategori_id' => $_GET['kategori_id']
));
$kategoriwrite=$kategoriedit->fetch(PDO::FETCH_ASSOC);

?>		
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">
	<div class="page-header">
		<h2>Kategori İşlemleri</h2>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-heading card-default">
					<div class="pull-right mt-10">
						<a href="proje-kategori.php" class="btn btn-warning btn-icon"><i class="fa fa-reply"></i>Geri Dön</a>
					</div>
					Kategori Düzenle
				</div>
				<div class="card-block">

					<form method="POST" action="controller/function.php" class="form-horizontal">
						<div class="form-group">
							<input type="hidden" name="kategori_id" value="<?php echo $kategoriwrite['kategori_id']; ?>">
							<input type="hidden" name="kategori_title" value="1">
							<input type="hidden" name="kategori_descr" value="1">
							<input type="hidden" name="kategori_keyword" value="1">
						</div>
						<div class="form-group">
							<label>Kategori Adı</label>
							<input type="text" name="kategori_ad" value="<?php echo $kategoriwrite['kategori_ad']; ?>" class="form-control">
						</div>
						<div class="form-group">
							<label>Vitrinde Göster</label>
							<select name="vitrin" class="form-control m-b">
								<?php if ($kategoriwrite['vitrin']==1) { ?>
									<option value="1">Göster</option>
									<option value="0">Gizle</option>
									<?php
								} else {?>
									<option value="0">Gizle</option>
									<option value="1">Göster</option>
								<?php }?>
							</select>
							<small class="text-muted">Ana sayfada gösterilecektir</small>
						</div>	
						<div class="form-group">
							<label>Kategori Sıra</label>
							<input type="text" name="kategori_sira" value="<?php echo $kategoriwrite['kategori_sira']; ?>" class="form-control">
						</div>
						<button style="cursor: pointer;" type="submit" name="projekategoriduzenle" class="btn btn-success btn-icon"><i class="fa fa-floppy-o "></i>Güncelle</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<?php include 'footer.php'; ?>
