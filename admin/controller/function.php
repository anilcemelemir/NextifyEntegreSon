<?php
ob_start();
session_start();
include 'config.php';
date_default_timezone_set( 'Europe/Istanbul' );
$linkApi=$db->prepare("SELECT * from ayar where ayar_id=0");
$linkApi->execute(array());
$linkApi=$linkApi->fetch(PDO::FETCH_ASSOC); 
if (isset($_SESSION['uye_mail'])) {
	$user=$db->prepare("SELECT * from uye where uye_mail=:uye_mail");
	$user->execute(array(
		'uye_mail' => $_SESSION['uye_mail']
	));
	$userprint=$user->fetch(PDO::FETCH_ASSOC);
}
if ( isset( $_POST[ 'login' ] ) )
{
	$kullanici_adi  = htmlspecialchars( trim( $_POST[ 'kullanici_adi' ] ) );
	$kullanici_pass = htmlspecialchars( trim( md5( $_POST[ 'kullanici_pass' ] ) ) );
	if ( $kullanici_adi && $kullanici_pass )
	{
		$kullanicisor = $db->prepare( "SELECT * from kullanici where kullanici_adi=:adi and kullanici_pass=:pass" );
		$kullanicisor->execute(
			array(
				'adi'  => $kullanici_adi,
				'pass' => $kullanici_pass
			)
		);
		$say = $kullanicisor->rowCount();
		if ( $say > 0 )
		{
			$_SESSION[ 'kullanici_adi' ] = $kullanici_adi;
			if ($_SESSION['sonlink']) {
				$link = $_SESSION['sonlink'];
				header( "Location:$link?status=ok" );
				unset($_SESSION['sonlink']);
			} else {
				header( 'Location:../index.php?status=ok' );
			}
		}
		else
		{
			header( 'Location:../login.php?status=no' );
		}
	}
}
if ( isset( $_POST[ 'uyegiris' ] ) )
{
	$captcha = $_POST['g-recaptcha-response'];
	if (!$captcha) {
		header( 'Location:../../hesabim/uye-girisi?captcha=no' );
		exit;
	}
	$secretKey = $linkApi['rgizlianahtar'];
	$ip = GetIP();
	$response = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=".$secretKey."&response=".$captcha."&remoteip=".$ip);
	$responseKeys = json_decode($response,true);
	$uye_eposta = htmlspecialchars( trim($_POST[ 'uye_mail' ]));
	$uye_sifre  = htmlspecialchars( trim( md5( $_POST[ 'uye_sifre' ] )));
	if ( $uye_eposta && $uye_sifre )
	{
		$uyesor = $db->prepare( "SELECT * from uye where uye_mail=:eposta and uye_sifre=:sifre" );
		$uyesor->execute(
			array(
				'eposta' => $uye_eposta,
				'sifre'  => $uye_sifre
			)
		);
		$uyesorprint = $uyesor->fetch( PDO::FETCH_ASSOC );
		$say = $uyesor->rowCount();
		if ( $say > 0 )
		{
			// SESSION VERİLERİNİ KAYDET
			$_SESSION[ 'uye_id' ]    = $uyesorprint[ 'uye_id' ];
			$_SESSION[ 'uye_mail' ]  = $uyesorprint[ 'uye_mail' ];
			$_SESSION[ 'uye_ad' ]    = trim($uyesorprint[ 'uye_ad' ]) . ' ' . trim($uyesorprint[ 'uye_soyad' ]);
			
			// SONRA REDIRECT YAP (session_write_close kullanma)
			// Ana sayfaya yönlendir
			header( 'Location:../../index.php?status=ok' );
			exit;
		}
		else
		{
			header( 'Location:../../hesabim/uye-girisi?status=no' );
			exit;
		}
	}
}
if (isset($_POST['sifirla'])) {
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$captcha = $_POST['g-recaptcha-response'];
	if (!$captcha) {
		header( 'Location:../../hesabim/sifremi-unuttum?captcha=no' );
		exit;
	}
	$secretKey = $linkApi['rgizlianahtar'];
	$ip = GetIP();
	$response = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=".$secretKey."&response=".$captcha."&remoteip=".$ip);
	$responseKeys = json_decode($response,true);
	$MailSecure = htmlspecialchars(trim($_POST['uye_mail']));
	$uyemailkontrol = $db->prepare( "SELECT * from uye where uye_mail=?" );
	$uyemailkontrol->execute(
		array(
			$MailSecure
		)
	);
	$uyemailprint = $uyemailkontrol->fetch( PDO::FETCH_ASSOC );
	if ($uyemailkontrol->rowCount()==0) {
		header( 'Location:../../hesabim/sifremi-unuttum?uye=no' );
		exit;
	}
	$baslangicMail     = strtotime($uyemailprint['uye_mailsure']);
	$bitisMail         = strtotime(date('Y-m-d H:i:s'));
	$farkMail        = abs($bitisMail-$baslangicMail);
	$toplantiSureMail= floor($farkMail/60);
	$kalanSureMail=  '20' - $toplantiSureMail;
	if ($toplantiSureMail<=20) {
		header( 'Location:../../hesabim/sifremi-unuttum?sure=ok' );
		exit; 
	} else {
		$eposta = $uyemailprint['uye_mail'];
		$NewPass = substr(md5(date('Y-m-d H:i:s')), 0, 6);
		$NewPassMd5 = md5($NewPass);
		$ayarkaydet = $db->prepare(
			"UPDATE uye SET
			uye_sifre=:pass,
			uye_mailsure=:sure
			WHERE uye_id={$uyemailprint['uye_id']}"
		);
		$update     = $ayarkaydet->execute(
			array(
				'pass'     => $NewPassMd5,
				'sure'     => date('Y-m-d H:i:s')
			)
		);
		if ($onaymail==0) {
			$devam = "<br> Yeni Giriş Bilgileri ; <br> <br>Mail: <b>".$eposta."</b><br>Şifre: <b>".$NewPass."</b><br>";
		}
		$mesaj = "Merhaba sayın ".$uyemailprint[ 'uye_ad' ]." ".$uyemailprint[ 'uye_soyad' ]." <br> <br> web sitemiz üzerinden şifre sıfırlama talebi gönderilmiştir! Bu işlemi siz yapmadıysanız hemen giriş bilgilerinizi üyelik panelinizden değiştirerek daha güvenli bir şifre oluşturunuz. <br><br> Talebiniz üzerine yeni bilgileriniz aşağıdaki gibidir. <br>".$devam;
		mailsend($uyemailprint[ 'uye_mail' ],' Sifre Hatirlatma!',$mesaj);
		header( 'Location:../../hesabim/uye-girisi?status=ok' );
		exit; 
	} 
}
if ( isset( $_POST[ 'siparisver' ] ) )
{
	if (!isset($_SESSION['uye_mail'])) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$captcha = $_POST['g-recaptcha-response'];
	if (!$captcha) {
		header( "Location:../../hesabim/satin-al?captcha=no" );
		exit;
	}
	$secretKey = $linkApi['rgizlianahtar'];
	$ip = GetIP();
	$response = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=".$secretKey."&response=".$captcha."&remoteip=".$ip);
	$responseKeys = json_decode($response,true);
	$uye_id    		  = htmlspecialchars( trim( $userprint['uye_id'] ) );
	$siparis_fiyatlar    = htmlspecialchars( trim( $_POST['siparis_fiyat'] ) );
	$siparis_odeme    = htmlspecialchars( trim( $_POST['siparis_odeme'] ) );
	$fiyat = explode("-", $siparis_fiyatlar);
	$siparis_fiyat = $fiyat[0]; // KDV li fiyat genel toplam
	$siparis_fiyat_kdvsiz = $fiyat[1]; // KDV siz fiyat genel toplam
	$kaydet = $db->prepare(
		"INSERT INTO siparis SET
		siparis_ad=:ad,
		siparis_fiyat=:fiyat,
		siparis_fiyat_kdvsiz=:kdvsiz,
		siparis_odeme=:odeme,
		siparis_durum=:durum"
	);
	$insert = $kaydet->execute(
		array(
			'ad'    => $uye_id,
			'fiyat' => $siparis_fiyat,
			'kdvsiz' => $siparis_fiyat_kdvsiz,
			'odeme' => $siparis_odeme,
			'durum' => 1 // sipariş onaylanmadı 1 || sipariş onaylandı 0
		)
	);
	if ( $insert )
	{
		$siparissor = $db->prepare( "SELECT * from siparis order by siparis_tarih DESC limit 1" );
		$siparissor->execute( array( 0 ) );
		$sipariscek = $siparissor->fetch( PDO::FETCH_ASSOC );
		$no = $sipariscek[ 'siparis_id' ];
		$urunler = $_SESSION[ 'urunler' ];
		foreach ( $urunler as $urun )
		{
			$uruneditdz=$db->prepare("SELECT * from urunler where urun_id=:urun_id");
			$uruneditdz->execute(array(
				'urun_id' => $urun[ 'id' ]
			));
			$urundzwrite=$uruneditdz->fetch(PDO::FETCH_ASSOC);
			if ($urundzwrite[ 'link' ]) {
				$ozelBilgi = $urundzwrite[ 'link' ];
			} else {
				$ozelBilgi = "";
			}
			$ayarkaydet = $db->prepare(
				"INSERT INTO surun SET
				surun_siparis   =:siparis,
				surun_urun  =:urun,
				surun_fiyat  =:fiyat,
				surun_adet   =:adet
				"
			);
			$update     = $ayarkaydet->execute(
				array(
					'siparis' => $no,
					'urun'    => $urun[ 'urun' ],
					'fiyat'   => $urun[ 'fiyat' ],
					'adet'    => $ozelBilgi
				)
			);
		}
		unset( $_SESSION[ 'urunler' ] ); 
		$settings=$db->prepare("SELECT * from ayar where ayar_id=?");
		$settings->execute(array(0));
		$settingsprint=$settings->fetch(PDO::FETCH_ASSOC);
		$idmesaj = $db->lastInsertId();
		$mesajAdmin = "Merhaba sayın yönetici web sitesi üzerinden ".$userprint[ 'uye_ad' ]." ".$userprint[ 'uye_soyad' ]." isimli üye tarafından [".$no."] id li sipariş oluşturulmuştur. <br> <b>Sipariş Fiyatı:</b> <br>".$siparis_fiyat."TL<br> <b>Ödeme Yöntemi:</b> <br>".$siparis_odeme;
		$mesaj = "Merhaba sayın ".$userprint[ 'uye_ad' ]." ".$userprint[ 'uye_soyad' ]." <br> web sitemiz üzerinden [".$no."] id li siparişiniz kaydedilmiştir. Bizi tercih ettiğiniz için teşekkür ederiz.";
		$mailAdres = $settingsprint['ayar_mail'];
		mailsend($mailAdres,'[Yonetici] Siparis Olusturuldu!',$mesajAdmin);
		mailsend($userprint[ 'uye_mail' ],' Siparisiniz Olusturulmustur!',$mesaj);
		if ( $_POST[ 'siparis_odeme' ] == 'Havale ile Öde' ) { 
			Header( "Location:../../banka-hesaplarimiz?status=ok" );
		} elseif ( $_POST[ 'siparis_odeme' ] == 'Kredi Kartı' ) {
			Header( "Location:../../hesabim/credi?siparis=$no" );
		} else {				
			Header( "Location:../../hesabim/siparisler?status=ok" );
		}
	} else {
		Header( "Location:../../hesabim/satin-al?status=no" );
	}
}
if ( isset( $_POST[ 'uyekayit' ] ) )
{
	$captcha = $_POST['g-recaptcha-response'];
	if (!$captcha) {
		header( 'Location:../../hesabim/uye-ol?captcha=no' );
		exit;
	}
	if ($DemCont==1) {
	$_SESSION['status']="demo";
	$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$secretKey = $linkApi['rgizlianahtar'];
	$ip = GetIP();
	$response = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=".$secretKey."&response=".$captcha."&remoteip=".$ip);
	$responseKeys = json_decode($response,true);
	$uye_ad    = htmlspecialchars( trim( $_POST[ 'uye_ad' ] ) );
	$uye_soyad = htmlspecialchars( trim( $_POST[ 'uye_soyad' ] ) );
	$uye_mail  = htmlspecialchars( trim( $_POST[ 'uye_mail' ] ) );
	$uye_tel   = htmlspecialchars( trim( $_POST[ 'uye_tel' ] ) );
	$uyekontrol = $db->prepare( "SELECT * from uye WHERE uye_mail =:uyeposta " );
	$uyekontrol->execute(
		array(
			'uyeposta' => $uye_mail
		)
	);
	$say = $uyekontrol->rowCount();
	if ( $say >= 1 )
	{
		Header( "Location:../../hesabim/uye-ol?mail=no" );
		exit;
	}
	if ( $_POST[ 'uye_sifre' ] != $_POST[ "uye_sifre_onay" ] )
	{
		Header( "Location:../../hesabim/uye-ol?sifre=no" );
		exit;
	}
	$uye_sifre      = md5( $_POST[ 'uye_sifre' ] );
	$kod            = md5( rand( 0, 9999999999 ) );
	$uye_sifre_onay = $_POST[ "uye_sifre_onay" ];
	$uye_limit      = $_POST[ "uye_limit" ];
	$mailonay       = $benzersizsayi4 = rand( 20000, 32000 );
	$smsonay        = $benzersizsayi4 = rand( 20000, 32000 );
	$widget = $db->prepare( "SELECT * from widget" );
	$widget->execute( array( 0 ) );
	$widgetprint = $widget->fetch( PDO::FETCH_ASSOC );
	if ( $widgetprint[ 'widget_onaymail' ] == 1 )
	{
		$onaymail = 0;
	}
	else
	{
		$onaymail = 1;
	}
	if ( $widgetprint[ 'widget_onaytel' ] == 1 )
	{
		$onaytel = 0;
	}
	else
	{
		$onaytel = 1;
	}
	$ayarkaydet = $db->prepare(
		"INSERT INTO uye SET
		uye_ad=:ad,
		uye_soyad=:soyad,
		uye_mail=:eposta,
		uye_tel=:tel,
		uye_kod=:kod,
		uye_kodtel=:kodtel,
		uye_kodmail=:kodmail,
		uye_onaymail=:onaymail,
		uye_onaytel=:onaytel,
		uye_sifre=:sifre"
	);
	$update     = $ayarkaydet->execute(
		array(
			'ad'       => $uye_ad,
			'soyad'    => $uye_soyad,
			'eposta'   => $uye_mail,
			'tel'      => $uye_tel,
			'kod'      => $kod,
			'kodtel'   => $smsonay,
			'onaytel'  => $onaytel,
			'onaymail' => $onaymail,
			'kodmail'  => $mailonay,
			'sifre'    => $uye_sifre
		)
	);
	if ( $update )
	{
		$userxs=$db->prepare("SELECT * from uye where uye_mail=:uye_mail");
		$userxs->execute(array(
			'uye_mail' => $uye_mail
		));
		$userxsprint=$userxs->fetch(PDO::FETCH_ASSOC);
		if ($onaymail==0) {
			$devam = "<br> Üyeliğinizi onaylamak için lütfen bu kodu giriniz; <br> <br><b>".$mailonay."</b><br>";
		}
		$mesaj = "Merhaba sayın ".$userxsprint[ 'uye_ad' ]." ".$userxsprint[ 'uye_soyad' ]." <br> web sitemize hoşgeldiniz! Üyelik panelinize erişerek üyelerimize özel avantajlardan hemen yararlanmaya başlayabilirsiniz. <br>".$devam;
		mailsend($userxsprint[ 'uye_mail' ],' Aramiza Hosgeldiniz!',$mesaj);
		Header( "Location:../../hesabim/uye-girisi?uye=ok" );
	}
	else
	{
		Header( "Location:../../hesabim/uye-ol?status=no" );
	}
}
if ( isset( $_POST[ 'destekkapatad' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE destek SET
		destek_durum=:durum
		WHERE destek_id={$_POST['id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'durum'     => '0'
		)
	);
	$destek=$_POST['id'];
	if ( $update )
	{
		Header( "Location:../destek-oku.php?destek_id=$destek&status=ok" );
	}
	else
	{
		Header( "Location:../destek-oku.php?destek_id=$destek&status=no" );
	}
}
if ( isset( $_POST[ 'destekatad' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	if ( $_FILES[ 'destekmesaj_resim' ][ "size" ] > 0 )
	{ 
		$uploads_dir = '../assets/img/destek';
		@$tmp_name = $_FILES[ 'destekmesaj_resim' ][ "tmp_name" ];
		$benzersizsayi1 = rand( 20000, 32000 );
		$benzersizsayi2 = rand( 20000, 32000 );
		$uzanti='.jpg';
		$benzersizad    = $benzersizsayi1 . $benzersizsayi2;
		$refimgyol      = substr( $uploads_dir,  3) . "/" . $benzersizad . $uzanti;
		@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizad$uzanti" );
		$kaydet = $db->prepare(
			"INSERT INTO destekmesaj SET
			destekmesaj_kim=:ad,
			destekmesaj_destek=:tel,
			destekmesaj_aciklama=:hizmet,
			destekmesaj_resim=:not");
		$insert = $kaydet->execute(
			array(
				'ad' => $_POST[ 'destekmesaj_kim' ],
				'tel' => $_POST[ 'destekmesaj_destek' ],
				'hizmet' => $_POST[ 'destekmesaj_aciklama' ],
				'not' => $refimgyol
			));
		$destek=$_POST['destekmesaj_destek'];
		if ( $insert )
		{
			$ayarkaydet = $db->prepare(
				"UPDATE destek SET
				destek_uyeoku=:durum
				WHERE destek_id={$_POST['destekmesaj_destek']}"
			);
			$update     = $ayarkaydet->execute(
				array(
					'durum'     => '0'
				)
			);
			$idmesaj = $db->lastInsertId();
			$destekxs=$db->prepare("SELECT * from destek where uye_mail=:uye_mail");
			$destekxs->execute(array(
				'uye_mail' => $destek
			));
			$destekxsprnt=$destekxs->fetch(PDO::FETCH_ASSOC);
			$userxs=$db->prepare("SELECT * from uye where uye_id=:uye_mail");
			$userxs->execute(array(
				'uye_mail' => $destekxsprnt['uye_mail']
			));
			$userxsprint=$userxs->fetch(PDO::FETCH_ASSOC);
			$mesaj = "Merhaba sayın ".$userxsprint[ 'uye_ad' ]." ".$userxsprint[ 'uye_soyad' ]." <br> web sitemiz üzerinden [".$destek."] id nolu destek talebiniz cevaplanmıştır. Detayları üye panelinizden inceleyebilirisiniz.";
			mailsend($userxsprint[ 'uye_mail' ],' Destek Cevaplanmistir!',$mesaj);
			echo $mesaj;
			exit;
			Header( "Location:../destek-oku.php?destek_id=$destek&status=ok" );
		}
		else
		{
			Header( "Location:../destek-oku.php?destek_id=$destek&status=no" );
		}
	} else {
		$kaydet = $db->prepare(
			"INSERT INTO destekmesaj SET
			destekmesaj_kim=:ad,
			destekmesaj_destek=:tel,
			destekmesaj_aciklama=:hizmet");
		$insert = $kaydet->execute(
			array(
				'ad' => $_POST[ 'destekmesaj_kim' ],
				'tel' => $_POST[ 'destekmesaj_destek' ],
				'hizmet' => $_POST[ 'destekmesaj_aciklama' ]
			));
		$destek=$_POST['destekmesaj_destek'];
		if ( $insert )
		{
			$ayarkaydet = $db->prepare(
				"UPDATE destek SET
				destek_uyeoku=:uyeoku,
				destek_durum=:durum
				WHERE destek_id={$_POST['destekmesaj_destek']}"
			);
			$update     = $ayarkaydet->execute(
				array(
					'uyeoku'     => '0',
					'durum'     => '1'
				)
			);
			$destekxs=$db->prepare("SELECT * from destek where destek_id=:destek");
			$destekxs->execute(array(
				'destek' => $destek
			));
			$destekxsprnt=$destekxs->fetch(PDO::FETCH_ASSOC);
			$userxs=$db->prepare("SELECT * from uye where uye_id=:uye_id");
			$userxs->execute(array(
				'uye_id' => $destekxsprnt['destek_uye']
			));
			$userxsprint=$userxs->fetch(PDO::FETCH_ASSOC);
			$mesaj = "Merhaba sayın ".$userxsprint[ 'uye_ad' ]." ".$userxsprint[ 'uye_soyad' ]." <br> web sitemiz üzerinden [".$destek."] id nolu destek talebiniz cevaplanmıştır. Detayları üye panelinizden inceleyebilirsiniz.";
			mailsend($userxsprint[ 'uye_mail' ],' Destek Cevaplanmistir!',$mesaj);
			Header( "Location:../destek-oku.php?destek_id=$destek&status=ok" );
		}
		else
		{
			Header( "Location:../destek-oku.php?destek_id=$destek&status=no" );
		}
	}
}
if ( isset( $_POST[ 'sepetle' ] ) )
{
	ob_start();
	session_start();
	$update = array(
		'id'    => $_POST[ 'urun_id' ],
		'paket' => $_POST[ 'urun_paket' ],
		'urun'  => $_POST[ 'urun_adi' ],
		'adet'  => $_POST[ 'urun_adet' ],
		'fiyat' => $_POST[ 'urun_fiyat' ],
		'abone_tur' => $_POST[ 'abone_tur' ] // Aylık/Yıllık bilgisi
	);
	$_SESSION[ 'urunler' ][] = $update;
	if ( $update )
	{
		Header( "Location:../../sepet" );
	}
	else
	{
		Header( "Location:../../sepet" );
	}
}
if ( isset( $_POST[ 'sepetbosalt' ] ) )
{
	unset( $_SESSION[ 'urunler' ] );
	if ( $update )
	{
		Header( "Location:../../sepet" );
	}
	else
	{
		Header( "Location:../../sepet" );
	}
}
if ( isset( $_POST[ 'odemedevam' ] ) )
{
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	if (!isset($_SESSION['uye_mail'])) {
		exit;
	}
	$siparis_id      = htmlspecialchars(strip_tags(trim($_POST[ 'siparis_id' ])));
	$siparis_odeme      = $_POST[ 'siparis_odeme' ];
	if ($_POST[ 'siparis_odeme' ]== "Havale") {
		$ayarkaydet = $db->prepare(
			"INSERT INTO odemebildirim SET
			siparis=:siparis
			"
		);
		$update     = $ayarkaydet->execute(
			array(
				'siparis'     =>$siparis_id
			));
		if ( $update )
		{
			Header( "Location:../../hesabim/siparis-detay?siparis_id=$siparis_id&status=ok" );
		}
		else
		{
			Header( "Location:../../hesabim/siparis-detay?siparis_id=$siparis_id&status=no" );
		}
	} else {
		Header( "Location:../../hesabim/credi?ode=ok&siparis=$siparis_id" );
	}
	
}
if ( isset( $_POST[ 'uyesifre' ] ) )
{
	if (!isset($_SESSION['uye_mail'])) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$captcha = $_POST['g-recaptcha-response'];
	if (!$captcha) {
		header( "Location:../../hesabim/yeni-sifre?captcha=no" );
		exit;
	}
	$secretKey = $linkApi['rgizlianahtar'];
	$ip = GetIP();
	$response = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=".$secretKey."&response=".$captcha."&remoteip=".$ip);
	$responseKeys = json_decode($response,true);
	$uye_esifre      = md5( $_POST[ 'uye_esifre' ] );
	$uye_ysifre      = $userprint['uye_sifre'] ;
	if ( $uye_esifre  != $uye_ysifre )
	{
		Header( "Location:../../hesabim/yeni-sifre?status=no" );
		exit;
	}
	if ( $_POST[ 'uye_sifre' ] != $_POST[ "uye_sifre_onay" ] )
	{
		Header( "Location:../../hesabim/yeni-sifre?status=no" );
		exit;
	}
	$kullanici_pass = md5( $_POST[ 'uye_sifre' ] );
	$ayarkaydet = $db->prepare(
		"UPDATE uye SET
		uye_sifre=:pass
		WHERE uye_id={$userprint['uye_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'pass' => $kullanici_pass
		)
	);
	if ( $update )
	{
		unset( $_SESSION['uye_mail'] ); 
		Header( "Location:../../hesabim/uye-girisi?status=ok" );
	}
	else
	{
		Header( "Location:../../hesabim/yeni-sifre?status=no" );
	}
}
if ( isset( $_POST[ 'uyeresimduzenle' ] ) )
{
	if (!isset($_SESSION['uye_mail'])) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$uploads_dir = '../../admin/assets/img/genel';
	@$tmp_name = $_FILES[ 'uye_resim' ][ "tmp_name" ];
	$uzanti='.jpg';
	$benzersizsayi4 = rand( 20000, 32000 );
	$refimgyol      = substr( $uploads_dir, 6 ) . "/" . $benzersizsayi4 . $uzanti;
	@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizsayi4$uzanti" );
	$ayarkaydet = $db->prepare(
		"UPDATE uye SET
		uye_resim=:resim
		WHERE uye_id={$userprint['uye_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'resim' => $refimgyol
		)
	);
	if ( $update )
	{
		Header( "Location:../../hesabim/hesap-ayarlari?status=ok" );
	}
	else
	{
		Header( "Location:../../hesabim/hesap-ayarlari?status=no" );
	}
}
if ( isset( $_POST[ 'iletisimform' ] ) )
{
	$captcha = $_POST['g-recaptcha-response'];
	if (!$captcha) {
		header( 'Location:../../iletisim?captcha=no' );
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$secretKey = $linkApi['rgizlianahtar'];
	$ip = GetIP();
	$response = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=".$secretKey."&response=".$captcha."&remoteip=".$ip);
	$responseKeys = json_decode($response,true);
	$mesaj_ad = htmlspecialchars(trim($_POST[ 'mesaj_ad' ]));
	$mesaj_mail = htmlspecialchars(trim($_POST[ 'mesaj_mail' ]));
	$mesaj_icerik = htmlspecialchars(trim($_POST[ 'mesaj_icerik' ]));
	$settings=$db->prepare("SELECT * from ayar where ayar_id=?");
	$settings->execute(array(0));
	$settingsprint=$settings->fetch(PDO::FETCH_ASSOC);
	$ayarkaydet = $db->prepare(
		"INSERT INTO mesajlar SET
		mesaj_ad=:ad,
		mesaj_mail=:mail,
		mesaj_icerik=:icerik
		"
	);
	$update     = $ayarkaydet->execute(
		array(
			'ad'     => $mesaj_ad,
			'mail'   => $mesaj_mail,
			'icerik' => $mesaj_icerik 
		)
	);
	if ( $update )
	{
		$idmesaj = $db->lastInsertId();
		$mesajAdmin = "Merhaba sayın yönetici web sitesi üzerinden ".$idmesaj." id nolu mesaj iletilmiştir. <br> <b>Mesaj İçeriği:</b> <br>".$mesaj_icerik;
		$mesaj = "Merhaba sayın ".$mesaj_ad." <br> web sitemiz üzerinden ".$idmesaj." id nolu mesaj tarafımıza ulaşmıştır. en kısa sürede tarafınıza dönüş sağlanacaktır.";
		$mailAdres = $settingsprint['ayar_mail'];
		mailsend($mailAdres,'[Yonetici] Iletisim Mesaji Alindi',$mesajAdmin);
		mailsend($mesaj_mail,' Iletisim Mesajiniz Alindi',$mesaj);
		Header( "Location:../../iletisim?status=ok" );
	}
	else
	{
		Header( "Location:../../iletisim?status=no" );
	}
}
if ( isset( $_POST[ 'destekac' ] ) )
{ 
	if (!isset($_SESSION['uye_mail'])) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$captcha = $_POST['g-recaptcha-response'];
	if (!$captcha) {
		header( 'Location:../../hesabim/yeni-destek?captcha=no' );
		exit;
	}
	$secretKey = $linkApi['rgizlianahtar'];
	$ip = GetIP();
	$response = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=".$secretKey."&response=".$captcha."&remoteip=".$ip);
	$responseKeys = json_decode($response,true);
	$destek_departman = htmlspecialchars_decode(strip_tags(trim($_POST[ 'destek_departman' ])));
	$destek_onem = htmlspecialchars_decode(strip_tags(trim($_POST[ 'destek_onem' ])));
	$destek_baslik = htmlspecialchars_decode(strip_tags(trim($_POST[ 'destek_baslik' ])));
	$destek_durum = htmlspecialchars_decode(strip_tags(trim($_POST[ 'destek_durum' ])));
	$destekmesaj_aciklama = htmlspecialchars_decode(strip_tags(trim($_POST[ 'destekmesaj_aciklama' ])));
	$kaydet = $db->prepare(
		"INSERT INTO destek SET
		destek_departman=:departman,
		destek_onem=:onem,
		destek_uye=:ad,
		destek_uyeoku=:uyeoku,
		destek_baslik=:baslik,
		destek_durum=:durum");
	$insert = $kaydet->execute(
		array(
			'departman' => $destek_departman,
			'onem' => $destek_onem,
			'ad' => $userprint[ 'uye_id' ],
			'uyeoku' => '1',
			'baslik' => $destek_baslik,
			'durum' => $destek_durum
		));
	if ( $insert )
	{
		$iddesk = $db->lastInsertId();
		if ( $_FILES[ 'destekmesaj_resim' ][ "size" ] > 0 )
		{ 
			$uploads_dir = '../admin/assets/img/destek';
			@$tmp_name = $_FILES[ 'destekmesaj_resim' ][ "tmp_name" ];
			$benzersizsayi1 = rand( 20000, 32000 );
			$benzersizsayi2 = rand( 20000, 32000 );
			$uzanti='.jpg';
			$benzersizad    = $benzersizsayi1 . $benzersizsayi2;
			$refimgyol      = substr( $uploads_dir,  3) . "/" . $benzersizad . $uzanti;
			@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizad$uzanti" );
			$kaydet = $db->prepare(
				"INSERT INTO destekmesaj SET
				destekmesaj_kim=:ad,
				destekmesaj_destek=:tel,
				destekmesaj_aciklama=:hizmet,
				destekmesaj_resim=:not");
			$insert = $kaydet->execute(
				array(
					'ad' => '2',
					'tel' => $iddesk,
					'hizmet' => $destekmesaj_aciklama,
					'not' => $refimgyol
				));
			if ( $insert )
			{
				Header( "Location:../../hesabim/destekler?status=ok" );
			}
			else
			{
				Header( "Location:../../hesabim/yeni-destek?status=no" );
			}
		} else {
			$kaydet = $db->prepare(
				"INSERT INTO destekmesaj SET
				destekmesaj_kim=:kim,
				destekmesaj_destek=:destek,
				destekmesaj_aciklama=:aciklama");
			$insert = $kaydet->execute(
				array(
					'kim' => '2',
					'destek' => $iddesk,
					'aciklama' => $destekmesaj_aciklama
				));
		}
		$settings=$db->prepare("SELECT * from ayar where ayar_id=?");
		$settings->execute(array(0));
		$settingsprint=$settings->fetch(PDO::FETCH_ASSOC);
		$idmesaj = $db->lastInsertId();
		$mesajAdmin = "Merhaba sayın yönetici web sitesi üzerinden ".$userprint[ 'uye_ad' ]." ".$userprint[ 'uye_soyad' ]." isimli üye tarafından [".$destek_baslik."] başlıklı destek açılmıştır. <br> <b>Destek İçeriği:</b> <br>".$destekmesaj_aciklama;
		$mesaj = "Merhaba sayın ".$userprint[ 'uye_ad' ]." ".$userprint[ 'uye_soyad' ]." <br> web sitemiz üzerinden [".$destek_baslik."] başlıklı destek talebiniz oluşturulmuştur. Talebiniz için en kısa sürede tarafınıza dönüş sağlanacaktır.";
		$mailAdres = $settingsprint['ayar_mail'];
		mailsend($mailAdres,'[Yonetici] Destek Talebi Acildi!',$mesajAdmin);
		mailsend($userprint[ 'uye_mail' ],' Destek Talebiniz Acildi!',$mesaj);
		Header( "Location:../../hesabim/destekler?status=ok" );
	}
	else
	{
		Header( "Location:../../hesabim/yeni-destek?status=no" );
	}
}
if ( isset( $_POST[ 'destekkapat' ] ) )
{
	if (!isset($_SESSION['uye_mail'])) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$Did = $_POST['id'];
	$ayarkaydet = $db->prepare(
		"UPDATE destek SET
		destek_durum=:durum
		WHERE destek_id={$_POST['id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'durum'     => '0'
		)
	);
	if ( $update )
	{
		$settings=$db->prepare("SELECT * from ayar where ayar_id=?");
		$settings->execute(array(0));
		$settingsprint=$settings->fetch(PDO::FETCH_ASSOC);
		$idmesaj = $db->lastInsertId();
		$mesajAdmin = "Merhaba sayın yönetici web sitesi üzerinden ".$userprint[ 'uye_ad' ]." ".$userprint[ 'uye_soyad' ]." isimli üyeye ait olan [".$Did."] id nolu destek talebi kullanici tarafından kapatılmıştır.";
		$mailAdres = $settingsprint['ayar_mail'];
		mailsend($mailAdres,'[Yonetici] Destek Talebi Kapatildi!',$mesajAdmin);
		Header( "Location:../../hesabim/destek-oku?destek_id=$Did&status=ok" );
	}
	else
	{
		Header( "Location:../../hesabim/destek-oku?destek_id=$Did&status=no" );
	}
}
if ( isset( $_POST[ 'destekat' ] ) )
{
	if (!isset($_SESSION['uye_mail'])) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$destekmesaj_kim = htmlspecialchars(strip_tags(trim($_POST[ 'destekmesaj_kim' ])));
	$destekmesaj_destek = htmlspecialchars(strip_tags(trim($_POST[ 'destekmesaj_destek' ])));
	$destekmesaj_aciklama = htmlspecialchars(strip_tags(trim($_POST[ 'destekmesaj_aciklama' ])));
	$Did = $destekmesaj_destek;
	$captcha = $_POST['g-recaptcha-response'];
	if (!$captcha) {
		header( "Location:../../hesabim/destek-oku?destek_id=$Did&captcha=no" );
		exit;
	}
	$secretKey = $linkApi['rgizlianahtar'];
	$ip = GetIP();
	$response = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=".$secretKey."&response=".$captcha."&remoteip=".$ip);
	$responseKeys = json_decode($response,true);
	$settings=$db->prepare("SELECT * from ayar where ayar_id=?");
	$settings->execute(array(0));
	$settingsprint=$settings->fetch(PDO::FETCH_ASSOC);
	if ( $_FILES[ 'destekmesaj_resim' ][ "size" ] > 0 )
	{ 
		$uploads_dir = '../assets/img/destek';
		@$tmp_name = $_FILES[ 'destekmesaj_resim' ][ "tmp_name" ];
		$benzersizsayi1 = rand( 20000, 32000 );
		$benzersizsayi2 = rand( 20000, 32000 );
		$uzanti='.jpg';
		$benzersizad    = $benzersizsayi1 . $benzersizsayi2;
		$refimgyol      = substr( $uploads_dir,  3) . "/" . $benzersizad . $uzanti;
		@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizad$uzanti" );
		$kaydet = $db->prepare(
			"INSERT INTO destekmesaj SET
			destekmesaj_kim=:ad,
			destekmesaj_destek=:tel,
			destekmesaj_aciklama=:hizmet,
			destekmesaj_resim=:not");
		$insert = $kaydet->execute(
			array(
				'ad' => $destekmesaj_kim,
				'tel' => $destekmesaj_destek,
				'hizmet' => $destekmesaj_aciklama,
				'not' => $refimgyol
			));
		if ( $insert )
		{
			$ayarkaydet = $db->prepare(
				"UPDATE destek SET
				destek_adminoku=:durum
				WHERE destek_id={$_POST['destekmesaj_destek']}"
			);
			$update     = $ayarkaydet->execute(
				array(
					'durum'     => '0'
				)
			);
			$idmesaj = $db->lastInsertId();
			$mesajAdmin = "Merhaba sayın yönetici web sitesi üzerinden ".$userprint[ 'uye_ad' ]." ".$userprint[ 'uye_soyad' ]." isimli üye tarafından [".$destekmesaj_destek."] id nolu destek talebine mesaj gönderilmiştir. <br> <b>Mesaj İçeriği:</b> <br>".$destekmesaj_aciklama;
			$mesaj = "Merhaba sayın ".$userprint[ 'uye_ad' ]." ".$userprint[ 'uye_soyad' ]." <br> web sitemiz üzerinden [".$destekmesaj_destek."] id nolu destek talebine mesajınız alınmıştır. Talebiniz için en kısa sürede tarafınıza dönüş sağlanacaktır.";
			$mailAdres = $settingsprint['ayar_mail'];
			mailsend($mailAdres,'[Yonetici] Destek Mesaji Gonderildi!',$mesajAdmin);
			mailsend($userprint[ 'uye_mail' ],' Destek Mesajiniz Alindi!',$mesaj);
			Header( "Location:../../hesabim/destek-oku?destek_id=$Did&status=ok" );
		}
		else
		{
			Header( "Location:../../hesabim/destek-oku?destek_id=$Did&status=no" );
		}
	} else {
		$kaydet = $db->prepare(
			"INSERT INTO destekmesaj SET
			destekmesaj_kim=:ad,
			destekmesaj_destek=:tel,
			destekmesaj_aciklama=:hizmet");
		$insert = $kaydet->execute(
			array(
				'ad' => $destekmesaj_kim,
				'tel' => $destekmesaj_destek,
				'hizmet' => $destekmesaj_aciklama
			));
		if ( $insert )
		{
			$ayarkaydet = $db->prepare(
				"UPDATE destek SET
				destek_adminoku=:adminoku,
				destek_durum=:durum
				WHERE destek_id={$destekmesaj_destek}"
			);
			$update     = $ayarkaydet->execute(
				array(
					'adminoku'     => '0',
					'durum'     => '1'
				)
			);
			$idmesaj = $db->lastInsertId();
			$mesajAdmin = "Merhaba sayın yönetici web sitesi üzerinden ".$userprint[ 'uye_ad' ]." ".$userprint[ 'uye_soyad' ]." isimli üye tarafından [".$destekmesaj_destek."] id nolu destek için yeni mesaj gönderilmiştir. <br> <b>Mesaj İçeriği:</b> <br>".$destekmesaj_aciklama;
			$mesaj = "Merhaba sayın ".$userprint[ 'uye_ad' ]." ".$userprint[ 'uye_soyad' ]." <br> web sitemiz üzerinden [".$destekmesaj_destek."] id nolu destek için yeni mesajınız alınmıştır. Talebiniz için en kısa sürede tarafınıza dönüş sağlanacaktır.";
			$mailAdres = $settingsprint['ayar_mail'];
			mailsend($mailAdres,'[Yonetici] Destek Mesaji Gonderildi!',$mesajAdmin);
			mailsend($userprint[ 'uye_mail' ],' Destek Mesajiniz Alindi!',$mesaj);
			Header( "Location:../../hesabim/destek-oku?destek_id=$Did&status=ok" );
		}
		else
		{
			Header( "Location:../../hesabim/destek-oku?destek_id=$Did&status=no" );
		}
	}
}
if ( isset( $_POST[ 'uyeduzenle' ] ) )
{	
	if (!isset($_SESSION['uye_mail'])) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE uye SET
		uye_ad=:ad,
		uye_soyad=:soyad,
		uye_tel=:tel,
		uye_mail=:mail,
		uye_tc=:tc,
		uye_adres=:adres
		WHERE uye_id={$userprint['uye_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'ad' => $_POST[ 'uye_ad' ],
			'soyad' => $_POST[ 'uye_soyad' ],
			'tel' => $_POST[ 'uye_tel' ],
			'mail' => $_POST[ 'uye_mail' ],
			'tc' => $_POST[ 'uye_tc' ],
			'adres' => $_POST[ 'uye_adres' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../../hesabim/hesap-ayarlari?status=ok" );
	}
	else
	{
		Header( "Location:../../hesabim/hesap-ayarlari?status=no" );
	}
}
if ( isset( $_POST[ 'urunkategoriduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE kategoriler SET
		kategori_ad=:ad,
		kategori_title=:title,
		kategori_descr=:descr,
		kategori_keyword=:keyword,
		kategori_sira=:sira
		WHERE kategori_id={$_POST['kategori_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'ad'   => $_POST[ 'kategori_ad' ],
			'title'   => $_POST[ 'kategori_title' ],
			'descr'   => $_POST[ 'kategori_descr' ],
			'keyword'   => $_POST[ 'kategori_keyword' ],
			'sira' => $_POST[ 'kategori_sira' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../urun-kategori.php?status=ok" );
	}
	else
	{
		Header( "Location:../urun-kategori.php?status=no" );
	}
}
if ( isset( $_POST[ 'paketkategoriduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	if ( $_FILES[ 'resim' ][ "size" ] > 0 )
	{
		$uploads_dir = '../assets/img/genel';
		@$tmp_name = $_FILES[ 'resim' ][ "tmp_name" ];
		$benzersizsayi4 = rand( 20000, 32000 );
		$uzanti         = '.jpg';
		$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizsayi4 . $uzanti;
		@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizsayi4$uzanti" );
		$ayarkaydet = $db->prepare(
			"UPDATE kategoripaket SET
			resim=:logo
			WHERE kategori_id={$_POST['kategori_id']}"
		);
		$update     = $ayarkaydet->execute(
			array(
				'logo' => $refimgyol
			)
		); 
	}
	$ayarkaydet = $db->prepare(
		"UPDATE kategoripaket SET
		kategori_ad=:ad,
		vitrin=:vitrin,
		kategori_title=:title,
		kategori_descr=:descr,
		kategori_keyword=:keyword,
		kategori_sira=:sira
		WHERE kategori_id={$_POST['kategori_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'ad'   => $_POST[ 'kategori_ad' ],
			'vitrin'   => $_POST[ 'vitrin' ],
			'title'   => $_POST[ 'kategori_title' ],
			'descr'   => $_POST[ 'kategori_descr' ],
			'keyword'   => $_POST[ 'kategori_keyword' ],
			'sira' => $_POST[ 'kategori_sira' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../paket-kategori.php?status=ok" );
	}
	else
	{
		Header( "Location:../paket-kategori.php?status=no" );
	}
}
if ( isset( $_POST[ 'projekategoriduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE kategoriproje SET
		kategori_ad=:ad,
		vitrin=:vitrin,
		kategori_title=:title,
		kategori_descr=:descr,
		kategori_keyword=:keyword,
		kategori_sira=:sira
		WHERE kategori_id={$_POST['kategori_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'ad'   => $_POST[ 'kategori_ad' ],
			'vitrin'   => $_POST[ 'vitrin' ],
			'title'   => $_POST[ 'kategori_title' ],
			'descr'   => $_POST[ 'kategori_descr' ],
			'keyword'   => $_POST[ 'kategori_keyword' ],
			'sira' => $_POST[ 'kategori_sira' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../proje-kategori.php?status=ok" );
	}
	else
	{
		Header( "Location:../proje-kategori.php?status=no" );
	}
}
if ( isset( $_POST[ 'blogkategoriekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"INSERT INTO kategorilerb SET
		kategori_ad=:ad,
		kategori_title=:title,
		kategori_descr=:descr,
		kategori_keyword=:keyword,
		kategori_sira=:sira
		"
	);
	$update     = $ayarkaydet->execute(
		array(
			'ad'     => $_POST[ 'kategori_ad' ],
			'title'     => $_POST[ 'kategori_title' ],
			'descr'     => $_POST[ 'kategori_descr' ],
			'keyword'     => $_POST[ 'kategori_keyword' ],
			'sira'    => $_POST[ 'kategori_sira' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../blog-kategoriler.php?status=ok" );
	}
	else
	{
		Header( "Location:../blog-kategoriler.php?status=no" );
	}
}
if ( isset( $_POST[ 'blogkategoriduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE kategorilerb SET
		kategori_ad=:ad,
		kategori_title=:title,
		kategori_descr=:descr,
		kategori_keyword=:keyword,
		kategori_sira=:sira
		WHERE kategori_id={$_POST['kategori_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'ad'     => $_POST[ 'kategori_ad' ],
			'title'     => $_POST[ 'kategori_title' ],
			'descr'     => $_POST[ 'kategori_descr' ],
			'keyword'     => $_POST[ 'kategori_keyword' ],
			'sira'    => $_POST[ 'kategori_sira' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../blog-kategoriler.php?status=ok" );
	}
	else
	{
		Header( "Location:../blog-kategoriler.php?status=no" );
	}
}
if ( $_GET[ 'blogkategorisil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from kategorilerb where kategori_id=:kategori_id" );
	$kontrol = $sil->execute(
		array(
			'kategori_id' => $_GET[ 'kategori_id' ]
		)
	);
	if ( $kontrol )
	{
		Header( "Location:../blog-kategoriler.php?status=ok" );
	}
	else
	{
		Header( "Location:../blog-kategoriler.php?status=no" );
	}
}
if ( isset( $_POST[ 'urunkategoriekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"INSERT INTO kategoriler SET
		kategori_ad=:ad,
		kategori_title=:title,
		kategori_descr=:descr,
		kategori_keyword=:keyword,
		kategori_sira=:sira
		"
	);
	$update     = $ayarkaydet->execute(
		array(
			'ad'   => $_POST[ 'kategori_ad' ],
			'title'   => $_POST[ 'kategori_title' ],
			'descr'   => $_POST[ 'kategori_descr' ],
			'keyword'   => $_POST[ 'kategori_keyword' ],
			'sira' => $_POST[ 'kategori_sira' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../urun-kategori.php?status=ok" );
	}
	else
	{
		Header( "Location:../urun-kategori.php?status=no" );
	}
}
if ( isset( $_POST[ 'paketkategoriekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"INSERT INTO kategoripaket SET
		kategori_ad=:ad,
		vitrin=:vitrin,
		kategori_title=:title,
		kategori_descr=:descr,
		kategori_keyword=:keyword,
		kategori_sira=:sira
		"
	);
	$update     = $ayarkaydet->execute(
		array(
			'ad'   => $_POST[ 'kategori_ad' ],
			'vitrin'   => $_POST[ 'vitrin' ],
			'title'   => $_POST[ 'kategori_title' ],
			'descr'   => $_POST[ 'kategori_descr' ],
			'keyword'   => $_POST[ 'kategori_keyword' ],
			'sira' => $_POST[ 'kategori_sira' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../paket-kategori.php?status=ok" );
	}
	else
	{
		Header( "Location:../paket-kategori.php?status=no" );
	}
}
if ( isset( $_POST[ 'projekategoriekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"INSERT INTO kategoriproje SET
		kategori_ad=:ad,
		vitrin=:vitrin,
		kategori_title=:title,
		kategori_descr=:descr,
		kategori_keyword=:keyword,
		kategori_sira=:sira
		"
	);
	$update     = $ayarkaydet->execute(
		array(
			'ad'   => $_POST[ 'kategori_ad' ],
			'vitrin'   => $_POST[ 'vitrin' ],
			'title'   => $_POST[ 'kategori_title' ],
			'descr'   => $_POST[ 'kategori_descr' ],
			'keyword'   => $_POST[ 'kategori_keyword' ],
			'sira' => $_POST[ 'kategori_sira' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../proje-kategori.php?status=ok" );
	}
	else
	{
		Header( "Location:../proje-kategori.php?status=no" );
	}
}
if ( isset( $_POST[ 'blogekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$uploads_dir = '../assets/img/blog';
	@$tmp_name = $_FILES[ 'blog_resim' ][ "tmp_name" ];
	$benzersizsayi1 = rand( 20000, 32000 );
	$benzersizsayi2 = rand( 20000, 32000 );
	$uzanti='.jpg';
	$benzersizad    = $benzersizsayi1 . $benzersizsayi2;
	$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizad . $uzanti;
	@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizad$uzanti" );
	$kaydet = $db->prepare(
		"INSERT INTO blog SET
		blog_baslik=:baslik,
		blog_kategori=:kategori,
		blog_detay=:detay,
		blog_title=:title,
		blog_descr=:descr,
		blog_keyword=:keyword,
		blog_resim=:resim"
	);
	$insert = $kaydet->execute(
		array(
			'baslik' => $_POST[ 'blog_baslik' ],
			'kategori' => $_POST[ 'blog_kategori' ],
			'detay'  => $_POST[ 'blog_detay' ],
			'title' => $_POST[ 'blog_title' ],
			'descr'  => $_POST[ 'blog_descr' ],
			'keyword' => $_POST[ 'blog_keyword' ],
			'resim'  => $refimgyol
		)
	);
	if ( $insert )
	{
		Header( "Location:../blog.php?status=ok" );
	}
	else
	{
		Header( "Location:../blog.php?status=no" );
	}
}
if (isset($_POST['widgetduzenle'])) {

    // Geliştirici hata görüntüleme
    error_reporting(E_ALL);
    ini_set('display_errors', 1);

    // Oturum kontrolü
    if (!isset($_SESSION['kullanici_adi'])) {
        exit;
    }

    // Demo modu kontrolü
    if ($DemCont == 1) {
        $_SESSION['status'] = "demo";
        $demoGeriLink = $_SERVER['HTTP_REFERER'];
        header("Location: $demoGeriLink");
        exit;
    }

    try {
        // Eksik POST alanlarını boş string olarak varsay
        $fields = [
            'widget_bhizmet', 'widget_hizmet', 'widget_btwitter', 'widget_twitter',
            'widget_diger', 'widget_bdiger', 'widget_blog', 'widget_proje',
            'widget_bproje', 'widget_referans', 'widget_breferans', 'widget_galeri',
            'widget_bgaleri', 'widget_burun', 'widget_urun', 'widget_yorum',
            'widget_bwelcome', 'widget_welcome', 'widget_bwelcome1', 'widget_welcome1',
            'widget_counter', 'widget_bblog', 'widget_bara', 'widget_ara',
            'widget_bilgi', 'widget_bbilgi', 'widget_ufiyat', 'widget_usatinal',
            'widget_byorum'
        ];

        foreach ($fields as $field) {
            if (!isset($_POST[$field])) {
                $_POST[$field] = "";
            }
        }

        // Sorgu hazırla
        $ayarkaydet = $db->prepare("
            UPDATE widget SET
                widget_bhizmet   = :bhizmet,
                widget_hizmet    = :hizmet,
                widget_btwitter  = :btwitter,
                widget_twitter   = :twitter,
                widget_diger     = :diger,
                widget_bdiger    = :bdiger,
                widget_blog      = :blog,
                widget_proje     = :proje,
                widget_bproje    = :bproje,
                widget_referans  = :referans,
                widget_breferans = :breferans,
                widget_galeri    = :galeri,
                widget_bgaleri   = :bgaleri,
                widget_burun     = :burun,
                widget_urun      = :urun,
                widget_yorum     = :yorum,
                widget_bwelcome  = :bwelcome,
                widget_welcome   = :welcome,
                widget_bwelcome1 = :bwelcome1,
                widget_welcome1  = :welcome1,
                widget_counter   = :counter,
                widget_bblog     = :bblog,
                widget_bara      = :bara,
                widget_ara       = :ara,
                widget_bilgi     = :bilgi,
                widget_bbilgi    = :bbilgi,
                widget_ufiyat    = :ufiyat,
                widget_usatinal  = :usatinal,
                widget_byorum    = :byorum
            WHERE widget_id = :widget_id
        ");

        // Parametreleri bağla
        $update = $ayarkaydet->execute([
            'bhizmet'   => $_POST['widget_bhizmet'],
            'hizmet'    => $_POST['widget_hizmet'],
            'btwitter'  => $_POST['widget_btwitter'],
            'twitter'   => $_POST['widget_twitter'],
            'diger'     => $_POST['widget_diger'],
            'bdiger'    => $_POST['widget_bdiger'],
            'blog'      => $_POST['widget_blog'],
            'proje'     => $_POST['widget_proje'],
            'bproje'    => $_POST['widget_bproje'],
            'referans'  => $_POST['widget_referans'],
            'breferans' => $_POST['widget_breferans'],
            'galeri'    => $_POST['widget_galeri'],
            'bgaleri'   => $_POST['widget_bgaleri'],
            'burun'     => $_POST['widget_burun'],
            'urun'      => $_POST['widget_urun'],
            'yorum'     => $_POST['widget_yorum'],
            'bwelcome'  => $_POST['widget_bwelcome'],
            'welcome'   => $_POST['widget_welcome'],
            'bwelcome1' => $_POST['widget_bwelcome1'],
            'welcome1'  => $_POST['widget_welcome1'],
            'counter'   => $_POST['widget_counter'],
            'bblog'     => $_POST['widget_bblog'],
            'bara'      => $_POST['widget_bara'],
            'ara'       => $_POST['widget_ara'],
            'bilgi'     => $_POST['widget_bilgi'],
            'bbilgi'    => $_POST['widget_bbilgi'],
            'ufiyat'    => $_POST['widget_ufiyat'],
            'usatinal'  => $_POST['widget_usatinal'],
            'byorum'    => $_POST['widget_byorum'],
            'widget_id' => $_POST['widget_id']
        ]);

        // Sonuç kontrolü
        if ($update) {
            header("Location: ../modul.php?status=ok");
            exit;
        } else {
            header("Location: ../modul.php?status=no");
            exit;
        }

    } catch (PDOException $e) {
        echo "Hata oluştu: " . $e->getMessage();
        exit;
    }
}

if ( isset( $_POST[ 'projeyaziduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE widget SET
		widget_pyazi=:pyazi,
		widget_pbuton=:pbuton,
		widget_plink=:plink
		WHERE widget_id='1'"
	);
	$update     = $ayarkaydet->execute(
		array(
			'pyazi'  => $_POST[ 'widget_pyazi' ],
			'pbuton' => $_POST[ 'widget_pbuton' ],
			'plink'  => $_POST[ 'widget_plink' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../proje-yazi.php?status=ok" );
	}
	else
	{
		Header( "Location:../proje-yazi.php?status=no" );
	}
}
if ( isset( $_POST[ 'bilgiduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	if ( $_FILES[ 'resim' ][ "size" ] > 0 )
	{
		$uploads_dir = '../assets/img/genel';
		@$tmp_name = $_FILES[ 'resim' ][ "tmp_name" ];
		@$name = $_FILES[ 'resim' ][ "name" ];
		$benzersizsayi1 = rand( 20000, 32000 );
		$benzersizsayi2 = rand( 20000, 32000 );
		$uzanti         = '.jpg';
		$benzersizad    = $benzersizsayi1 . $benzersizsayi2;
		$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizad . $uzanti;
		@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizad$uzanti" );
		$ayarkaydet = $db->prepare(
			"UPDATE bilgi SET
			resim=:resim
			WHERE bilgi_id={$_POST['bilgi_id']}"
		);
		$update     = $ayarkaydet->execute(
			array(
				'resim' => $refimgyol
			)
		);
	}
	$ayarkaydet = $db->prepare(
		"UPDATE bilgi SET
		bilgi_baslik=:baslik,
		bilgi_aciklama=:aciklama
		WHERE bilgi_id={$_POST['bilgi_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'baslik'   => $_POST[ 'bilgi_baslik' ],
			'aciklama' => $_POST[ 'bilgi_aciklama' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../bilgiler.php?status=ok" );
	}
	else
	{
		Header( "Location:../bilgiler.php?status=no" );
	}
}
if ( isset( $_POST[ 'whatsappduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE whatsapp SET
		whats_tel=:tel,
		whats_cdestek=:cdestek,
		whats_cdestekdurum=:cdestekdurum,
		whats_tiklaara=:tiklaara,
		whats_tiklaaradurum=:tiklaaradurum,
		whats_skype=:skype,
		whats_skypedurum=:skypedurum,
		whats_mail=:mail,
		whats_maildurum=:maildurum,
		whats_sssdurum=:sssdurum,
		whats_iletisimdurum=:iletisimdurum,
		whats_durum=:durum
		WHERE whats_id={$_POST['whats_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'tel'           => $_POST[ 'whats_tel' ],
			'cdestek'       => $_POST[ 'whats_cdestek' ],
			'cdestekdurum'  => $_POST[ 'whats_cdestekdurum' ],
			'tiklaara'      => $_POST[ 'whats_tiklaara' ],
			'tiklaaradurum' => $_POST[ 'whats_tiklaaradurum' ],
			'skype'         => $_POST[ 'whats_skype' ],
			'skypedurum'    => $_POST[ 'whats_skypedurum' ],
			'mail'          => $_POST[ 'whats_mail' ],
			'maildurum'     => $_POST[ 'whats_maildurum' ],
			'sssdurum'      => $_POST[ 'whats_sssdurum' ],
			'iletisimdurum' => $_POST[ 'whats_iletisimdurum' ],
			'durum'         => $_POST[ 'whats_durum' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../kolay-iletisim.php?status=ok" );
	}
	else
	{
		Header( "Location:../kolay-iletisim.php?status=no" );
	}
}
if ( isset( $_POST[ 'htmlduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	if ( $_FILES[ 'ayar_resimparalax' ][ "size" ] > 0 )
		{
			$uploads_dir = '../assets/img/genel';
			@$tmp_name = $_FILES[ 'ayar_resimparalax' ][ "tmp_name" ];
			$benzersizsayi4 = rand( 20000, 32000 );
			$uzanti         = '.jpg';
			$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizsayi4 . $uzanti;
			@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizsayi4$uzanti" );
			$ayarkaydet = $db->prepare(
				"UPDATE ayar SET
				ayar_resimparalax=:logo
				WHERE ayar_id=0"
			);
			$update     = $ayarkaydet->execute(
				array(
					'logo' => $refimgyol
				)
			); 
		}
	if ( $_FILES[ 'ayar_resimcounter' ][ "size" ] > 0 )
		{
			$uploads_dir = '../assets/img/genel';
			@$tmp_name = $_FILES[ 'ayar_resimcounter' ][ "tmp_name" ];
			$benzersizsayi4 = rand( 20000, 32000 );
			$uzanti         = '.jpg';
			$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizsayi4 . $uzanti;
			@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizsayi4$uzanti" );
			$ayarkaydet = $db->prepare(
				"UPDATE ayar SET
				ayar_resimcounter=:fav
				WHERE ayar_id=0"
			);
			$update     = $ayarkaydet->execute(
				array(
					'fav' => $refimgyol
				)
			);
		}
	$ayarkaydet = $db->prepare(
		"UPDATE widget SET
		widget_html=:html,
		widget_html2=:html2
		WHERE widget_id={$_POST['widget_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'html' => $_POST[ 'widget_html' ],
			'html2' => $_POST[ 'widget_html2' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../html-alan.php?status=ok" );
	}
	else
	{
		Header( "Location:../html-alan.php?status=no" );
	}
}
if ( isset( $_POST[ 'sozlesmeduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE widget SET
		widget_satissozlesme=:satissozlesme,
		widget_uyesozlesme=:uyesozlesme
		WHERE widget_id={$_POST['widget_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'satissozlesme' => $_POST[ 'widget_satissozlesme' ],
			'uyesozlesme' => $_POST[ 'widget_uyesozlesme' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../sozlesme-yonetimi.php?status=ok" );
	}
	else
	{
		Header( "Location:../sozlesme-yonetimi.php?status=no" );
	}
}
if ( isset( $_POST[ 'widgetsssduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE widget SET
		widget_sbir=:sbir,
		widget_cbir=:cbir,
		widget_siki=:siki,
		widget_ciki=:ciki,
		widget_suc=:suc,
		widget_cuc=:cuc
		WHERE widget_id={$_POST['widget_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'sbir' => $_POST[ 'widget_sbir' ],
			'cbir' => $_POST[ 'widget_cbir' ],
			'siki' => $_POST[ 'widget_siki' ],
			'ciki' => $_POST[ 'widget_ciki' ],
			'suc'  => $_POST[ 'widget_suc' ],
			'cuc'  => $_POST[ 'widget_cuc' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../modul.php?status=ok" );
	}
	else
	{
		Header( "Location:../modul.php?status=no" );
	}
}
if ( isset( $_POST[ 'counterduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE counter SET
		counter_isim=:isim,
		counter_rakam=:rakam,
		counter_icon=:icon
		WHERE counter_id={$_POST['counter_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'isim'  => $_POST[ 'counter_isim' ],
			'rakam' => $_POST[ 'counter_rakam' ],
			'icon'  => $_POST[ 'counter_icon' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../counter.php?status=ok" );
	}
	else
	{
		Header( "Location:../counter.php?status=no" );
	}
}
if ( isset( $_POST[ 'iyziduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE ayar_kredi_karti SET
		iyzico_apiKey=:apiKey,
		iyzico_secretKey=:secretKey,
		iyzico_uri=:uri
		WHERE id={$_POST['iyzico_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'apiKey'   => $_POST[ 'iyzico_apiKey' ],
			'secretKey'   => $_POST[ 'iyzico_secretKey' ],
			'uri' => $_POST[ 'iyzico_uri' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../shopier.php?status=ok" );
	}
	else
	{
		Header( "Location:../shopier.php?status=no" );
	}
}
if ( isset( $_POST[ 'metaduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE meta SET
		meta_title=:title,
		meta_descr=:descr,
		meta_keyword=:keyword
		WHERE meta_id={$_POST['meta_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'title'   => $_POST[ 'meta_title' ],
			'descr'   => $_POST[ 'meta_descr' ],
			'keyword' => $_POST[ 'meta_keyword' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../seo.php?status=ok" );
	}
	else
	{
		Header( "Location:../seo.php?status=no" );
	}
}
if ( isset( $_POST[ 'kategoriduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE kategoriler SET
		kategori_ad=:ad,
		kategori_title=:title,
		kategori_descr=:descr,
		kategori_keyword=:keyword,
		kategori_sira=:sira
		WHERE kategori_id={$_POST['kategori_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'ad'      => $_POST[ 'kategori_ad' ],
			'title'   => $_POST[ 'kategori_title' ],
			'descr'   => $_POST[ 'kategori_descr' ],
			'keyword' => $_POST[ 'kategori_keyword' ],
			'sira'    => $_POST[ 'kategori_sira' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../kategoriler.php?status=ok" );
	}
	else
	{
		Header( "Location:../kategoriler.php?status=no" );
	}
}

if ( isset( $_POST[ 'genelayar' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	if ( $_FILES[ 'ayar_ark' ][ "size" ] > 0 )
	{
		$uploads_dir = '../assets/img/genel';
		@$tmp_name = $_FILES[ 'ayar_ark' ][ "tmp_name" ];
		$benzersizsayi4 = rand( 20000, 32000 );
		$uzanti         = '.jpg';
		$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizsayi4 . $uzanti;
		@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizsayi4$uzanti" );
		$ayarkaydet = $db->prepare(
			"UPDATE ayar SET
			ayar_ark=:ark
			WHERE ayar_id=0"
		);
		$update     = $ayarkaydet->execute(
			array(
				'ark'     => $refimgyol
			)
		);
	}
	if ( $_FILES[ 'ayar_logo' ][ "size" ] > 0 )
	{
		$uploads_dir = '../assets/img/genel';
		@$tmp_name = $_FILES[ 'ayar_logo' ][ "tmp_name" ];
		$benzersizsayi4 = rand( 20000, 32000 );
		$uzanti         = '.jpg';
		$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizsayi4 . $uzanti;
		@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizsayi4$uzanti" );
		$ayarkaydet = $db->prepare(
			"UPDATE ayar SET
			ranahtar=:ranahtar,
			rgizlianahtar=:rgizlianahtar,
			ayar_siteurl=:siteurl,
			ayar_firmaadi=:firmaadi,
			ayar_imza=:imza,
			ayar_kod=:kod,
			ayar_logo=:logo,
			ayar_harita=:harita
			WHERE ayar_id=0"
		);
		$update     = $ayarkaydet->execute(
			array(
				'ranahtar'  => $_POST[ 'ranahtar' ],
				'rgizlianahtar'  => $_POST[ 'rgizlianahtar' ],
				'siteurl'  => $_POST[ 'ayar_siteurl' ],
				'firmaadi' => $_POST[ 'ayar_firmaadi' ],
				'imza'     => $_POST[ 'ayar_imza' ],
				'kod'      => $_POST[ 'ayar_kod' ],
				'logo'     => $refimgyol,
				'harita'   => $_POST[ 'ayar_harita' ]
			)
		);
		if ( $update )
		{
			$resimsilunlink = $_POST[ 'eskiyol_logo' ];
			unlink( "../$resimsilunlink" );
			Header( "Location:../genel-ayarlar.php?status=ok" );
		}
		else
		{
			Header( "Location:../genel-ayarlar.php?status=no" );
		}
	}
	else
	{
		$ayarkaydet = $db->prepare(
			"UPDATE ayar SET
			ranahtar=:ranahtar,
			rgizlianahtar=:rgizlianahtar,
			ayar_siteurl=:siteurl,
			ayar_firmaadi=:firmaadi,
			ayar_imza=:imza,
			ayar_kod=:kod,
			ayar_harita=:harita
			WHERE ayar_id=0"
		);
		$update     = $ayarkaydet->execute(
			array(
				'ranahtar'  => $_POST[ 'ranahtar' ],
				'rgizlianahtar'  => $_POST[ 'rgizlianahtar' ],
				'siteurl'  => $_POST[ 'ayar_siteurl' ],
				'firmaadi' => $_POST[ 'ayar_firmaadi' ],
				'imza'     => $_POST[ 'ayar_imza' ],
				'kod'      => $_POST[ 'ayar_kod' ],
				'harita'   => $_POST[ 'ayar_harita' ]
			)
		);
		if ( $update )
		{
			Header( "Location:../genel-ayarlar.php?status=ok" );
		}
		else
		{
			Header( "Location:../genel-ayarlar.php?status=no" );
		}
	}
	if ( $_FILES[ 'ayar_fav' ][ "size" ] > 0 )
	{
		$uploads_dir = '../assets/img/genel';
		@$tmp_name = $_FILES[ 'ayar_fav' ][ "tmp_name" ];
		$benzersizsayi4 = rand( 20000, 32000 );
		$uzanti         = '.jpg';
		$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizsayi4 . $uzanti;
		@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizsayi4$uzanti" );
		$ayarkaydet = $db->prepare(
			"UPDATE ayar SET
			ranahtar=:ranahtar,
			rgizlianahtar=:rgizlianahtar,
			ayar_siteurl=:siteurl,
			ayar_firmaadi=:firmaadi,
			ayar_kod=:kod,
			ayar_fav=:fav,
			ayar_harita=:harita
			WHERE ayar_id=0"
		);
		$update     = $ayarkaydet->execute(
			array(
				'ranahtar'  => $_POST[ 'ranahtar' ],
				'rgizlianahtar'  => $_POST[ 'rgizlianahtar' ],
				'siteurl'  => $_POST[ 'ayar_siteurl' ],
				'firmaadi' => $_POST[ 'ayar_firmaadi' ],
				'kod'      => $_POST[ 'ayar_kod' ],
				'fav'      => $refimgyol,
				'harita'   => $_POST[ 'ayar_harita' ]
			)
		);
		if ( $update )
		{
			$resimsilunlink = $_POST[ 'eskiyol_fav' ];
			unlink( "../$resimsilunlink" );
			Header( "Location:../genel-ayarlar.php?status=ok" );
		}
		else
		{
			Header( "Location:../genel-ayarlar.php?status=no" );
		}
	}
	else
	{
		$ayarkaydet = $db->prepare(
			"UPDATE ayar SET
			ranahtar=:ranahtar,
			rgizlianahtar=:rgizlianahtar,
			ayar_siteurl=:siteurl,
			ayar_firmaadi=:firmaadi,
			ayar_kod=:kod,
			ayar_harita=:harita
			WHERE ayar_id=0"
		);
		$update     = $ayarkaydet->execute(
			array(
				'ranahtar'  => $_POST[ 'ranahtar' ],
				'rgizlianahtar'  => $_POST[ 'rgizlianahtar' ],
				'siteurl'  => $_POST[ 'ayar_siteurl' ],
				'firmaadi' => $_POST[ 'ayar_firmaadi' ],
				'kod'      => $_POST[ 'ayar_kod' ],
				'harita'   => $_POST[ 'ayar_harita' ]
			)
		);
		if ( $update )
		{
			Header( "Location:../genel-ayarlar.php?status=ok" );
		}
		else
		{
			Header( "Location:../genel-ayarlar.php?status=no" );
		}
	}
}
if ( isset( $_POST[ 'arkaplan' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	if ( $_FILES[ 'ayar_resimcounter' ][ "size" ] > 0 || $_FILES[ 'ayar_resimparalax' ][ "size" ] > 0 )
	{
		if ( $_FILES[ 'ayar_resimparalax' ][ "size" ] > 0 )
		{
			$uploads_dir = '../assets/img/genel';
			@$tmp_name = $_FILES[ 'ayar_resimparalax' ][ "tmp_name" ];
			$benzersizsayi4 = rand( 20000, 32000 );
			$uzanti         = '.jpg';
			$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizsayi4 . $uzanti;
			@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizsayi4$uzanti" );
			$ayarkaydet = $db->prepare(
				"UPDATE ayar SET
				ayar_resimparalax=:logo
				WHERE ayar_id=0"
			);
			$update     = $ayarkaydet->execute(
				array(
					'logo' => $refimgyol
				)
			);
			if ( $update )
			{
				$resimsilunlink = $_POST[ 'eskiyol_paralax' ];
				unlink( "../$resimsilunlink" );
				Header( "Location:../genel-ayarlar.php?status=ok" );
			}
			else
			{
				Header( "Location:../genel-ayarlar.php?status=no" );
			}
		}
		if ( $_FILES[ 'ayar_resimcounter' ][ "size" ] > 0 )
		{
			$uploads_dir = '../assets/img/genel';
			@$tmp_name = $_FILES[ 'ayar_resimcounter' ][ "tmp_name" ];
			$benzersizsayi4 = rand( 20000, 32000 );
			$uzanti         = '.jpg';
			$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizsayi4 . $uzanti;
			@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizsayi4$uzanti" );
			$ayarkaydet = $db->prepare(
				"UPDATE ayar SET
				ayar_resimcounter=:fav
				WHERE ayar_id=0"
			);
			$update     = $ayarkaydet->execute(
				array(
					'fav' => $refimgyol
				)
			);
			if ( $update )
			{
				$resimsilunlink = $_POST[ 'eskiyol_counter' ];
				unlink( "../$resimsilunlink" );
				Header( "Location:../genel-ayarlar.php?status=ok" );
			}
			else
			{
				Header( "Location:../genel-ayarlar.php?status=no" );
			}
		}
	}
	else
	{
		Header( "Location:../genel-ayarlar.php?status=eksik" );
	}
}
if ( isset( $_POST[ 'seoayar' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE ayar SET
		ayar_title=:title,
		ayar_description=:description,
		ayar_keywords=:keywords
		WHERE ayar_id=0"
	);
	$update     = $ayarkaydet->execute(
		array(
			'title'       => $_POST[ 'ayar_title' ],
			'description' => $_POST[ 'ayar_description' ],
			'keywords'    => $_POST[ 'ayar_keywords' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../genel-ayarlar.php?status=ok" );
	}
	else
	{
		Header( "Location:../genel-ayarlar.php?status=no" );
	}
}
if ( isset( $_POST[ 'renkayar' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
	$_SESSION['status']="demo";
	$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	if ( $_FILES[ 'resim_footer' ][ "size" ] > 0 )
		{
			$uploads_dir = '../assets/img/genel';
			@$tmp_name = $_FILES[ 'resim_footer' ][ "tmp_name" ];
			$benzersizsayi4 = rand( 20000, 32000 );
			$uzanti         = '.jpg';
			$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizsayi4 . $uzanti;
			@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizsayi4$uzanti" );
			$ayarkaydet = $db->prepare(
				"UPDATE ayar SET
				resim_footer=:logo
				WHERE ayar_id=0"
			);
			$update     = $ayarkaydet->execute(
				array(
					'logo' => $refimgyol
				)
			); 
		}
	if ( $_FILES[ 'resim_title' ][ "size" ] > 0 )
		{
			$uploads_dir = '../assets/img/genel';
			@$tmp_name = $_FILES[ 'resim_title' ][ "tmp_name" ];
			$benzersizsayi4 = rand( 20000, 32000 );
			$uzanti         = '.jpg';
			$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizsayi4 . $uzanti;
			@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizsayi4$uzanti" );
			$ayarkaydet = $db->prepare(
				"UPDATE ayar SET
				resim_title=:logo
				WHERE ayar_id=0"
			);
			$update     = $ayarkaydet->execute(
				array(
					'logo' => $refimgyol
				)
			); 
		}
	$ayarkaydet = $db->prepare(
		"UPDATE ayar SET
		ayar_mobil=:mobil,
		ayar_leoder=:leoder,
		ayar_renk=:renk,
		ayar_renk2=:renk2,
		ayar_renk3=:renk3,
		ayar_renk4=:renk4
		WHERE ayar_id=0"
	);
	$update     = $ayarkaydet->execute(
		array(
			'mobil'  => $_POST[ 'ayar_mobil' ],
			'leoder' => $_POST[ 'ayar_leoder' ],
			'renk'   => "#".$_POST[ 'ayar_renk' ],
			'renk2'   => "#".$_POST[ 'ayar_renk2' ],
			'renk3'   => "#".$_POST[ 'ayar_renk3' ],
			'renk4'   => "#".$_POST[ 'ayar_renk4' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../genel-ayarlar.php?status=ok" );
	}
	else
	{
		Header( "Location:../genel-ayarlar.php?status=no" );
	}
}
if ( isset( $_POST[ 'iletisimayar' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE ayar SET
		ayar_adres=:adres,
		ayar_ilce=:ilce,
		ayar_ara=:ara,
		ayar_il=:il,
		ayar_tel=:tel,
		ayar_fax=:fax,
		ayar_whatsapp=:whatsapp,
		ayar_mail=:mail
		WHERE ayar_id=0"
	);
	$update     = $ayarkaydet->execute(
		array(
			'adres' => $_POST[ 'ayar_adres' ],
			'ilce'  => $_POST[ 'ayar_ilce' ],
			'ara'   => $_POST[ 'ayar_ara' ],
			'il'    => $_POST[ 'ayar_il' ],
			'tel'   => $_POST[ 'ayar_tel' ],
			'fax'   => $_POST[ 'ayar_fax' ],
			'whatsapp'   => $_POST[ 'ayar_whatsapp' ],
			'mail'  => $_POST[ 'ayar_mail' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../genel-ayarlar.php?status=ok" );
	}
	else
	{
		Header( "Location:../genel-ayarlar.php?status=no" );
	}
}
if ( isset( $_POST[ 'sms' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE sms SET
		sms_kullanici=:kullanici,
		sms_sifre=:sifre,
		sms_baslik=:baslik,
		sms_durum=:durum
		WHERE sms_id=0"
	);
	$update     = $ayarkaydet->execute(
		array(
			'kullanici' => $_POST[ 'sms_kullanici' ],
			'sifre'     => $_POST[ 'sms_sifre' ],
			'baslik'    => $_POST[ 'sms_baslik' ],
			'durum'     => $_POST[ 'sms_durum' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../genel-ayarlar.php?status=ok" );
	}
	else
	{
		Header( "Location:../genel-ayarlar.php?status=no" );
	}
}
if ( isset( $_POST[ 'motorduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE motor SET
		motor_analitik=:analitik,
		motor_metrika=:metrika,
		motor_gonay=:gonay,
		motor_yonay=:yonay
		WHERE motor_id={$_POST['motor_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'analitik' => $_POST[ 'motor_analitik' ],
			'metrika'  => $_POST[ 'motor_metrika' ],
			'gonay'    => $_POST[ 'motor_gonay' ],
			'yonay'    => $_POST[ 'motor_yonay' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../google-yandex-ayarlari.php?status=ok" );
	}
	else
	{
		Header( "Location:../google-yandex-ayarlari.php?status=no" );
	}
}
if ( isset( $_POST[ 'logoduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$uploads_dir = '../assets/img/genel';
	@$tmp_name = $_FILES[ 'ayar_logo' ][ "tmp_name" ];
	@$name = $_FILES[ 'ayar_logo' ][ "name" ];
	$benzersizsayi4 = rand( 20000, 32000 );
	$refimgyol      = substr( $uploads_dir, 6 ) . "/" . $benzersizsayi4 . $name;
	@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizsayi4$name" );
	$ayarkaydet = $db->prepare(
		"UPDATE ayar SET
		ayar_logo=:logo
		WHERE ayar_id=0"
	);
	$update     = $ayarkaydet->execute(
		array(
			'logo' => $refimgyol
		)
	);
	if ( $update )
	{
		$resimsilunlink = $_POST[ 'eski_yol' ];
		unlink( "../../$resimsilunlink" );
		Header( "Location:../genel-ayarlar.php?status=ok" );
	}
	else
	{
		Header( "Location:../genel-ayaralar.php?status=no" );
	}
}
if ( isset( $_POST[ 'sosyalduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE sosyal SET
		sosyal_link=:link,
		sosyal_icon=:icon
		WHERE sosyal_id={$_POST['sosyal_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'link' => $_POST[ 'sosyal_link' ],
			'icon' => $_POST[ 'sosyal_icon' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../sosyal-medya.php?status=ok" );
	}
	else
	{
		Header( "Location:../sosyal-medya.php?status=no" );
	}
}
if ( isset( $_POST[ 'sosyalekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"INSERT INTO sosyal SET
		sosyal_link=:link,
		sosyal_icon=:icon
		"
	);
	$update     = $ayarkaydet->execute(
		array(
			'link' => $_POST[ 'sosyal_link' ],
			'icon' => $_POST[ 'sosyal_icon' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../sosyal-medya.php?status=ok" );
	}
	else
	{
		Header( "Location:../sosyal-medya.php?status=no" );
	}
}
if ( isset( $_POST[ 'mailayarlari' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit();
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE mail SET
		mail_user=:user,
		mail_host=:host,
		mail_pass=:pass,
		mail_bildirim=:bildirim,
		mail_name=:name,
		mail_sender=:sender,
		mail_secure=:secure,
		mail_port=:port
		WHERE mail_id=0"
	);
	$update     = $ayarkaydet->execute(
		array(
			'user' => $_POST[ 'mail_user' ],
			'host' => $_POST[ 'mail_host' ],
			'pass' => $_POST[ 'mail_pass' ],
			'bildirim' => $_POST[ 'mail_bildirim' ],
			'name' => $_POST[ 'mail_name' ],
			'sender' => $_POST[ 'mail_sender' ],
			'secure' => $_POST[ 'mail_secure' ],
			'port' => $_POST[ 'mail_port' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../genel-ayarlar.php?status=ok" );
	}
	else
	{
		Header( "Location:../genel-ayarlar.php?status=no" );
	}
}
if ( isset( $_POST[ 'profilresimduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$uploads_dir = '../assets/img/genel';
	@$tmp_name = $_FILES[ 'kullanici_resim' ][ "tmp_name" ];
	$uzanti         = '.jpg';
	$benzersizsayi4 = rand( 20000, 32000 );
	$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizsayi4 . $uzanti;
	@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizsayi4$uzanti" );
	$ayarkaydet = $db->prepare(
		"UPDATE kullanici SET
		kullanici_resim=:resim
		WHERE kullanici_id=0"
	);
	$update     = $ayarkaydet->execute(
		array(
			'resim' => $refimgyol
		)
	);
	if ( $update )
	{
		Header( "Location:../user.php?status=ok" );
	}
	else
	{
		Header( "Location:../user.php?status=no" );
	}
}
if ( isset( $_POST[ 'kullaniciduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$kullanici_pass = md5( $_POST[ 'kullanici_pass' ] );
	$ayarkaydet = $db->prepare(
		"UPDATE kullanici SET
		kullanici_adsoyad=:adsoyad,
		kullanici_adi=:adi
		WHERE kullanici_id=0"
	);
	$update     = $ayarkaydet->execute(
		array(
			'adsoyad' => $_POST[ 'kullanici_adsoyad' ],
			'adi'     => $_POST[ 'kullanici_adi' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../user.php?status=ok" );
	}
	else
	{
		Header( "Location:../user.php?status=no" );
	}
}
if ( isset( $_POST[ 'kullanicisifre' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$kullanici_pass = md5( $_POST[ 'kullanici_pass' ] );
	$ayarkaydet = $db->prepare(
		"UPDATE kullanici SET
		kullanici_pass=:pass
		WHERE kullanici_id=0"
	);
	$update     = $ayarkaydet->execute(
		array(
			'pass' => $kullanici_pass
		)
	);
	if ( $update )
	{
		Header( "Location:../user.php?status=ok" );
	}
	else
	{
		Header( "Location:../user.php?status=no" );
	}
}
if ( isset( $_POST[ 'sssduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sss_id = $_POST[ 'sss_id' ];
	$ayarkaydet = $db->prepare(
		"UPDATE sss SET
		sss_soru=:soru,
		sss_sira=:sira,
		sss_cevap=:cevap
		WHERE sss_id={$_POST['sss_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'soru'  => $_POST[ 'sss_soru' ],
			'sira'  => $_POST[ 'sss_sira' ],
			'cevap' => $_POST[ 'sss_cevap' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../sss.php?status=ok" );
	}
	else
	{
		Header( "Location:../sss.php?status=ok" );
	}
}
if ( isset( $_POST[ 'kategoriekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"INSERT INTO kategoriler SET
		kategori_ad=:ad,
		kategori_title=:title,
		kategori_descr=:descr,
		kategori_keyword=:keyword,
		kategori_sira=:sira
		"
	);
	$update     = $ayarkaydet->execute(
		array(
			'ad'      => $_POST[ 'kategori_ad' ],
			'title'   => $_POST[ 'kategori_title' ],
			'descr'   => $_POST[ 'kategori_descr' ],
			'keyword' => $_POST[ 'kategori_keyword' ],
			'sira'    => $_POST[ 'kategori_sira' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../kategoriler.php?status=ok" );
	}
	else
	{
		Header( "Location:../kategoriler.php?status=no" );
	}
}
if ( isset( $_POST[ 'sssekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"INSERT INTO sss SET
		sss_soru=:soru,
		sss_cevap=:cevap,
		sss_sira=:sira
		"
	);
	$update     = $ayarkaydet->execute(
		array(
			'soru'  => $_POST[ 'sss_soru' ],
			'cevap' => $_POST[ 'sss_cevap' ],
			'sira'  => $_POST[ 'sss_sira' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../sss.php?&status=ok" );
	}
	else
	{
		Header( "Location:../sss.php?status=no" );
	}
}
if ( isset( $_POST[ 'omenuekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ust = $_POST[ 'omenu_ust' ];
	if ( $ust == 0 )
	{
		$ayarkaydet = $db->prepare(
			"INSERT INTO omenu SET
			omenu_ad=:ad,
			omenu_link=:link,
			omenu_ust=:ust,
			omenu_durum=:durum,
			omenu_sira=:sira
			"
		);
		$update     = $ayarkaydet->execute(
			array(
				'ad'    => $_POST[ 'omenu_ad' ],
				'link'  => $_POST[ 'omenu_link' ],
				'ust'   => $_POST[ 'omenu_ust' ],
				'durum' => '0',
				'sira'  => $_POST[ 'omenu_sira' ]
			)
		);
	}
	else
	{
		$ayarkaydet = $db->prepare(
			"INSERT INTO omenu SET
			omenu_ad=:ad,
			omenu_link=:link,
			omenu_ust=:ust,
			omenu_durum=:durum,
			omenu_sira=:sira
			"
		);
		$update     = $ayarkaydet->execute(
			array(
				'ad'    => $_POST[ 'omenu_ad' ],
				'link'  => $_POST[ 'omenu_link' ],
				'ust'   => $_POST[ 'omenu_ust' ],
				'durum' => $_POST[ 'omenu_ust' ],
				'sira'  => $_POST[ 'omenu_sira' ]
			)
		);
	}
	if ( $update )
	{
		$ayarkaydet = $db->prepare(
			"UPDATE omenu SET
			omenu_durum=:durum
			WHERE omenu_id={$_POST[ 'omenu_ust' ]}"
		);
		$update     = $ayarkaydet->execute(
			array(
				'durum' => $_POST[ 'omenu_ust' ]
			)
		);
		Header( "Location:../menu.php?&status=ok" );
	}
	else
	{
		Header( "Location:../menu.php?status=no" );
	}
}
if ( isset( $_POST[ 'flinkekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"INSERT INTO flink SET
		flink_ad=:ad,
		flink_link=:link
		"
	);
	$update     = $ayarkaydet->execute(
		array(
			'ad'   => $_POST[ 'flink_ad' ],
			'link' => $_POST[ 'flink_link' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../alt-link.php?&status=ok" );
	}
	else
	{
		Header( "Location:../alt-link.php?status=no" );
	}
}
if ( isset( $_POST[ 'fmenuekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"INSERT INTO fmenu SET
		fmenu_ad=:ad,
		fmenu_link=:link,
		fmenu_sira=:sira
		"
	);
	$update     = $ayarkaydet->execute(
		array(
			'ad'   => $_POST[ 'fmenu_ad' ],
			'link' => $_POST[ 'fmenu_link' ],
			'sira' => $_POST[ 'fmenu_sira' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../alt-menu.php?&status=ok" );
	}
	else
	{
		Header( "Location:../alt-menu.php?status=no" );
	}
}
if ( isset( $_POST[ 'urunresimekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$uploads_dir    = '../assets/img/urunler';
	$tmp_name       = $_FILES[ 'resim_link' ][ "tmp_name" ];
	$benzersizsayi1 = rand( 20000, 32000 );
	$benzersizsayi2 = rand( 20000, 32000 );
	$uzanti         = '.jpg';
	$benzersizad    = $benzersizsayi1 . $benzersizsayi2;
	$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizad . $uzanti;
	move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizad$uzanti" );
	$kaydet = $db->prepare(
		"INSERT INTO resim SET
		resim_urun=:urun,
		resim_link=:link
		"
	);
	$insert = $kaydet->execute(
		array(
			'urun' => $_POST[ 'resim_urun' ],
			'link' => $refimgyol
		)
	);
	if ( $insert )
	{
		Header( "Location:../urunler.php?status=ok" );
	}
	else
	{
		Header( "Location:../urunler.php?status=no" );
	}
}
if ( isset( $_POST[ 'slaytduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		Header( "Location:../../trex" );
		exit();
	}
	if ( $_FILES[ 'slayt_resim' ][ "size" ] > 0 )
	{
		$uploads_dir = '../assets/img/slayt';
		@$tmp_name = $_FILES[ 'slayt_resim' ][ "tmp_name" ];
		$benzersizsayi4 = rand( 20000, 32000 );
		$uzanti = '.jpg';
		$refimgyol2     = substr( $uploads_dir, 3 ) . "/" . $benzersizsayi4 . $uzanti;
		@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizsayi4$uzanti" );
		$ayarkaydet = $db->prepare(
			"UPDATE slayt SET
			slayt_sira=:sira,
			slayt_baslik=:baslik,
			slayt_butonlink=:butonlink,
			slayt_renk=:renk,
			slayt_butonad=:butonad,
			slayt_aciklama=:aciklama,
			slayt_resim=:resim
			WHERE slayt_id={$_POST['slayt_id']}"
		);
		$update     = $ayarkaydet->execute(
			array(
				'sira'     => $_POST[ 'slayt_sira' ],
				'baslik'     => $_POST[ 'slayt_baslik' ],
				'butonlink'     => $_POST[ 'slayt_butonlink' ],
				'renk'     => $_POST[ 'slayt_renk' ],
				'butonad'     => $_POST[ 'slayt_butonad' ],
				'aciklama' => $_POST[ 'slayt_aciklama' ],
				'resim' => $refimgyol2
			)
		);
		if ( $update )
		{
			$resimsilunlink = $_POST[ 'eski_yol' ];
			unlink( "../$resimsilunlink" );
			Header( "Location:../slayt.php?status=ok" );
		}
		else
		{
			Header( "Location:../slayt.php?status=no" );
		}
	} else {
		$ayarkaydet = $db->prepare(
			"UPDATE slayt SET
			slayt_sira=:sira,
			slayt_baslik=:baslik,
			slayt_butonlink=:butonlink,
			slayt_renk=:renk,
			slayt_butonad=:butonad,
			slayt_aciklama=:aciklama
			WHERE slayt_id={$_POST['slayt_id']}"
		);
		$update     = $ayarkaydet->execute(
			array(
				'sira'     => $_POST[ 'slayt_sira' ],
				'baslik'     => $_POST[ 'slayt_baslik' ],
				'butonlink'     => $_POST[ 'slayt_butonlink' ],
				'renk'     => $_POST[ 'slayt_renk' ],
				'butonad'     => $_POST[ 'slayt_butonad' ],
				'aciklama' => $_POST[ 'slayt_aciklama' ]
			)
		);
		if ( $update )
		{
			Header( "Location:../slayt.php?status=ok" );
		}
		else
		{
			Header( "Location:../slayt.php?status=no" );
		}
	}
}
if ( isset( $_POST[ 'uyepanelduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE uye SET
		uye_ad=:ad,
		uye_soyad=:soyad,
		uye_tel=:tel,
		uye_mail=:mail,
		uye_tc=:tc,
		uye_onaytel=:onaytel,
		uye_onaymail=:onaymail,
		uye_adres=:adres
		WHERE uye_id={$_POST['uye_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'ad'       => $_POST[ 'uye_ad' ],
			'soyad'    => $_POST[ 'uye_soyad' ],
			'tel'      => $_POST[ 'uye_tel' ],
			'mail'     => $_POST[ 'uye_mail' ],
			'tc'       => $_POST[ 'uye_tc' ],
			'onaytel'  => $_POST[ 'uye_onaytel' ],
			'onaymail' => $_POST[ 'uye_onaymail' ],
			'adres'    => $_POST[ 'uye_adres' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../uyeler.php?status=ok" );
	}
	else
	{
		Header( "Location:../uyeler.php?status=no" );
	}
}
if ( isset( $_POST[ 'duyuruduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE duyuru SET
		duyuru_baslik=:baslik,
		duyuru_detay=:detay,
		duyuru_durum=:durum
		WHERE duyuru_id={$_POST['duyuru_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'baslik' => $_POST[ 'duyuru_baslik' ],
			'detay'  => $_POST[ 'duyuru_detay' ],
			'durum'  => $_POST[ 'duyuru_durum' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../duyurular.php?status=ok" );
	}
	else
	{
		Header( "Location:../duyurular.php?status=no" );
	}
}
if ( isset( $_POST[ 'hizmetduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	if ( $_FILES[ 'hizmet_resim' ][ "size" ] > 0 )
	{
		$uploads_dir = '../assets/img/hizmetler';
		@$tmp_name = $_FILES[ 'hizmet_resim' ][ "tmp_name" ];
		@$name = $_FILES[ 'hizmet_resim' ][ "name" ];
		$benzersizsayi1 = rand( 20000, 32000 );
		$benzersizsayi2 = rand( 20000, 32000 );
		$uzanti         = '.jpg';
		$benzersizad    = $benzersizsayi1 . $benzersizsayi2;
		$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizad . $uzanti;
		@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizad$uzanti" );
		$ayarkaydet = $db->prepare(
			"UPDATE hizmetler SET
			hizmet_baslik=:baslik,
			hizmet_icerik=:icerik,
			hizmet_title=:title,
			hizmet_descr=:descr,
			hizmet_keyword=:keyword,
			hizmet_vitrin=:vitrin,
			hizmet_resim=:resim,
			hizmet_icon=:icon
			WHERE hizmet_id={$_POST['hizmet_id']}"
		);
		$update     = $ayarkaydet->execute(
			array(
				'baslik'  => $_POST[ 'hizmet_baslik' ],
				'icerik'  => $_POST[ 'hizmet_icerik' ],
				'title'   => $_POST[ 'hizmet_title' ],
				'descr'   => $_POST[ 'hizmet_descr' ],
				'keyword' => $_POST[ 'hizmet_keyword' ],
				'vitrin'  => $_POST[ 'hizmet_vitrin' ],
				'resim'   => $refimgyol,
				'icon'    => $_POST[ 'hizmet_icon' ]
			)
		);
		if ( $update )
		{
			$resimsilunlink = $_POST[ 'eski_yol' ];
			unlink( "../$resimsilunlink" );
			Header( "Location:../hizmetler.php?status=ok" );
		}
		else
		{
			Header( "Location:../hizmetler.php?status=no" );
		}
	}
	else
	{
		$ayarkaydet = $db->prepare(
			"UPDATE hizmetler SET
			hizmet_baslik=:baslik,
			hizmet_icerik=:icerik,
			hizmet_title=:title,
			hizmet_descr=:descr,
			hizmet_keyword=:keyword,
			hizmet_vitrin=:vitrin,
			hizmet_icon=:icon
			WHERE hizmet_id={$_POST['hizmet_id']}"
		);
		$update     = $ayarkaydet->execute(
			array(
				'baslik'  => $_POST[ 'hizmet_baslik' ],
				'icerik'  => $_POST[ 'hizmet_icerik' ],
				'title'   => $_POST[ 'hizmet_title' ],
				'descr'   => $_POST[ 'hizmet_descr' ],
				'keyword' => $_POST[ 'hizmet_keyword' ],
				'vitrin'  => $_POST[ 'hizmet_vitrin' ],
				'icon'    => $_POST[ 'hizmet_icon' ]
			)
		);
		if ( $update )
		{
			Header( "Location:../hizmetler.php?status=ok" );
		}
		else
		{
			Header( "Location:../hizmetler.php?status=no" );
		}
	}
}
if ( isset( $_POST[ 'markaduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	if ( $_FILES[ 'hizmet_resim' ][ "size" ] > 0 )
	{
		$uploads_dir = '../assets/img/hizmetler';
		@$tmp_name = $_FILES[ 'hizmet_resim' ][ "tmp_name" ];
		@$name = $_FILES[ 'hizmet_resim' ][ "name" ];
		$benzersizsayi1 = rand( 20000, 32000 );
		$benzersizsayi2 = rand( 20000, 32000 );
		$uzanti         = '.jpg';
		$benzersizad    = $benzersizsayi1 . $benzersizsayi2;
		$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizad . $uzanti;
		@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizad$uzanti" );
		$ayarkaydet = $db->prepare(
			"UPDATE markalar SET
			hizmet_baslik=:baslik,
			hizmet_icerik=:icerik,
			hizmet_title=:title,
			hizmet_descr=:descr,
			hizmet_keyword=:keyword,
			hizmet_resim=:resim,
			hizmet_icon=:icon
			WHERE hizmet_id={$_POST['hizmet_id']}"
		);
		$update     = $ayarkaydet->execute(
			array(
				'baslik'  => $_POST[ 'hizmet_baslik' ],
				'icerik'  => $_POST[ 'hizmet_icerik' ],
				'title'   => $_POST[ 'hizmet_title' ],
				'descr'   => $_POST[ 'hizmet_descr' ],
				'keyword' => $_POST[ 'hizmet_keyword' ],
				'resim'   => $refimgyol,
				'icon'    => $_POST[ 'hizmet_icon' ]
			)
		);
		if ( $update )
		{
			$resimsilunlink = $_POST[ 'eski_yol' ];
			unlink( "../$resimsilunlink" );
			Header( "Location:../markalar.php?status=ok" );
		}
		else
		{
			Header( "Location:../markalar.php?status=no" );
		}
	}
	else
	{
		$ayarkaydet = $db->prepare(
			"UPDATE markalar SET
			hizmet_baslik=:baslik,
			hizmet_icerik=:icerik,
			hizmet_title=:title,
			hizmet_descr=:descr,
			hizmet_keyword=:keyword,
			hizmet_vitrin=:vitrin,
			hizmet_icon=:icon
			WHERE hizmet_id={$_POST['hizmet_id']}"
		);
		$update     = $ayarkaydet->execute(
			array(
				'baslik'  => $_POST[ 'hizmet_baslik' ],
				'icerik'  => $_POST[ 'hizmet_icerik' ],
				'title'   => $_POST[ 'hizmet_title' ],
				'descr'   => $_POST[ 'hizmet_descr' ],
				'keyword' => $_POST[ 'hizmet_keyword' ],
				'vitrin'  => $_POST[ 'hizmet_vitrin' ],
				'icon'    => $_POST[ 'hizmet_icon' ]
			)
		);
		if ( $update )
		{
			Header( "Location:../markalar.php?status=ok" );
		}
		else
		{
			Header( "Location:../markalar.php?status=no" );
		}
	}
}
if ( isset( $_POST[ 'urunduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE urunler SET
		link=:link,
		urun_demo=:demo,
		alanadi=:alanadi,
		hosting=:hosting,
		eklenti=:eklenti,
		urun_admin=:admin,
		urun_auser=:auser,
		urun_apass=:apass,
		urun_baslik=:baslik,
		urun_kategori=:kategori,
		urun_fiyat=:fiyat,
		urun_efiyat=:efiyat,
		urun_aciklama=:aciklama,
		urun_vitrin=:vitrin,
		urun_title=:title,
		urun_descr=:descr,
		urun_keyword=:keyword
		WHERE urun_id={$_POST['urun_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'link'     => $_POST[ 'link' ],
			'demo'     => $_POST[ 'urun_demo' ],
			'alanadi'     => $_POST[ 'alanadi' ],
			'hosting'     => $_POST[ 'hosting' ],
			'eklenti'     => $_POST[ 'eklenti' ],
			'admin'    => $_POST[ 'urun_admin' ],
			'auser'    => $_POST[ 'urun_auser' ],
			'apass'    => $_POST[ 'urun_apass' ],
			'baslik'   => $_POST[ 'urun_baslik' ],
			'kategori' => $_POST[ 'urun_kategori' ],
			'fiyat'    => $_POST[ 'urun_fiyat' ],
			'efiyat'   => $_POST[ 'urun_efiyat' ],
			'aciklama' => $_POST[ 'urun_aciklama' ],
			'vitrin'   => $_POST[ 'urun_vitrin' ],
			'title'    => $_POST[ 'urun_title' ],
			'descr'    => $_POST[ 'urun_descr' ],
			'keyword'  => $_POST[ 'urun_keyword' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../urunler.php?status=ok" );
	}
	else
	{
		Header( "Location:../urunler.php?status=no" );
	}
}
if ( isset( $_POST[ 'projeduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	if ( $_FILES[ 'proje_resim' ][ "size" ] > 0 )
	{
		$uploads_dir = '../assets/img/projeler';
		@$tmp_name = $_FILES[ 'proje_resim' ][ "tmp_name" ];
		@$name = $_FILES[ 'proje_resim' ][ "name" ];
		$benzersizsayi1 = rand( 20000, 32000 );
		$benzersizsayi2 = rand( 20000, 32000 );
		$uzanti         = '.jpg';
		$benzersizad    = $benzersizsayi1 . $benzersizsayi2;
		$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizad . $uzanti;
		@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizad$uzanti" );
		$ayarkaydet = $db->prepare(
			"UPDATE projeler SET
			proje_baslik=:baslik,
			proje_icerik=:icerik,
			kategori=:kategori,
			proje_resim=:resim,
			proje_title=:title,
			proje_descr=:descr,
			proje_keyword=:keyword
			WHERE proje_id={$_POST['proje_id']}"
		);
		$update     = $ayarkaydet->execute(
			array(
				'baslik'  => $_POST[ 'proje_baslik' ],
				'icerik'  => $_POST[ 'proje_icerik' ],
				'kategori'  => $_POST[ 'kategori' ],
				'resim'   => $refimgyol,
				'title'   => $_POST[ 'proje_title' ],
				'descr'   => $_POST[ 'proje_descr' ],
				'keyword' => $_POST[ 'proje_keyword' ]
			)
		);
		if ( $update )
		{
			$resimsilunlink = $_POST[ 'eski_yol' ];
			unlink( "../$resimsilunlink" );
			Header( "Location:../projeler.php?status=ok" );
		}
		else
		{
			Header( "Location:../projeler.php?status=no" );
		}
	}
	else
	{
		$ayarkaydet = $db->prepare(
			"UPDATE projeler SET
			proje_baslik=:baslik,
			kategori=:kategori,
			proje_icerik=:icerik,
			proje_vitrin=:vitrin,
			proje_title=:title,
			proje_descr=:descr,
			proje_keyword=:keyword
			WHERE proje_id={$_POST['proje_id']}"
		);
		$update     = $ayarkaydet->execute(
			array(
				'baslik'  => $_POST[ 'proje_baslik' ],
				'kategori'  => $_POST[ 'kategori' ],
				'icerik'  => $_POST[ 'proje_icerik' ],
				'vitrin'  => $_POST[ 'proje_vitrin' ],
				'title'   => $_POST[ 'proje_title' ],
				'descr'   => $_POST[ 'proje_descr' ],
				'keyword' => $_POST[ 'proje_keyword' ]
			)
		);
		if ( $update )
		{
			Header( "Location:../projeler.php?status=ok" );
		}
		else
		{
			Header( "Location:../projeler.php?status=no" );
		}
	}
}
if ( $_GET[ 'urunkategorisil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from kategoriler where kategori_id=:kategori_id" );
	$kontrol = $sil->execute(
		array(
			'kategori_id' => $_GET[ 'kategori_id' ]
		)
	);
	if ( $kontrol )
	{
		$resimsilunlink = $_GET[ 'urun_resim' ];
		unlink( "../$resimsilunlink" );
		Header( "Location:../urun-kategori.php?status=ok" );
	}
	else
	{
		Header( "Location:../urun-kategori.php?status=no" );
	}
}
if ( $_GET[ 'paketkategorisil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from kategoripaket where kategori_id=:kategori_id" );
	$kontrol = $sil->execute(
		array(
			'kategori_id' => $_GET[ 'kategori_id' ]
		)
	);
	if ( $kontrol )
	{
		$resimsilunlink = $_GET[ 'urun_resim' ];
		unlink( "../$resimsilunlink" );
		Header( "Location:../paket-kategori.php?status=ok" );
	}
	else
	{
		Header( "Location:../paket-kategori.php?status=no" );
	}
}
if ( $_GET[ 'projekategorisil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from kategoriproje where kategori_id=:kategori_id" );
	$kontrol = $sil->execute(
		array(
			'kategori_id' => $_GET[ 'kategori_id' ]
		)
	);
	if ( $kontrol )
	{
		$resimsilunlink = $_GET[ 'urun_resim' ];
		unlink( "../$resimsilunlink" );
		Header( "Location:../proje-kategori.php?status=ok" );
	}
	else
	{
		Header( "Location:../proje-kategori.php?status=no" );
	}
}
if ( $_GET[ 'urunsil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from urunler where urun_id=:urun_id" );
	$kontrol = $sil->execute(
		array(
			'urun_id' => $_GET[ 'urun_id' ]
		)
	);
	if ( $kontrol )
	{
		$resimsilunlink = $_GET[ 'urun_resim' ];
		unlink( "../$resimsilunlink" );
		Header( "Location:../urunler.php?status=ok" );
	}
	else
	{
		Header( "Location:../urunler.php?status=no" );
	}
}
if ( $_GET[ 'urunresimdetaysil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from resim where resim_id=:resim_id" );
	$kontrol = $sil->execute(
		array(
			'resim_id' => $_GET[ 'resim_id' ]
		)
	);
	if ( $kontrol )
	{
		$resimsilunlink = $_GET[ 'resim_link' ];
		unlink( "../$resimsilunlink" );
		Header( "Location:../urunler.php?status=ok" );
	}
	else
	{
		Header( "Location:../urunler.php?status=no" );
	}
}
if ( $_GET[ 'referanssil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from referanslar where referans_id=:referans_id" );
	$kontrol = $sil->execute(
		array(
			'referans_id' => $_GET[ 'referans_id' ]
		)
	);
	if ( $kontrol )
	{
		$resimsilunlink = $_GET[ 'referans_resim1' ];
		unlink( "../$resimsilunlink" );
		Header( "Location:../referanslar.php?status=ok" );
	}
	else
	{
		Header( "Location:../referanslar.php?status=no" );
	}
}
if ( $_GET[ 'slaytsil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from slayt where slayt_id=:slayt_id" );
	$kontrol = $sil->execute(
		array(
			'slayt_id' => $_GET[ 'slayt_id' ]
		)
	);
	if ( $kontrol )
	{
		$resimsilunlink = $_GET[ 'slayt_resim' ];
		unlink( "../$resimsilunlink" );
		Header( "Location:../slayt.php?status=ok" );
	}
	else
	{
		Header( "Location:../slayt.php?status=no" );
	}
}
if ( $_GET[ 'videosil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from videogaleri where video_id=:video_id" );
	$kontrol = $sil->execute(
		array(
			'video_id' => $_GET[ 'video_id' ]
		)
	);
	if ( $kontrol )
	{
		$resimsilunlink = $_GET[ 'video_resim' ];
		unlink( "../$resimsilunlink" );
		Header( "Location:../video-galerisi.php?status=ok" );
	}
	else
	{
		Header( "Location:../video-galerisi.php?status=no" );
	}
}
if ( $_GET[ 'resimsil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from resimgaleri where resim_id=:resim_id" );
	$kontrol = $sil->execute(
		array(
			'resim_id' => $_GET[ 'resim_id' ]
		)
	);
	if ( $kontrol )
	{
		$resimsilunlink = $_GET[ 'eski_yol' ];
		unlink( "../$resimsilunlink" );
		Header( "Location:../resim-galerisi.php?status=ok" );
	}
	else
	{
		Header( "Location:../resim-galerisi.php?status=no" );
	}
}
if ( $_GET[ 'yorumsil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from yorumlar where yorum_id=:yorum_id" );
	$kontrol = $sil->execute(
		array(
			'yorum_id' => $_GET[ 'yorum_id' ]
		)
	);
	if ( $kontrol )
	{
		$resimsilunlink = $_GET[ 'yorum_resim' ];
		unlink( "../$resimsilunlink" );
		Header( "Location:../yorumlar.php?status=ok" );
	}
	else
	{
		Header( "Location:../yorumlar.php?status=no" );
	}
}
if ( $_GET[ 'markasil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from markalar where hizmet_id=:hizmet_id" );
	$kontrol = $sil->execute(
		array(
			'hizmet_id' => $_GET[ 'hizmet_id' ]
		)
	);
	if ( $kontrol )
	{
		Header( "Location:../markalar.php?status=ok" );
	}
	else
	{
		Header( "Location:../markalar.php?status=no" );
	}
}
if ( $_GET[ 'duyurusil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from duyuru where duyuru_id=:duyuru_id" );
	$kontrol = $sil->execute(
		array(
			'duyuru_id' => $_GET[ 'duyuru_id' ]
		)
	);
	if ( $kontrol )
	{
		Header( "Location:../duyurular.php?status=ok" );
	}
	else
	{
		Header( "Location:../duyurular.php?status=no" );
	}
}
if ( $_GET[ 'uyesil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from uye where uye_id=:uye_id" );
	$kontrol = $sil->execute(
		array(
			'uye_id' => $_GET[ 'uye_id' ]
		)
	);
	if ( $kontrol )
	{
		Header( "Location:../uyeler.php?status=ok" );
	}
	else
	{
		Header( "Location:../uyeler.php?status=no" );
	}
}
if ( $_GET[ 'hizmetsil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from hizmetler where hizmet_id=:hizmet_id" );
	$kontrol = $sil->execute(
		array(
			'hizmet_id' => $_GET[ 'hizmet_id' ]
		)
	);
	if ( $kontrol )
	{
		Header( "Location:../hizmetler.php?status=ok" );
	}
	else
	{
		Header( "Location:../hizmetler.php?status=no" );
	}
}
if ( $_GET[ 'projesil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from projeler where proje_id=:proje_id" );
	$kontrol = $sil->execute(
		array(
			'proje_id' => $_GET[ 'proje_id' ]
		)
	);
	if ( $kontrol )
	{
		$resimsilunlink = $_GET[ 'proje_resim' ];
		unlink( "../../$resimsilunlink" );
		Header( "Location:../projeler.php?status=ok" );
	}
	else
	{
		Header( "Location:../projeler.php?status=no" );
	}
}
if ( $_GET[ 'sosyalsil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from sosyal where sosyal_id=:sosyal_id" );
	$kontrol = $sil->execute(
		array(
			'sosyal_id' => $_GET[ 'sosyal_id' ]
		)
	);
	if ( $kontrol )
	{
		Header( "Location:../sosyal-medya.php?status=ok" );
	}
	else
	{
		Header( "Location:../sosyal-medya.php?status=no" );
	}
}
if ( $_GET[ 'mesajsil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from mesajlar where mesaj_id=:mesaj_id" );
	$kontrol = $sil->execute(
		array(
			'mesaj_id' => $_GET[ 'mesaj_id' ]
		)
	);
	if ( $kontrol )
	{
		Header( "Location:../index.php?status=ok" );
	}
	else
	{
		Header( "Location:../index.php?status=no" );
	}
}
if ( $_GET[ 'bildirimsil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from odemebildirim where id=:mesaj_id" );
	$kontrol = $sil->execute(
		array(
			'mesaj_id' => $_GET[ 'bildirim_id' ]
		)
	);
	if ( $kontrol )
	{
		Header( "Location:../index.php?status=ok" );
	}
	else
	{
		Header( "Location:../index.php?status=no" );
	}
}
if ( $_GET[ 'kategorisil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from kategoriler where kategori_id=:kategori_id" );
	$kontrol = $sil->execute(
		array(
			'kategori_id' => $_GET[ 'kategori_id' ]
		)
	);
	if ( $kontrol )
	{
		Header( "Location:../kategoriler.php?status=ok" );
	}
	else
	{
		Header( "Location:../kategoriler.php?status=no" );
	}
}
if ( $_GET[ 'flinksil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from flink where flink_id=:flink_id" );
	$kontrol = $sil->execute(
		array(
			'flink_id' => $_GET[ 'flink_id' ]
		)
	);
	if ( $kontrol )
	{
		Header( "Location:../alt-link.php?status=ok" );
	}
	else
	{
		Header( "Location:../alt-link.php?status=no" );
	}
}
if ( $_GET[ 'fmenusil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from fmenu where fmenu_id=:fmenu_id" );
	$kontrol = $sil->execute(
		array(
			'fmenu_id' => $_GET[ 'fmenu_id' ]
		)
	);
	if ( $kontrol )
	{
		Header( "Location:../alt-menu.php?status=ok" );
	}
	else
	{
		Header( "Location:../alt-menu.php?status=no" );
	}
}
if ( $_GET[ 'omenusil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from omenu where omenu_id=:omenu_id" );
	$kontrol = $sil->execute(
		array(
			'omenu_id' => $_GET[ 'omenu_id' ]
		)
	);
	if ( $kontrol )
	{
		$menulistixl=$db->prepare("SELECT * from omenu where omenu_ust=:UstMenux");
		$menulistixl->execute(array('UstMenux' => $_GET[ 'omenu_ust' ])); 
		$KontSay=$menulistixl->rowCount();
		if ($KontSay=='0') {
			$eski=$_GET[ 'omenu_ust' ];
			$ayarkaydet = $db->prepare(
				"UPDATE omenu SET
				omenu_durum=:durum
				WHERE omenu_id={$eski}"
			);
			$update     = $ayarkaydet->execute(
				array(
					'durum' => '0'
				)
			);
		}
		Header( "Location:../menu.php?status=ok" );
	}
	else
	{
		Header( "Location:../menu.php?status=no" );
	}
}
if ( $_GET[ 'ssssil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from sss where sss_id=:sss_id" );
	$kontrol = $sil->execute(
		array(
			'sss_id' => $_GET[ 'sss_id' ]
		)
	);
	if ( $kontrol )
	{
		Header( "Location:../sss.php?status=ok" );
	}
	else
	{
		Header( "Location:../sss.php?status=no" );
	}
}
if ( isset( $_POST[ 'duyuruekle' ] ) )
{
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	$kaydet = $db->prepare(
		"INSERT INTO duyuru SET
		duyuru_baslik=:baslik,
		duyuru_detay=:detay"
	);
	$insert = $kaydet->execute(
		array(
			'baslik' => $_POST[ 'duyuru_baslik' ],
			'detay'  => $_POST[ 'duyuru_detay' ]
		)
	);
	if ( $insert )
	{
		Header( "Location:../duyurular.php?status=ok" );
	}
	else
	{
		Header( "Location:../duyurular.php?status=no" );
	}
}
if ( isset( $_POST[ 'hizmetekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$uploads_dir = '../assets/img/hizmetler';
	@$tmp_name = $_FILES[ 'hizmet_resim' ][ "tmp_name" ];
	$benzersizsayi1 = rand( 20000, 32000 );
	$benzersizsayi2 = rand( 20000, 32000 );
	$uzanti         = '.jpg';
	$benzersizad    = $benzersizsayi1 . $benzersizsayi2;
	$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizad . $uzanti;
	@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizad$uzanti" );
	$kaydet = $db->prepare(
		"INSERT INTO hizmetler SET
		hizmet_baslik=:baslik,
		hizmet_icerik=:icerik,
		hizmet_title=:title,
		hizmet_descr=:descr,
		hizmet_keyword=:keyword,
		hizmet_vitrin=:vitrin,
		hizmet_resim=:resim"
	);
	$insert = $kaydet->execute(
		array(
			'baslik'  => $_POST[ 'hizmet_baslik' ],
			'icerik'  => $_POST[ 'hizmet_icerik' ],
			'title'   => $_POST[ 'hizmet_title' ],
			'descr'   => $_POST[ 'hizmet_descr' ],
			'keyword' => $_POST[ 'hizmet_keyword' ],
			'vitrin'  => $_POST[ 'hizmet_vitrin' ],
			'resim'   => $refimgyol
		)
	);
	if ( $insert )
	{
		Header( "Location:../hizmetler.php?status=ok" );
	}
	else
	{
		Header( "Location:../hizmetler.php?status=no" );
	}
}
if ( isset( $_POST[ 'markaekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$uploads_dir = '../assets/img/hizmetler';
	@$tmp_name = $_FILES[ 'hizmet_resim' ][ "tmp_name" ];
	$benzersizsayi1 = rand( 20000, 32000 );
	$benzersizsayi2 = rand( 20000, 32000 );
	$uzanti         = '.jpg';
	$benzersizad    = $benzersizsayi1 . $benzersizsayi2;
	$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizad . $uzanti;
	@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizad$uzanti" );
	$kaydet = $db->prepare(
		"INSERT INTO markalar SET
		hizmet_baslik=:baslik,
		hizmet_icerik=:icerik,
		hizmet_title=:title,
		hizmet_descr=:descr,
		hizmet_keyword=:keyword,
		hizmet_vitrin=:vitrin,
		hizmet_resim=:resim"
	);
	$insert = $kaydet->execute(
		array(
			'baslik'  => $_POST[ 'hizmet_baslik' ],
			'icerik'  => $_POST[ 'hizmet_icerik' ],
			'title'   => $_POST[ 'hizmet_title' ],
			'descr'   => $_POST[ 'hizmet_descr' ],
			'keyword' => $_POST[ 'hizmet_keyword' ],
			'vitrin'  => $_POST[ 'hizmet_vitrin' ],
			'resim'   => $refimgyol
		)
	);
	if ( $insert )
	{
		Header( "Location:../markalar.php?status=ok" );
	}
	else
	{
		Header( "Location:../markalar.php?status=no" );
	}
}
if ( isset( $_POST[ 'hesapekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$kaydet = $db->prepare(
		"INSERT INTO hesap SET
		hesap_banka=:banka,
		hesap_isim=:isim,
		hesap_sube=:sube,
		hesap_no=:no,
		hesap_iban=:iban
		"
	);
	$insert = $kaydet->execute(
		array(
			'banka' => $_POST[ 'hesap_banka' ],
			'isim'  => $_POST[ 'hesap_isim' ],
			'sube'  => $_POST[ 'hesap_sube' ],
			'no'    => $_POST[ 'hesap_no' ],
			'iban'  => $_POST[ 'hesap_iban' ]
		)
	);
	if ( $insert )
	{
		Header( "Location:../hesaplarim.php?status=ok" );
	}
	else
	{
		Header( "Location:../hesaplarim.php?status=no" );
	}
}
if ( isset( $_POST[ 'hesapduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$duzenle = $db->prepare(
		"UPDATE hesap SET
		hesap_banka=:banka,
		hesap_isim=:isim,
		hesap_sube=:sube,
		hesap_no=:no,
		hesap_iban=:iban
		WHERE hesap_id={$_POST['hesap_id']}"
	);
	$update  = $duzenle->execute(
		array(
			'banka' => $_POST[ 'hesap_banka' ],
			'isim'  => $_POST[ 'hesap_isim' ],
			'sube'  => $_POST[ 'hesap_sube' ],
			'no'    => $_POST[ 'hesap_no' ],
			'iban'  => $_POST[ 'hesap_iban' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../hesaplarim.php?status=ok" );
	}
	else
	{
		Header( "Location:../hesaplarim.php?status=no" );
	}
}
if ( $_GET[ 'hesapsil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from hesap where hesap_id=:hesap_id" );
	$kontrol = $sil->execute(
		array(
			'hesap_id' => $_GET[ 'hesap_id' ]
		)
	);
	if ( $kontrol )
	{
		Header( "Location:../hesaplarim.php?status=ok" );
	}
	else
	{
		Header( "Location:../hesaplarim.php?status=no" );
	}
}
if ( isset( $_POST[ 'yorumekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$uploads_dir = '../assets/img/yorumlar';
	@$tmp_name = $_FILES[ 'yorum_resim' ][ "tmp_name" ];
	$benzersizsayi1 = rand( 20000, 32000 );
	$benzersizsayi2 = rand( 20000, 32000 );
	$benzersizsayi3 = rand( 20000, 32000 );
	$benzersizsayi4 = rand( 20000, 32000 );
	$uzanti         = '.jpg';
	$benzersizad    = $benzersizsayi1 . $benzersizsayi2 . $benzersizsayi3 . $benzersizsayi4;
	$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizad . $uzanti;
	@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizad$uzanti" );
	$kaydet = $db->prepare(
		"INSERT INTO yorumlar SET
		yorum_isim=:isim,
		yorum_icerik=:icerik,
		yorum_resim=:resim"
	);
	$insert = $kaydet->execute(
		array(
			'isim'   => $_POST[ 'yorum_isim' ],
			'icerik' => $_POST[ 'yorum_icerik' ],
			'resim'  => $refimgyol
		)
	);
	if ( $insert )
	{
		Header( "Location:../yorumlar.php?status=ok" );
	}
	else
	{
		Header( "Location:../yorumlar.php?status=no" );
	}
}
if ( isset( $_POST[ 'projeekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$uploads_dir = '../assets/img/projeler';
	@$tmp_name = $_FILES[ 'proje_resim' ][ "tmp_name" ];
	$benzersizsayi1 = rand( 20000, 32000 );
	$benzersizsayi2 = rand( 20000, 32000 );
	$uzanti         = '.jpg';
	$benzersizad    = $benzersizsayi1 . $benzersizsayi2;
	$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizad . $uzanti;
	@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizad$uzanti" );
	$kaydet = $db->prepare(
		"INSERT INTO projeler SET
		proje_baslik=:baslik,
		kategori=:kategori,
		proje_icerik=:icerik,
		proje_resim=:resim,
		proje_title=:title,
		proje_descr=:descr,
		proje_keyword=:keyword"
	);
	$insert = $kaydet->execute(
		array(
			'baslik'  => $_POST[ 'proje_baslik' ],
			'kategori'  => $_POST[ 'kategori' ],
			'icerik'  => $_POST[ 'proje_icerik' ],
			'resim'   => $refimgyol,
			'title'   => $_POST[ 'proje_title' ],
			'descr'   => $_POST[ 'proje_descr' ],
			'keyword' => $_POST[ 'proje_keyword' ]
		)
	);
	if ( $insert )
	{
		Header( "Location:../projeler.php?status=ok" );
	}
	else
	{
		Header( "Location:../projeler.php?status=no" );
	}
}
if ( isset( $_POST[ 'slaytekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		Header( "Location:../../trex" );
		exit();
	}
	$uploads_dir = '../assets/img/slayt';
	$tmp_name = $_FILES[ 'slayt_resim' ][ "tmp_name" ];
	$benzersizsayi1 = rand( 20000, 32000 );
	$benzersizsayi2 = rand( 20000, 32000 );
	$uzanti = '.jpg';
	$benzersizad    = $benzersizsayi1 . $benzersizsayi2 ;
	$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizad . $uzanti;
	move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizad$uzanti" );
	$kaydet = $db->prepare(
		"INSERT INTO slayt SET
		slayt_baslik=:baslik,
		slayt_aciklama=:aciklama,
		slayt_renk=:renk,
		slayt_sira=:sira,
		slayt_butonad=:butonad,
		slayt_butonlink=:butonlink,
		slayt_resim=:resim");
	$insert = $kaydet->execute(
		array(
			'baslik' => $_POST[ 'slayt_baslik' ],
			'aciklama' => $_POST[ 'slayt_aciklama' ],
			'renk' => $_POST[ 'slayt_renk' ],
			'butonad'     => $_POST[ 'slayt_butonad' ],
			'butonlink' => $_POST[ 'slayt_butonlink' ],
			'sira'     => $_POST[ 'slayt_sira' ],
			'resim'    => $refimgyol
		));
	if ( $insert )
	{
		Header( "Location:../slayt.php?status=ok" );
	}
	else
	{
		Header( "Location:../slayt.php?status=no" );
	}
}
if ( isset( $_POST[ 'urunekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$kaydet = $db->prepare(
		"INSERT INTO urunler SET
		urun_demo=:demo,
		link=:link,
		alanadi=:alanadi,
		hosting=:hosting,
		eklenti=:eklenti,
		urun_admin=:admin,
		urun_auser=:auser,
		urun_apass=:apass,
		urun_baslik=:baslik,
		urun_kategori=:kategori,
		urun_fiyat=:fiyat,
		urun_efiyat=:efiyat,
		urun_aciklama=:aciklama,
		urun_vitrin=:vitrin,
		urun_title=:title,
		urun_descr=:descr,
		urun_keyword=:keyword"
	);
	$insert = $kaydet->execute(
		array(
			'demo'     => $_POST[ 'urun_demo' ],
			'link'     => $_POST[ 'link' ],
			'alanadi'  => $_POST[ 'alanadi' ],
			'hosting'  => $_POST[ 'hosting' ],
			'eklenti'  => $_POST[ 'eklenti' ],
			'admin'    => $_POST[ 'urun_admin' ],
			'auser'    => $_POST[ 'urun_auser' ],
			'apass'    => $_POST[ 'urun_apass' ],
			'baslik'   => $_POST[ 'urun_baslik' ],
			'kategori' => $_POST[ 'urun_kategori' ],
			'fiyat'    => $_POST[ 'urun_fiyat' ],
			'efiyat'   => $_POST[ 'urun_efiyat' ],
			'aciklama' => $_POST[ 'urun_aciklama' ],
			'vitrin'   => $_POST[ 'urun_vitrin' ],
			'title'    => $_POST[ 'urun_title' ],
			'descr'    => $_POST[ 'urun_descr' ],
			'keyword'  => $_POST[ 'urun_keyword' ]
		)
	);
	if ( $insert )
	{
		Header( "Location:../urunler.php?status=ok" );
	}
	else
	{
		Header( "Location:../urunler.php?status=no" );
	}
}
if ( isset( $_POST[ 'refekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$uploads_dir = '../assets/img/referanslar';
	@$tmp_name = $_FILES[ 'referans_resim1' ][ "tmp_name" ];
	$benzersizsayi1 = rand( 20000, 32000 );
	$benzersizsayi2 = rand( 20000, 32000 );
	$uzanti         = '.jpg';
	$benzersizad    = $benzersizsayi1 . $benzersizsayi2;
	$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizad . $uzanti;
	@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizad$uzanti" );
	$kaydet = $db->prepare(
		"INSERT INTO referanslar SET
		referans_adi=:adi,
		referans_kategori=:kategori,
		referans_link=:link,
		referans_resim1=:resim1
		"
	);
	$insert = $kaydet->execute(
		array(
			'adi'      => $_POST[ 'referans_adi' ],
			'kategori' => $_POST[ 'referans_kategori' ],
			'link'     => $_POST[ 'referans_link' ],
			'resim1'   => $refimgyol
		)
	);
	if ( $insert )
	{
		Header( "Location:../referanslar.php?status=ok" );
	}
	else
	{
		Header( "Location:../referanslar.php?status=no" );
	}
}
if ( isset( $_POST[ 'blogduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	if ( $_FILES[ 'blog_resim' ][ "size" ] > 0 )
	{
		$uploads_dir = '../assets/img/blog';
		@$tmp_name = $_FILES[ 'blog_resim' ][ "tmp_name" ];
		$benzersizsayi1 = rand( 20000, 32000 );
		$benzersizsayi2 = rand( 20000, 32000 );
		$uzanti = '.jpg';
		$benzersizad    = $benzersizsayi1 . $benzersizsayi2;
		$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizad . $uzanti;
		@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizad$uzanti" );
		$duzenle = $db->prepare(
			"UPDATE blog SET
			blog_baslik=:baslik,
			blog_kategori=:kategori,
			blog_detay=:detay,
			blog_title=:title,
			blog_descr=:descr,
			blog_keyword=:keyword,
			blog_resim=:resim
			WHERE blog_id={$_POST['blog_id']}"
		);
		$update  = $duzenle->execute(
			array(
				'baslik' => $_POST[ 'blog_baslik' ],
				'kategori' => $_POST[ 'blog_kategori' ],
				'detay'  => $_POST[ 'blog_detay' ],
				'title'  => $_POST[ 'blog_title' ],
				'descr'  => $_POST[ 'blog_descr' ],
				'keyword'  => $_POST[ 'blog_keyword' ],
				'resim'  => $refimgyol
			)
		);
		$blog_id = $_POST[ 'blog_id' ];
		if ( $update )
		{
			$resimsilunlink = $_POST[ 'eski_yol' ];
			unlink( "../$resimsilunlink" );
			Header( "Location:../blog.php?status=ok" );
		}
		else
		{
			Header( "Location:../blog.php?status=no" );
		}
	}
	else
	{
		$duzenle = $db->prepare(
			"UPDATE blog SET
			blog_baslik=:baslik,
			blog_kategori=:kategori,
			blog_title=:title,
			blog_descr=:descr,
			blog_keyword=:keyword,
			blog_detay=:detay
			WHERE blog_id={$_POST['blog_id']}"
		);
		$update  = $duzenle->execute(
			array(
				'baslik' => $_POST[ 'blog_baslik' ],
				'kategori' => $_POST[ 'blog_kategori' ],
				'title'  => $_POST[ 'blog_title' ],
				'descr'  => $_POST[ 'blog_descr' ],
				'keyword'  => $_POST[ 'blog_keyword' ],
				'detay'  => $_POST[ 'blog_detay' ]
			)
		);
		$blog_id = $_POST[ 'blog_id' ];
		if ( $update )
		{
			Header( "Location:../blog.php?status=ok" );
		}
		else
		{
			Header( "Location:../blog.php?status=no" );
		}
	}
}
if ( $_GET[ 'blogsil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from blog where blog_id=:blog_id" );
	$kontrol = $sil->execute(
		array(
			'blog_id' => $_GET[ 'blog_id' ]
		)
	);
	if ( $kontrol )
	{
		Header( "Location:../blog.php?status=ok" );
	}
	else
	{
		Header( "Location:../blog.php?status=no" );
	}
}
if ( isset( $_POST[ 'sayfaduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$duzenle = $db->prepare(
		"UPDATE sayfalar SET
		sayfa_title=:title,
		sayfa_descr=:descr,
		sayfa_keyword=:keyword,
		sayfa_baslik=:baslik,
		sayfa_menu=:menu,
		sayfa_icerik=:icerik
		WHERE sayfa_id={$_POST['sayfa_id']}"
	);
	$update  = $duzenle->execute(
		array(
			'title'   => $_POST[ 'sayfa_title' ],
			'descr'   => $_POST[ 'sayfa_descr' ],
			'keyword' => $_POST[ 'sayfa_keyword' ],
			'baslik'  => $_POST[ 'sayfa_baslik' ],
			'menu'    => $_POST[ 'sayfa_menu' ],
			'icerik'  => $_POST[ 'sayfa_icerik' ]
		)
	);
	$sayfa_id = $_POST[ 'sayfa_id' ];
	if ( $update )
	{
		Header( "Location:../sayfalar.php?status=ok" );
	}
	else
	{
		Header( "Location:../sayfalar.php?status=no" );
	}
}
if ( isset( $_POST[ 'eklentiduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$duzenle = $db->prepare(
		"UPDATE eklenti SET
		ad=:ad,
		fiyat=:fiyat,
		cinsi=:cinsi,
		aciklama=:aciklama,
		sira=:sira
		WHERE id={$_POST['id']}"
	);
	$update  = $duzenle->execute(
		array(
			'ad' => $_POST[ 'ad' ],
			'fiyat'  => $_POST[ 'fiyat' ],
			'cinsi'  => $_POST[ 'cinsi' ],
			'aciklama'    => $_POST[ 'aciklama' ],
			'sira'  => $_POST[ 'sira' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../eklentiler.php?status=ok" );
	}
	else
	{
		Header( "Location:../eklentiler.php?status=no" );
	}
}
if ( $_GET[ 'eklentisil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from eklenti where id=:hesap_id" );
	$kontrol = $sil->execute(
		array(
			'hesap_id' => $_GET[ 'eklenti_id' ]
		)
	);
	if ( $kontrol )
	{
		Header( "Location:../eklentiler.php?status=ok" );
	}
	else
	{
		Header( "Location:../eklentiler.php?status=no" );
	}
}
if ( $_GET[ 'sayfasil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from sayfalar where sayfa_id=:sayfa_id" );
	$kontrol = $sil->execute(
		array(
			'sayfa_id' => $_GET[ 'sayfa_id' ]
		)
	);
	if ( $kontrol )
	{
		Header( "Location:../sayfalar.php?status=ok" );
	}
	else
	{
		Header( "Location:../sayfalar.php?status=no" );
	}
}
if ( isset( $_POST[ 'eklentiekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$kaydet = $db->prepare(
		"INSERT INTO eklenti SET
		ad=:ad,
		cinsi=:cinsi,
		fiyat=:fiyat,
		aciklama=:aciklama,
		sira=:sira
		"
	);
	$insert = $kaydet->execute(
		array(
			'ad' => $_POST[ 'ad' ],
			'cinsi'  => $_POST[ 'cinsi' ],
			'fiyat'  => $_POST[ 'fiyat' ],
			'aciklama'    => $_POST[ 'aciklama' ],
			'sira'  => $_POST[ 'sira' ]
		)
	);
	if ( $insert )
	{
		Header( "Location:../eklentiler.php?status=ok" );
	}
	else
	{
		Header( "Location:../eklentiler.php?status=no" );
	}
}
if ( isset( $_POST[ 'sayfaekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$kaydet = $db->prepare(
		"INSERT INTO sayfalar SET
		sayfa_title=:title,
		sayfa_descr=:descr,
		sayfa_keyword=:keyword,
		sayfa_baslik=:baslik,
		sayfa_menu=:menu,
		sayfa_icerik=:icerik
		"
	);
	$insert = $kaydet->execute(
		array(
			'title'   => $_POST[ 'sayfa_title' ],
			'descr'   => $_POST[ 'sayfa_descr' ],
			'keyword' => $_POST[ 'sayfa_keyword' ],
			'baslik'  => $_POST[ 'sayfa_baslik' ],
			'menu'    => $_POST[ 'sayfa_menu' ],
			'icerik'  => $_POST[ 'sayfa_icerik' ]
		)
	);
	if ( $insert )
	{
		Header( "Location:../sayfalar.php?status=ok" );
	}
	else
	{
		Header( "Location:../sayfalar.php?status=no" );
	}
}
if ( isset( $_POST[ 'teklifver' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"INSERT INTO teklif SET
		teklif_adsoyad=:adsoyad,
		teklif_tel=:tel,
		teklif_nereden=:nereden,
		teklif_nereye=:nereye,
		teklif_cinsi=:cinsi"
	);
	$update     = $ayarkaydet->execute(
		array(
			'adsoyad' => $_POST[ 'teklif_adsoyad' ],
			'tel'     => $_POST[ 'teklif_tel' ],
			'nereden' => $_POST[ 'teklif_nereden' ],
			'nereye'  => $_POST[ 'teklif_nereye' ],
			'cinsi'   => $_POST[ 'teklif_cinsi' ]
		)
	);
	$uye = $_POST[ 'teklif_adsoyad' ];
	$tel = $_POST[ 'teklif_tel' ];
	if ( $update )
	{
		Header( "Location:../../teklif-sms-yolla?tel=$tel&ad=$uye" );
	}
	else
	{
		Header( "Location:../../index.php?teklif=no" );
	}
}
if ( $_GET[ 'paketsil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from urunler where urun_id=:urun_id" );
	$kontrol = $sil->execute(
		array(
			'urun_id' => $_GET[ 'urun_id' ]
		)
	);
	if ( $kontrol )
	{
		$resimsilunlink = $_GET[ 'urun_resim' ];
		unlink( "../$resimsilunlink" );
		Header( "Location:../paketler.php?status=ok" );
	}
	else
	{
		Header( "Location:../paketler.php?status=no" );
	}
}
if ( isset( $_POST[ 'paketduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
		$_SESSION['status']="demo";
		$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE urunler SET
		urun_baslik=:baslik,
		urun_kategori=:kategori,
		urun_fiyat=:fiyat,
		urun_aylik_fiyat=:aylik_fiyat,
		urun_yillik_fiyat=:yillik_fiyat,
		urun_vitrin=:vitrin,
		urun_aciklama=:aciklama
		WHERE urun_id={$_POST['urun_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'baslik'   => $_POST[ 'urun_baslik' ],
			'fiyat'    => $_POST[ 'urun_fiyat' ],
			'aylik_fiyat' => floatval($_POST[ 'urun_aylik_fiyat' ]),
			'yillik_fiyat' => floatval($_POST[ 'urun_yillik_fiyat' ]),
			'kategori'    => $_POST[ 'urun_kategori' ],
			'vitrin'   => $_POST[ 'urun_vitrin' ],
			'aciklama' => $_POST[ 'urun_aciklama' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../paketler.php?status=ok" );
	}
	else
	{
		Header( "Location:../paketler.php?status=no" );
	}
}
if ( isset( $_POST[ 'paketekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
		$_SESSION['status']="demo";
		$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$kaydet = $db->prepare(
		"INSERT INTO urunler SET
		urun_baslik=:baslik,
		urun_kategori=:kategori,
		urun_fiyat=:fiyat,
		urun_aylik_fiyat=:aylik_fiyat,
		urun_yillik_fiyat=:yillik_fiyat,
		urun_aciklama=:aciklama,
		urun_vitrin=:vitrin,
		urun_paket=:paket"
	);
	$insert = $kaydet->execute(
		array(
			'baslik'   => $_POST[ 'urun_baslik' ],
			'kategori'   => $_POST[ 'urun_kategori' ],
			'fiyat'    => $_POST[ 'urun_fiyat' ],
			'aylik_fiyat' => floatval($_POST[ 'urun_aylik_fiyat' ]),
			'yillik_fiyat' => floatval($_POST[ 'urun_yillik_fiyat' ]),
			'aciklama' => $_POST[ 'urun_aciklama' ],
			'vitrin'   => $_POST[ 'urun_vitrin' ],
			'paket'    => '1'
		)
	);
	if ( $insert )
	{
		Header( "Location:../paketler.php?status=ok" );
	}
	else
	{
		Header( "Location:../paketler.php?status=no" );
	}
}
if ( $_GET[ 'randevusil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from randevu where randevu_id=:randevu_id" );
	$kontrol = $sil->execute(
		array(
			'randevu_id' => $_GET[ 'randevu_id' ]
		)
	);
	if ( $kontrol )
	{
		Header( "Location:../randevu.php?status=ok" );
	}
	else
	{
		Header( "Location:../randevu.php?status=no" );
	}
}
if ( $_GET[ 'urunresimsil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$sil     = $db->prepare( "DELETE from resim where resim_id=:resim_id" );
	$kontrol = $sil->execute(
		array(
			'resim_id' => $_GET[ 'resim_id' ]
		)
	);
	$urun    = $_GET[ 'urun_id' ];
	if ( $kontrol )
	{
		$resimsilunlink = $_GET[ 'eski_yol' ];
		unlink( "../$resimsilunlink" );
		Header( "Location:../urun-resim-duzenle.php?urun_id=$urun&?status=ok" );
	}
	else
	{
		Header( "Location:../slayt.php?urun_id=$urun&?status=no" );
	}
}
if ( isset( $_POST[ 'videoekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$uploads_dir    = '../assets/img/galeri';
	$tmp_name       = $_FILES[ 'video_resim' ][ "tmp_name" ];
	$benzersizsayi1 = rand( 20000, 32000 );
	$benzersizsayi2 = rand( 20000, 32000 );
	$uzanti         = '.jpg';
	$benzersizad    = $benzersizsayi1 . $benzersizsayi2;
	$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizad . $uzanti;
	move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizad$uzanti" );
	$kaydet = $db->prepare(
		"INSERT INTO videogaleri SET
		video_link=:link,
		video_resim=:resim"
	);
	$insert = $kaydet->execute(
		array(
			'link'  => $_POST[ 'video_link' ],
			'resim' => $refimgyol
		)
	);
	if ( $insert )
	{
		Header( "Location:../video-galerisi.php?status=ok" );
	}
	else
	{
		Header( "Location:../video-galerisi.php?status=no" );
	}
}
if ( $_GET[ 'siparisonay' ] == 'ok' )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$kaydet = $db->prepare(
		"UPDATE siparis SET
		siparis_durum=:durum
		WHERE siparis_id={$_GET['siparis_id']}"
	);
	$insert = $kaydet->execute(
		array(
			'durum' => 0
		)
	);
	if ( $insert )
	{
		$destekxs=$db->prepare("SELECT * from siparis where siparis_id=:siparis_id");
		$destekxs->execute(array(
			'siparis_id' => $_GET['siparis_id']
		));
		$destekxsprnt=$destekxs->fetch(PDO::FETCH_ASSOC);
		$userxs=$db->prepare("SELECT * from uye where uye_id=:uye_id");
		$userxs->execute(array(
			'uye_id' => $destekxsprnt['siparis_ad']
		));
		$userxsprint=$userxs->fetch(PDO::FETCH_ASSOC);
		$mesaj = "Merhaba sayın ".$userxsprint[ 'uye_ad' ]." ".$userxsprint[ 'uye_soyad' ]." <br> web sitemiz üzerinden [".$destekxsprnt['siparis_id']."] id nolu siparişiniz onaylanmıştır. Detayları üye panelinizden inceleyebilirsiniz.";
		mailsend($userxsprint[ 'uye_mail' ],' Siparisiniz Onaylanmistir!',$mesaj);
		Header( "Location:../tamamlanan-siparisler.php?status=ok" );
	}
	else
	{
		Header( "Location:../yeni-siparisler.php?status=no" );
	}
}
if ( isset( $_POST[ 'resimekle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$uploads_dir    = '../assets/img/galeri';
	$tmp_name       = $_FILES[ 'resim_link' ][ "tmp_name" ];
	$benzersizsayi1 = rand( 20000, 32000 );
	$benzersizsayi2 = rand( 20000, 32000 );
	$uzanti         = '.jpg';
	$benzersizad    = $benzersizsayi1 . $benzersizsayi2;
	$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizad . $uzanti;
	move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizad$uzanti" );
	$kaydet = $db->prepare(
		"INSERT INTO resimgaleri SET
		resim_baslik=:baslik,
		resim_link=:resim"
	);
	$insert = $kaydet->execute(
		array(
			'baslik' => $_POST[ 'resim_baslik' ],
			'resim'  => $refimgyol
		)
	);
	if ( $insert )
	{
		Header( "Location:../resim-galerisi.php?status=ok" );
	}
	else
	{
		Header( "Location:../resim-galerisi.php?status=no" );
	}
}
if ( $_GET[ 'siparissil' ] == "ok" )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$inovance = $db->prepare( "SELECT * from siparis where siparis_id=:siparis_id" );
	$inovance->execute(
		array(
			'siparis_id' => $_GET[ 'siparis_id' ]
		)
	);
	$inovanceprint = $inovance->fetch( PDO::FETCH_ASSOC );
	$durum = $inovanceprint[ 'siparis_durum' ];
	$sil     = $db->prepare( "DELETE from siparis where siparis_id=:siparis_id" );
	$kontrol = $sil->execute(
		array(
			'siparis_id' => $_GET[ 'siparis_id' ]
		)
	);
	if ( $kontrol )
	{
		if ( $durum == '1' )
		{
			Header( "Location:../yeni-siparisler.php?status=ok" );
		}
		else
		{
			Header( "Location:../tamamlanan-siparisler.php?status=ok" );
		}
	}
	else
	{
		if ( $durum == '1' )
		{
			Header( "Location:../yeni-siparisler.php?status=no" );
		}
		else
		{
			Header( "Location:../tamamlanan-siparisler.php?status=no" );
		}
	}
}
if ( isset( $_POST[ 'omenuduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ust = $_POST[ 'omenu_ust' ];
	if ( $ust == 0 )
	{
		$ayarkaydet = $db->prepare(
			"UPDATE omenu SET
			omenu_ad=:ad,
			omenu_sira=:sira,
			omenu_link=:link
			WHERE omenu_id={$_POST['omenu_id']}"
		);
		$update     = $ayarkaydet->execute(
			array(
				'ad'   => $_POST[ 'omenu_ad' ],
				'sira' => $_POST[ 'omenu_sira' ],
				'link' => $_POST[ 'omenu_link' ]
			)
		);
	} else {
		$ayarkaydet = $db->prepare(
			"UPDATE omenu SET
			omenu_ad=:ad,
			omenu_sira=:sira,
			omenu_ust=:ust,
			omenu_link=:link
			WHERE omenu_id={$_POST['omenu_id']}"
		);
		$update     = $ayarkaydet->execute(
			array(
				'ad'   => $_POST[ 'omenu_ad' ],
				'sira' => $_POST[ 'omenu_sira' ],
				'ust'  => $ust,
				'link' => $_POST[ 'omenu_link' ]
			)
		);
	}
	if ( $update )
	{
		Header( "Location:../menu.php?status=ok" );
	}
	else
	{
		Header( "Location:../menu.php?status=no" );
	}
}
if ( isset( $_POST[ 'smenuduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE smenu SET
		smenu_ad=:ad,
		smenu_durum=:durum
		WHERE smenu_id={$_POST['smenu_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'ad'    => $_POST[ 'smenu_ad' ],
			'durum' => $_POST[ 'smenu_durum' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../menu.php?status=ok" );
	}
	else
	{
		Header( "Location:../menu.php?status=no" );
	}
}
if ( isset( $_POST[ 'flinkduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE flink SET
		flink_ad=:ad,
		flink_link=:link
		WHERE flink_id={$_POST['flink_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'ad'   => $_POST[ 'flink_ad' ],
			'link' => $_POST[ 'flink_link' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../alt-link.php?status=ok" );
	}
	else
	{
		Header( "Location:../alt-link.php?status=no" );
	}
}
if ( isset( $_POST[ 'fmenuduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE fmenu SET
		fmenu_ad=:ad,
		fmenu_link=:link,
		fmenu_sira=:sira
		WHERE fmenu_id={$_POST['fmenu_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'ad'   => $_POST[ 'fmenu_ad' ],
			'sira' => $_POST[ 'fmenu_sira' ],
			'link' => $_POST[ 'fmenu_link' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../alt-menu.php?status=ok" );
	}
	else
	{
		Header( "Location:../alt-menu.php?status=no" );
	}
}
if ( isset( $_POST[ 'yorumduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	if ( $_FILES[ 'yorum_resim' ][ "size" ] > 0 )
	{
		$uploads_dir = '../assets/img/yorumlar';
		@$tmp_name = $_FILES[ 'yorum_resim' ][ "tmp_name" ];
		$benzersizsayi1 = rand( 20000, 32000 );
		$benzersizsayi2 = rand( 20000, 32000 );
		$uzanti         = '.jpg';
		$benzersizad    = $benzersizsayi1 . $benzersizsayi2;
		$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizad . $uzanti;
		@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizad$uzanti" );
		$duzenle = $db->prepare(
			"UPDATE yorumlar SET
			yorum_icerik=:icerik,
			yorum_isim=:isim,
			yorum_resim=:resim
			WHERE yorum_id={$_POST['yorum_id']}"
		);
		$update  = $duzenle->execute(
			array(
				'icerik' => $_POST[ 'yorum_icerik' ],
				'isim'   => $_POST[ 'yorum_isim' ],
				'resim'  => $refimgyol
			)
		);
		if ( $update )
		{
			$resimsilunlink = $_POST[ 'eski_yol' ];
			unlink( "../$resimsilunlink" );
			Header( "Location:../yorumlar.php?status=ok" );
		}
		else
		{
			Header( "Location:../yorumlar.php?status=no" );
		}
	}
	else
	{
		$duzenle = $db->prepare(
			"UPDATE yorumlar SET
			yorum_icerik=:icerik,
			yorum_isim=:isim
			WHERE yorum_id={$_POST['yorum_id']}"
		);
		$update  = $duzenle->execute(
			array(
				'icerik' => $_POST[ 'yorum_icerik' ],
				'isim'   => $_POST[ 'yorum_isim' ]
			)
		);
		if ( $update )
		{
			Header( "Location:../yorumlar.php?status=ok" );
		}
		else
		{
			Header( "Location:../yorumlar.php?status=no" );
		}
	}
}
if ( isset( $_POST[ 'referansduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	if ( $_FILES[ 'referans_resim1' ][ "size" ] > 0 )
	{
		$uploads_dir = '../assets/img/referanslar';
		@$tmp_name = $_FILES[ 'referans_resim1' ][ "tmp_name" ];
		$benzersizsayi1 = rand( 20000, 32000 );
		$benzersizsayi2 = rand( 20000, 32000 );
		$uzanti         = '.jpg';
		$benzersizad    = $benzersizsayi1 . $benzersizsayi2;
		$refimgyol      = substr( $uploads_dir, 3 ) . "/" . $benzersizad . $uzanti;
		@move_uploaded_file( $tmp_name, "$uploads_dir/$benzersizad$uzanti" );
		$duzenle = $db->prepare(
			"UPDATE referanslar SET
			referans_adi=:adi,
			referans_kategori=:kategori,
			referans_link=:link,
			referans_resim1=:resim1
			WHERE referans_id={$_POST['referans_id']}"
		);
		$update  = $duzenle->execute(
			array(
				'adi'      => $_POST[ 'referans_adi' ],
				'kategori' => $_POST[ 'referans_kategori' ],
				'link'     => $_POST[ 'referans_link' ],
				'resim1'   => $refimgyol
			)
		);
		if ( $update )
		{
			$resimsilunlink = $_POST[ 'eski_yol1' ];
			unlink( "../$resimsilunlink" );
			Header( "Location:../referanslar.php?status=ok" );
		}
		else
		{
			Header( "Location:../referanslar.php?status=no" );
		}
	}
	else
	{
		$duzenle = $db->prepare(
			"UPDATE referanslar SET
			referans_adi=:adi,
			referans_kategori=:kategori,
			referans_link=:link
			WHERE referans_id={$_POST['referans_id']}"
		);
		$update  = $duzenle->execute(
			array(
				'adi'      => $_POST[ 'referans_adi' ],
				'kategori' => $_POST[ 'referans_kategori' ],
				'link'     => $_POST[ 'referans_link' ]
			)
		);
		if ( $update )
		{
			Header( "Location:../referanslar.php?status=ok" );
		}
		else
		{
			Header( "Location:../referanslar.php?status=no" );
		}
	}
}
if ( isset( $_POST[ 'odemeduzenle' ] ) )
{
	if (!$_SESSION[ 'kullanici_adi' ]) {
		exit;
	}
	if ($DemCont==1) {
$_SESSION['status']="demo";
$demoGeriLink = $_SERVER['HTTP_REFERER'];
		header( "Location:$demoGeriLink" );
		exit;
	}
	$ayarkaydet = $db->prepare(
		"UPDATE odeme SET
		odeme_adi=:adi,
		odeme_not=:not,
		odeme_durum=:durum
		WHERE odeme_id={$_POST['odeme_id']}"
	);
	$update     = $ayarkaydet->execute(
		array(
			'adi'   => $_POST[ 'odeme_adi' ],
			'not'   => $_POST[ 'odeme_not' ],
			'durum' => $_POST[ 'odeme_durum' ]
		)
	);
	if ( $update )
	{
		Header( "Location:../odeme-yontemleri.php?status=ok" );
	}
	else
	{
		Header( "Location:../odeme-yontemleri.php?status=no" );
	}
}

/**
 * ABONELIK YÖNETİMİ
 */

// Abonelik oluştur (Paketler sayfasından)
if ( isset( $_POST[ 'abonelik_olustur' ] ) ) {
    if (!isset($_SESSION['uye_mail'])) {
        Header( "Location:../../hesabim/uye-girisi?status=error" );
        exit;
    }
    if ($DemCont==1) {
        $_SESSION['status']="demo";
        $demoGeriLink = $_SERVER['HTTP_REFERER'];
        header( "Location:$demoGeriLink" );
        exit;
    }
    
    $urun_id = htmlspecialchars(trim($_POST['urun_id']));
    $abone_tur = htmlspecialchars(trim($_POST['abone_tur'])); // aylik | yillik
    
    if (!$urun_id || !$abone_tur) {
        Header( "Location:../../paketler?status=error" );
        exit;
    }
    
    // Ürün bilgisini al
    $urunsor = $db->prepare("SELECT * from urunler where urun_id=:urun_id");
    $urunsor->execute(array('urun_id' => $urun_id));
    $urun = $urunsor->fetch(PDO::FETCH_ASSOC);
    
    if (!$urun) {
        Header( "Location:../../paketler?status=error" );
        exit;
    }
    
    $fiyat = ($abone_tur === 'yillik') ? $urun['urun_yillik_fiyat'] : $urun['urun_aylik_fiyat'];
    
    if (!$fiyat) {
        Header( "Location:../../paketler?status=error" );
        exit;
    }
    
    $baslangic_tarih = date('Y-m-d H:i:s');
    $bitis_tarih = ($abone_tur === 'yillik') 
        ? date('Y-m-d H:i:s', strtotime($baslangic_tarih . ' +1 year'))
        : date('Y-m-d H:i:s', strtotime($baslangic_tarih . ' +1 month'));
    
    $kaydet = $db->prepare(
        "INSERT INTO abonelikler SET
        abone_uye=:uye,
        abone_urun=:urun,
        abone_tur=:tur,
        abone_baslangic_tarih=:baslangic,
        abone_bitis_tarih=:bitis,
        abone_sonraki_odeme_tarih=:bitis,
        abone_durum=:durum"
    );
    
    $insert = $kaydet->execute(array(
        'uye' => $userprint['uye_id'],
        'urun' => $urun_id,
        'tur' => $abone_tur,
        'baslangic' => $baslangic_tarih,
        'bitis' => $bitis_tarih,
        'durum' => 'bekleme'
    ));
    
    if ($insert) {
        $abone_id = $db->lastInsertId();
        
        // Ödeme kaydı oluştur
        $odeme_kaydet = $db->prepare(
            "INSERT INTO abonelik_odemeler SET
            odeme_abone=:abone,
            odeme_uye=:uye,
            odeme_tutar=:tutar,
            odeme_tur=:tur,
            odeme_durum=:durum"
        );
        
        $odeme_kaydet->execute(array(
            'abone' => $abone_id,
            'uye' => $userprint['uye_id'],
            'tutar' => $fiyat,
            'tur' => $abone_tur,
            'durum' => 'bekleme'
        ));
        
        $odeme_id = $db->lastInsertId();
        
        // Ödeme sayfasına yönlendir
        Header( "Location:../../hesabim/abonelik-odemesi?abone_id=$abone_id&odeme_id=$odeme_id" );
    } else {
        Header( "Location:../../paketler?status=no" );
    }
}

// Ödeme başarılı
if ( isset( $_GET[ 'odeme_basarili' ] ) && $_GET['odeme_basarili'] == 'ok' ) {
    if (!isset($_SESSION['uye_mail'])) {
        exit;
    }
    
    $abone_id = htmlspecialchars(trim($_GET['abone_id']));
    
    if (!$abone_id) {
        exit;
    }
    
    // Aboneliği aktif yap
    $ayarkaydet = $db->prepare(
        "UPDATE abonelikler SET
        abone_durum=:durum,
        abone_son_odeme_tarih=:tarih
        WHERE abone_id={$abone_id}"
    );
    
    $update = $ayarkaydet->execute(array(
        'durum' => 'aktif',
        'tarih' => date('Y-m-d H:i:s')
    ));
    
    if ($update) {
        // Mail gönder
        $abonesor = $db->prepare("SELECT a.*, u.urun_baslik, uy.uye_mail, uy.uye_ad, uy.uye_soyad 
                                  FROM abonelikler a
                                  JOIN urunler u ON a.abone_urun = u.urun_id
                                  JOIN uye uy ON a.abone_uye = uy.uye_id
                                  WHERE a.abone_id = ?");
        $abonesor->execute(array($abone_id));
        $abone = $abonesor->fetch(PDO::FETCH_ASSOC);
        
        $mesaj = "Merhaba sayın ".$abone['uye_ad']." ".$abone['uye_soyad']." <br><br>
                 ".$abone['urun_baslik']." paketine başarıyla abone oldunuz!<br>
                 Abonelik Türü: ".($abone['abone_tur'] === 'yillik' ? 'Yıllık' : 'Aylık')."<br>
                 Bitiş Tarihi: ".date('d.m.Y', strtotime($abone['abone_bitis_tarih']))."<br><br>
                 Üye panelinden aboneliklerinizi yönetebilirsiniz.";
        
        mailsend($abone['uye_mail'], 'Aboneliğiniz Başarıyla Oluşturuldu!', $mesaj);
        
        Header( "Location:../../hesabim/abonelikler?status=ok" );
    } else {
        Header( "Location:../../hesabim/abonelikler?status=no" );
    }
}

// Ödeme başarısız
if ( isset( $_GET[ 'odeme_basarisiz' ] ) && $_GET['odeme_basarisiz'] == 'ok' ) {
    if (!isset($_SESSION['uye_mail'])) {
        exit;
    }
    
    $odeme_id = htmlspecialchars(trim($_GET['odeme_id']));
    $neden = htmlspecialchars(trim($_GET['neden']));
    
    $odeme_guncelle = $db->prepare(
        "UPDATE abonelik_odemeler SET
        odeme_durum=:durum,
        odeme_basarisiz_neden=:neden,
        odeme_tarih=:tarih
        WHERE odeme_id={$odeme_id}"
    );
    
    $odeme_guncelle->execute(array(
        'durum' => 'basarisiz',
        'neden' => $neden,
        'tarih' => date('Y-m-d H:i:s')
    ));
    
    Header( "Location:../../hesabim/abonelikler?status=payment_failed" );
}