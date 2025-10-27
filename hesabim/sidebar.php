<?php 
$link = $_SERVER['REQUEST_URI'];
?>
<div class="main-sidebar-nav default-navigation">
	<div class="nano">
		<div class="nano-content sidebar-nav">
			<ul class="metisMenu nav flex-column" id="menu">
				<li class="nav-heading">
					<b>Menü</b>			
				</li>
				<li class="nav-item <?php if (strstr($link, "index.php")) { echo "active";} ?>"><a class="nav-link" href="<?php echo $settingsprint['ayar_siteurl']; ?>hesabim"><i class="icon-home"></i> <span class="toggle-none">Panel Anasayfa </a></li>	

					<li class="nav-item"><a class="nav-link" href="<?php echo $settingsprint['ayar_siteurl']; ?>"><i class="icon-globe"></i> <span class="toggle-none">Site Anasayfa </a></li>

						<li class="nav-item <?php if (strstr($link, "siparis")) { echo "active";} ?>"><a class="nav-link" href="siparisler"><i class="icon-basket-loaded"></i> <span class="toggle-none">Siparişlerim </a></li>


							<li class="nav-item <?php if (strstr($link, "destek")) { echo "active";} ?><?php if (strstr($link, "bilgi")) { echo "active";} ?>">
								<a class="nav-link" href="" aria-expanded="true"><i class="icon-earphones-alt"></i> <span class="toggle-none">Destek İşlemeri<span style="float: right;" class="fa fa-angle-down"></span></span></a>
								<ul class="nav-second-level nav flex-column sub-menu" aria-expanded="true">
									<li class="nav-item"><a class="nav-link" href="yeni-destek">Destek Bileti Oluştur</a></li>
									<li class="nav-item"><a class="nav-link" href="destekler">Destek Biletleri</a></li>
								</ul>
							</li>

							<li class="nav-item <?php if (strstr($link, "hesap")) { echo "active";} ?><?php if (strstr($link, "sifre")) { echo "active";} ?>">
								<a class="nav-link" href="" aria-expanded="true"><i class="icon-user-following"></i> <span class="toggle-none">Hesap İşlemeri<span style="float: right;" class="fa fa-angle-down"></span></span></a>
								<ul class="nav-second-level nav flex-column sub-menu" aria-expanded="true">
									<li class="nav-item"><a class="nav-link" href="hesap-ayarlari">Hesap Ayarları</a></li>
									<li class="nav-item"><a class="nav-link" href="yeni-sifre">Şifre Değiştir</a></li>
								</ul>
							</li>
							<li  class="nav-item <?php if (strstr($link, "randevu")) { echo "active";} ?>"><a class="nav-link" href="guvenli-cikis"><i class="icon-logout"></i> <span class="toggle-none">Güvenli Çıkış</a></li>
							</ul>
						</div>
					</div>
				</div>
