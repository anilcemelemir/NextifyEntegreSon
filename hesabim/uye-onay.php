<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';


if ( isset( $_POST[ 'mailyolla' ] ) )
{ 
 

	$mailsor=$db->prepare("SELECT * from mail where mail_id=?");
	$mailsor->execute(array(0));
	$mailcek=$mailsor->fetch(PDO::FETCH_ASSOC);

	$ayarsor=$db->prepare("SELECT * from ayar");
	$ayarsor->execute(array(0));
	$ayarcek=$ayarsor->fetch(PDO::FETCH_ASSOC);

	//1 hafta falan bu mail açık denemelerinizi yapın...
	//Eğitimleri sonra izlerseniz kendi hostunuzda deneyin
	//localde çalışması için çok çok şey lazım localle uğraşmayın....
	$smtpuser=$mailcek['mail_user'];
	$smtphost=$mailcek['mail_host'];
	$smtpport=$mailcek['mail_port'];
	$smtppass=$mailcek['mail_pass'];
	$smtpadmin=$ayarcek['ayar_mail'];
	
	$adsoyad = $userprint['uye_ad'];
	$eposta = $userprint['uye_mail'];
	$uye_kodmail = $userprint['uye_kodmail'];


	
	$content = '
	<b>Üye Onay Kodu Talebi</b><br>
	<b>Sayın '.$adsoyad.' üyeliğinizi aktif etmek için şifreniz '.$uye_kodmail.'. </b>
	';
		$ayarkaydet = $db->prepare(
			"UPDATE uye SET
			uye_mailsure=:sure
			WHERE uye_id={$userprint['uye_id']}"
		);
		$update     = $ayarkaydet->execute(
			array(
				'sure'     => date('Y-m-d H:i:s')
			)
		);

		if ( $update )
		{


			mailsend($eposta,'UYELIK ONAYI',$content);  
			Header( "Location:?status=ok" );


		}
		else
		{

			Header( "Location:?status=no" );
		} 


}

if ( isset( $_POST[ 'smsyolla' ] ) )
{

	include '../admin/controller/function.php'; 
	date_default_timezone_set('Europe/Istanbul');
	$ayarsor=$db->prepare("SELECT * from ayar where ayar_id=?");
	$ayarsor->execute(array(0));
	$ayarcek=$ayarsor->fetch(PDO::FETCH_ASSOC);

	$smssor=$db->prepare("SELECT * from sms where sms_id=0");
	$smssor->execute(array(0));
	$smscek=$smssor->fetch(PDO::FETCH_ASSOC);
	?>

<?php
	function sendRequest($site_name,$send_xml,$header_type) {

    	//die('SITENAME:'.$site_name.'SEND XML:'.$send_xml.'HEADER TYPE '.var_export($header_type,true));
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL,$site_name);
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS,$send_xml);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST,1);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,0);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
		curl_setopt($ch, CURLOPT_HTTPHEADER,$header_type);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
		curl_setopt($ch, CURLOPT_TIMEOUT, 120);

		$result = curl_exec($ch);

		return $result;
	}

	$username   = $smscek['sms_kullanici'];
	$password   = $smscek['sms_sifre'];
	$orgin_name = $smscek['sms_baslik'];
	$send_number= $userprint['uye_tel'];
	$uye_name= $userprint['uye_ad'];
	$uye_kodtel= $userprint['uye_kodtel'];
	$send_message_admin= 'Sayın '.$uye_name.' üyeliğinizi aktif etmek için şifreniz '.$uye_kodtel.'. ';


	$xml = <<<EOS
	<request>
	<authentication>
	<username>{$username}</username>
	<password>{$password}</password>
	</authentication>

	<order>
	<sender>{$orgin_name}</sender>
	<sendDateTime>01/05/2013 18:00</sendDateTime>
	<message>
	<text>{$send_message_admin}</text>
	<receipents>
	<number>{$send_number}</number>
	</receipents>
	</message>
	</order>
	</request>
EOS;


	$result = sendRequest('http://api.iletimerkezi.com/v1/send-sms',$xml,array('Content-Type: text/xml'));
	if ($result) {
		$ayarkaydet = $db->prepare(
			"UPDATE uye SET
			uye_smssure=:sure
			WHERE uye_id={$userprint['uye_id']}"
		);
		$update     = $ayarkaydet->execute(
			array(
				'sure'     => date('Y-m-d H:i:s')
			)
		);

		if ( $update )
		{


			Header( "Location:?status=ok" );


		}
		else
		{

			Header( "Location:?status=no" );
		}
	}


}

if ( isset( $_POST[ 'smsonay' ] ) )
{

	$uyekod=$userprint['uye_kodtel'];
	$gelenkod=$_POST['uye_kodtel'];

	if ($uyekod==$gelenkod) {
		$ayarkaydet = $db->prepare(
			"UPDATE uye SET
			uye_onaytel=:smsonay
			WHERE uye_id={$userprint['uye_id']}"
		);
		$update     = $ayarkaydet->execute(
			array(
				'smsonay'     => '1'
			)
		);

		if ( $update )
		{


			Header( "Location:?status=ok" );


		}
		else
		{

			Header( "Location:?status=no" );
		}
	} else {

		Header( "Location:?status=no" );
	}



}

if ( isset( $_POST[ 'mailonay' ] ) )
{

	$uyekod=$userprint['uye_kodmail'];
	$gelenkod=$_POST['uye_kodmail'];

	if ($uyekod==$gelenkod) {
		$ayarkaydet = $db->prepare(
			"UPDATE uye SET
			uye_onaymail=:mailonay
			WHERE uye_id={$userprint['uye_id']}"
		);
		$update     = $ayarkaydet->execute(
			array(
				'mailonay'     => '1'
			)
		);

		if ( $update )
		{


			Header( "Location:?status=ok" );


		}
		else
		{

			Header( "Location:?status=no" );
		}
	} else {

		Header( "Location:?status=no" );
	}



} 
if ($userprint['uye_onaymail']==0 || $userprint['uye_onaytel']==0) { ?>
<section class="main-content container">
    <div class="page-header">
        <h2>Üyelik İşlemleri</h2>
    </div>
    <div class="row">
        <!-- İLETİŞİM MESAJLARI -->
        <div class="col-md-12">
            <div class="card">
                <div class="card-block">

                    <?php if ($userprint['uye_onaymail']==0) {
							?>
                    <form role="form" action="" enctype="multipart/form-data" method="POST">
                        <input type="hidden" name="destek_uye" value="<?php echo $userprint['uye_id']; ?>">
                        <input type="hidden" name="destek_durum" value="<?php echo $userprint['uye_id']; ?>">
                        <div class="form-group">
                            <label>Mail Onay <small style="color: red;">(Mail gönderimi 20 dakikada bir yapılır.)</small></label>
                            <input type="text" name="uye_kodmail" placeholder="Mail adresinize gelen 5 haneli kodu giriniz." class="form-control">
                        </div>
                        <div class="clearfix">
                            <button style="margin-right: 5px; cursor: pointer;" type="submit" name="mailonay" class="btn  btn-success btn-icon pull-right"><i class="fa fa-check-square"></i>Onayla</button>

                            <?php 
									$baslangic1     = strtotime($userprint['uye_mailsure']);
									$bitis1         = strtotime(date('Y-m-d H:i:s'));
									$fark1        = abs($bitis1-$baslangic1);
									$toplantiSure1= floor($fark1/60);

									$kalanSure1=  '20' - $toplantiSure1;

									if ($toplantiSure1<=20) {
										?>
                            <a href="#" style="margin-right: 5px; cursor: pointer;" class="btn  btn-warning btn-icon pull-right"><i class="fa fa-paper-plane-o"></i><?php echo $kalanSure1; ?> dk. bekleyin</a>
                            <?php  
									} else {
										?>
                            <button style="margin-right: 5px; cursor: pointer;" type="submit" name="mailyolla" class="btn  btn-warning btn-icon pull-right"><i class="fa fa-paper-plane-o"></i>Yeniden Mail Gönder</button>
                            <?php } ?>

                        </div>
                    </form>
                    <small>NOT: Mail ulaşmadıysa üyelik panelinizde mail adresinizi doğru yazdığınızdan emin olun.</small>
                    <hr>
                    <?php } ?>
                </div>
            </div>
        </div>


    </div>
    <meta http-equiv="refresh" content="62;">
    <?php } else {
		Header( "Location:../hesabim?status=ok" );
	} 
	include 'footer.php'; ?>