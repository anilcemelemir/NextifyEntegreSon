<?php

//say
$yenisor=$db->prepare("SELECT * from destek where destek_uye=:destek_uye order by destek_tarih DESC Limit 7");
$yenisor->execute(array(
	'destek_uye' => $userprint['uye_id']
));

$yenisay=$db->prepare("SELECT * from destek where destek_uye=:destek_uye and destek_uyeoku='0'");
$yenisay->execute(array(
	'destek_uye' => $userprint['uye_id']
));

$yeni=$yenisay->RowCount();

// KULLANİCı ADI HAZIRLA
$user_name = isset($_SESSION['uye_ad']) ? $_SESSION['uye_ad'] : 'Kullanıcı';

?>
<!-- ============================================================== -->
<!-- 						Topbar Start 							-->
<!-- ============================================================== -->
<div class="top-bar light-top-bar">
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<a class="admin-logo" href="index.php">
					<h1>
						<?php if ($userprint['uye_resim']=='0') {
							?> 
							<img alt="" class="logo-icon margin-r-10" src="../admin/assets/img/genel/user.png" width="30">
						<?php } else { ?> 
							<img alt="" class="logo-icon margin-r-10" src="../<?php echo $userprint['uye_resim']; ?>" width="30"> <?php } ?>
						</h1>
					</a>
					<div class="left-nav-toggle" >
						<a  href="#" class="nav-collapse"><i class="fa fa-bars"></i></a>
					</div>
					<div class="left-nav-collapsed" >
						<a  href="#" class="nav-collapsed"><i class="fa fa-bars"></i></a>
					</div>
				</div>
				<div class="col">
					<ul class="list-inline top-right-nav">
						<!-- KULLANİCı ADI GÖSTERME -->
						<li style="margin-right: 20px; padding-top: 8px;">
							<span style="color: #333; font-weight: 500; font-size: 13px;">
								Hoş geldiniz: <br> <strong style="color: #007bff;font-size: 15px;"><?php echo htmlspecialchars($user_name); ?></strong>
							</span>
						</li>
						<li class="dropdown icon-dropdown d-none-m">
							<a href="destekler"><i class="icon-earphones-alt"></i> <span class="badge badge-danger"><?php echo $yeni; ?></span></a>
						</li>
						<li class="dropdown icon-dropdown d-none-m">
							<a href="guvenli-cikis"><i class="icon-logout"></i></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!--                        Topbar End                              -->
	<!-- ============================================================== -->

