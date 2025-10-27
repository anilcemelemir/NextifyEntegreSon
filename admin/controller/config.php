<?php
$DemCont = 0; /// Demo moda almak için 1 yazınız. Gerçek moda almak için 0 yazınız.

try {

	$db=new PDO(
        "mysql:host=db;dbname=scriptdb;charset=utf8",
        "admin",
        "admin123"
    );
	$db->query("SET NAMES utf8");

}


// Aşağıda bir düzenleme yapmayınız!
catch (PDOException $e) {

	echo $e->getMessage();
}

function GetIP(){
  if(getenv("HTTP_CLIENT_IP")) {
    $ip = getenv("HTTP_CLIENT_IP");
  } elseif(getenv("HTTP_X_FORWARDED_FOR")) {
    $ip = getenv("HTTP_X_FORWARDED_FOR");
    if (strstr($ip, ',')) {
      $tmp = explode (',', $ip);
      $ip = trim($tmp[0]);
    }
  } else {
    $ip = getenv("REMOTE_ADDR");
  }
  return $ip;
} 
function mailsend($alici,$baslik,$text) {
  global $db;

  $mail=$db->prepare("SELECT * from mail where mail_id=?");
  $mail->execute(array(0));
  $mailprint=$mail->fetch(PDO::FETCH_ASSOC);


  $settings=$db->prepare("SELECT * from ayar where ayar_id=?");
  $settings->execute(array(0));
  $settingsprint=$settings->fetch(PDO::FETCH_ASSOC);
  $siteUrl = $settingsprint['ayar_siteurl'];


  $ayar_renk = $settingsprint['ayar_renk'];  


  $texts = '
  <div align="center" style="width: 100%;height: auto;color: #ffffff;max-width: 760px;margin: 0 auto;margin-top: 30px;background-color: '.$ayar_renk.';border-top-left-radius: 15px;border-top-right-radius: 15px;"><div style="padding: 15px"><h1><font face="verdana">'.$baslik.'</font></h1></div></div>
  <div style="width: 100%;max-width: 760px;margin: 0 auto;color: #000;background-color: #f1f1f1;">
  <p style="padding: 40px;margin: 0;word-wrap:break-word;">
  <font face="verdana">
  '.$text.'
  <br>
  <a href="'.$siteUrl.'" style="margin-top: 20px;margin-bottom:20px;background: '.$ayar_renk.';border: none;color: #fff;padding: 15px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;border-radius: 25px;"> > Siteye Git</a><br>
  Buton çalışmıyorsa aşağıdaki linki tarayıcı adres kısmına kopyalayınız.<br>
  <font face="verdana" size="2"> '.$siteUrl.'</font>
  </font>
  </p></div>
  <div style="width: 100%;max-width: 760px;background-color: '.$ayar_renk.';margin: 0 auto;border-bottom-left-radius: 15px;border-bottom-right-radius: 15px;color: #fff;"><p style="padding: 10px;;margin: 0;word-wrap:break-word;" align="center"><font face="verdana" size="2">
  © 2019 Tüm Hakları Saklıdır.
  </font></p></div>
  <div align="center" style="height: auto;max-width: 760px;text-align: center;margin: 0 auto;margin-top: 30px;color: #c5c5c5;text-align:justify;"><font face="verdana" size="1">
  YASAL UYARI!<br>
  Bu elektronik posta mesajı ve ekleri sadece gönderildiği kişiye özeldir ve gizli bilgiler içerebilir. Eğer bu mesajı yanlışlıkla aldıysanız lütfen bu durumu tarafımıza derhal bildiriniz ve mesajı sisteminizden siliniz. Eğer doğru kişiye ulaşmadığını düşünüyorsanız, bu mesajın gizlenmesi, yönlendirilmesi, kopyalanması veya herhangi bir şekilde kullanılması yasaktır. Internet iletişiminde güvenlik ve hatasız gönderim garanti edilemeyeceğinden, mesajın yerine ulaşmaması, geç ulaşması, içeriğinin bozulması ya da mesajın virüs taşıması gibi problemler oluşabilir. Gönderen kurum bu tip sorunlardan sorumlu tutulmaz.
  </font></div><font face="verdana" size="1">
  </font>
  ';
 

  $smtpuser=$mailprint['mail_user'];
  $smtphost=$mailprint['mail_host'];
  $smtpport=$mailprint['mail_port'];
  $smtppass=$mailprint['mail_pass'];
  $smtpsecure=$mailprint['mail_secure'];
  $smtpsender=$mailprint['mail_sender'];
  $smtpname=$mailprint['mail_name'];
  require_once("phpmail/class.phpmailer.php");

  $mail = new PHPMailer();

  $mail->IsSMTP();
  $mail->SMTPAuth = true;
  $mail->SMTPSecure = $smtpsecure;
  $mail->Host = $smtphost;
  $mail->Port = $smtpport;
  $mail->IsHTML(true);
  $mail->SetLanguage("tr", "phpmail/phpmailer/language");
  $mail->CharSet  ="utf-8";
  $mail->Username =$smtpuser;
  $mail->Password = $smtppass;
  $mail->SetFrom($smtpsender, $smtpname);
  $mail->AddAddress($alici);
  $mail->Subject = $baslik;
  $mail->Body = $texts;

  $mail->Send();
}