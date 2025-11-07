<?php  
ob_start();
session_start();

$sayim = @$_SESSION['urunler']; 

// Oturum kontrol et - daha güvenli ve açık
$logged_in = false;
$user_name = '';

// Debug: Hangi sayfa çağrıldığını bilmek için
// echo "<!-- Logged in check: uye_mail = " . (isset($_SESSION['uye_mail']) ? $_SESSION['uye_mail'] : 'NOT SET') . " -->";

if(isset($_SESSION['uye_mail']) && !empty($_SESSION['uye_mail'])) {
    $logged_in = true;
    $user_name = isset($_SESSION['uye_ad']) ? trim($_SESSION['uye_ad']) : '';
}
?>
<title><?php echo $meta['title'] ?></title>
<meta name="description" content="<?php echo $meta['description'] ?>" />
<meta name="keywords" content="<?php echo $meta['keywords'] ?>" />
</head>

<body class="single-product woocommerce-cart woocommerce-page woocommerce">
    <div id="page" class="site">
        <header id="site-header" class="site-header header-style-2 header-fullwidth sticky-header">
            <div class="header-topbar">
                <div class="octf-area-wrap">
                    <div class="container-fluid">
                        <ul class="social-list">
                            <?php while($socialprint=$social->fetch(PDO::FETCH_ASSOC)) { ?>
                            <li><a target="_blank" href="<?php echo $socialprint['sosyal_link']; ?>"><i class="fab <?php echo $socialprint['sosyal_icon']; ?>"></i></a></li>
                            <?php } ?>
                        </ul>
                        <ul class="topbar-info clearfix">
                            <li><i class="fas fa-headset"></i> <a href="tel:<?php echo $settingsprint['ayar_tel']; ?>"><?php echo $settingsprint['ayar_tel']; ?></a></li>
                            <li><i class="fas fa-mail-bulk"></i> <a href="mailto:<?php echo $settingsprint['ayar_mail']; ?>"><?php echo $settingsprint['ayar_mail']; ?></a></li>
                        </ul>
                        <!-- contact info close -->
                    </div>
                </div>
            </div>
            <!-- Main Header start -->
            <div class="octf-main-header">
                <div class="octf-area-wrap">
                    <div class="container-fluid octf-mainbar-container">
                        <div class="octf-mainbar">
                            <div class="octf-mainbar-row octf-row">
                                <!-- logo start -->
                                <div class="octf-col">
                                    <div id="site-logo" class="site-logo">
                                        <a href="<?php echo $settingsprint['ayar_siteurl']; ?>">
                                            <img class="logo-static" src="admin/<?php echo $settingsprint['ayar_logo']; ?>" alt="logo">
                                            <img class="logo-scroll" src="admin/<?php echo $settingsprint['ayar_logo']; ?>" alt="logo">
                                        </a>
                                    </div>
                                </div>
                                <!-- logo end -->
                                <!-- nav start -->
                                <div class="octf-col">
                                    <nav id="site-navigation" class="main-navigation">
                                        <ul id="primary-menu" class="menu">
                                            <?php
                                            $menulist = $db->prepare( "SELECT * from omenu where omenu_ust=0 order by omenu_sira ASC" );
                                            $menulist->execute();
                                            foreach ( $menulist as $row ) {
                                                $ust       = $row[ 'omenu_id' ];
                                                $ustdurum  = $row[ 'omenu_durum' ];
                                                $menuliste = $db->prepare( "SELECT * from omenu where omenu_ust=$ust order by omenu_sira ASC" );
                                                $menuliste->execute();
                                                ?>
                                            <?php if ( $ustdurum <= 0 ) { ?>
                                            <li class="menu-item">
                                                <?php } else { ?>
                                            <li class="menu-item-has-children">
                                                <?php } ?>
                                                <a href="<?php echo $row[ 'omenu_link' ]; ?>"><?php echo strip_tags($row[ 'omenu_ad' ]); ?></a>
                                                <?php if ( $ustdurum <= 0 ) { } else { ?>
                                                <ul class="sub-menu">
                                                    <?php } ?>
                                                    <?php foreach ( $menuliste as $key ) { ?>
                                                    <li><a href="<?php echo $key[ 'omenu_link' ]; ?>"><?php echo strip_tags($key[ 'omenu_ad' ]); ?></a></li>
                                                    <?php } if ( $ustdurum <= 0 ) { } else { ?>
                                                </ul> <?php } ?>
                                            </li>
                                            <?php } ?>
                                        </ul>
                                    </nav><!-- #site-navigation -->
                                </div>
                                <!-- nav end -->
                                <div class="octf-col text-right">
                                    <!-- Call To Action -->
                                    <div class="octf-btn-cta">
                                        <div class="octf-header-module cart-btn-hover">
                                            <div class="h-cart-btn octf-cta-icons">
                                                <a class="cart-contents" href="sepet" title="Sepetime Git"><i class="flaticon-supermarket"></i>
                                                    <span class="count"><?php @$rakam = count( $sayim ); echo @$rakam; ?></span>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="octf-header-module cart-btn-hover">
                                            <div class="h-cart-btn octf-cta-icons">
                                                <a class="cart-contents" href="hesabim" title="Hesabima Git">
                                                    <i style="color: #000000ff;" class="far fa-user"></i>
                                                    <?php if($logged_in && !empty($user_name)): ?>
                                                        <span style="margin-left: 8px; color: #CCE63C; font-size: 17px; display: inline-block;">
                                                            <?php echo htmlspecialchars($user_name); ?>
                                                        </span>
                                                    <?php else: ?>
                                                        <span style="margin-left: 8px; color: #CCE63C; font-size: 15px; display: inline-block;">
                                                            Giriş Yap / <b>Üye Ol </b>
                                                        </span>
                                                    <?php endif; ?>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header mobile -->
            <div class="header_mobile">
                <div class="container">
                    <div class="mlogo_wrapper clearfix">
                        <!-- logo mobile start -->
                        <div class="mobile_logo">
                            <a href="<?php echo $settingsprint['ayar_siteurl']; ?>"><img src="admin/<?php echo $settingsprint['ayar_logo']; ?>" alt="logo"></a>
                        </div>
                        <!-- logo mobile end -->
                        <!-- cart mobile start -->
                        <div class="octf-btn-cta">
                            <div class="octf-header-module cart-btn-hover">
                                <div class="h-cart-btn octf-cta-icons">
                                    <a class="cart-contents" href="sepet" title="Sepete Git"><i class="flaticon-supermarket"></i>
                                        <span class="count"><?php @$rakam = count( $sayim ); echo @$rakam; ?></span>
                                    </a>
                                    <a class="cart-contents" href="hesabim" title="Hesabima Git">
    <i style="color: #fff;" class="far fa-user"></i>
    <?php if($logged_in): ?>
        <span style="margin-left: 8px; color: #fff; font-size: 12px; display: inline-block;">
            <?php echo htmlspecialchars($user_name); ?>
        </span>
    <?php else: ?>
        <span style="margin-left: 8px; color: #fff; font-size: 12px; display: inline-block;">
            Giriş Yap
        </span>
    <?php endif; ?>
</a>
                                </div>
                            </div>
                        </div>
                        <!-- cart mobile end -->
                        <div id="mmenu_toggle">
                            <button></button>
                        </div>
                    </div>
                    <!-- nav mobile start -->
                    <div class="mmenu_wrapper">
                        <div class="mobile_nav">
                            <ul id="menu-main-menu" class="mobile_mainmenu">
                                <?php
                                $menulist = $db->prepare( "SELECT * from omenu where omenu_ust=0 order by omenu_sira ASC" );
                                $menulist->execute();
                                foreach ( $menulist as $row ) {
                                    $ust       = $row[ 'omenu_id' ];
                                    $ustdurum  = $row[ 'omenu_durum' ];
                                    $menuliste = $db->prepare( "SELECT * from omenu where omenu_ust=$ust order by omenu_sira ASC" );
                                    $menuliste->execute();
                                    ?>
                                <?php if ( $ustdurum <= 0 ) { ?>
                                <li class="menu-item">
                                    <?php } else { ?>
                                <li class="menu-item-has-children">
                                    <?php } ?>
                                    <a href="<?php echo $row[ 'omenu_link' ]; ?>"><?php echo strip_tags($row[ 'omenu_ad' ]); ?></a>
                                    <?php if ( $ustdurum <= 0 ) { } else { ?>
                                    <ul class="sub-menu">
                                        <?php } ?>
                                        <?php foreach ( $menuliste as $key ) { ?>
                                        <li><a href="<?php echo $key[ 'omenu_link' ]; ?>"><?php echo strip_tags($key[ 'omenu_ad' ]); ?></a></li>
                                        <?php } if ( $ustdurum <= 0 ) { } else { ?>
                                    </ul> <?php } ?>
                                </li>
                                <?php } ?>
                            </ul>
                        </div>
                    </div>
                    <!-- nav mobile end -->
                </div>
            </div>
        </header>
        <div id="content" class="site-content">