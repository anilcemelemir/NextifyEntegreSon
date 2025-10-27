<?php 
include 'header.php';
include 'topbar.php';
include 'sidebar.php';
include '../admin/controller/seo.php';

$sipId = htmlspecialchars(strip_tags(trim($_GET['siparis'])));


$inovance=$db->prepare("SELECT * from siparis where siparis_id=:siparis_id");
$inovance->execute(array(
	'siparis_id' => $sipId
));
$inovanceprint=$inovance->fetch(PDO::FETCH_ASSOC);

$surunsor1=$db->prepare("SELECT * from surun where surun_siparis=:surun_id Limit 1");
$surunsor1->execute(array(
	'surun_id' => $inovanceprint['siparis_id'] 
));

$suruncek1=$surunsor1->fetch(PDO::FETCH_ASSOC);

$paytr=$db->prepare("SELECT * from paytr where paytr_id=?");
$paytr->execute(array(1));
$paytrprint=$paytr->fetch(PDO::FETCH_ASSOC);


$user=$db->prepare("SELECT * from uye where uye_id=:uye_mail");
$user->execute(array(
	'uye_mail' => $inovanceprint['siparis_ad']
));
$userprint=$user->fetch(PDO::FETCH_ASSOC);
?>
<!-- ============================================================== -->
<!-- 						Content Start	 						-->
<!-- ============================================================== -->
<section class="main-content container">

    <div class="page-header">
        <h2>GÜVENLİ SATIN AL</h2>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-block">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="alert bg-info alert-dismissible" role="alert" style="background-color: #a9bde4 !important;border-color: #88a7e4 !important;"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Bilgi!</strong> Sipariş sonrası faturanızın kesilebilmesi için bilgilerinizi doldurduğunuzdan ve doğruluğundan emin olunuz! => <b><a style="color: #fff;" target="_blank" href="hesap-ayarlari">Hesap Ayarları</a></b></div>
                        </div>
                    </div>
                </div>

                <?php 
				if ($userprint['uye_adres']) { 
					$adressUser = $userprint['uye_adres'];
				} else { 
					$adressUser = "istanbul";
				} 
				if ($settingsprint['ayar_pos']==1) { ?>
                <div class="card-block">

                    <div class="col-lg-12">
                        <?php
							if ($_GET['ode']=='ok') {
								$siparisID = rand(0, 999999999).$inovanceprint['siparis_id'];
							} else {
								$siparisID = $inovanceprint['siparis_id'];
							} 
							$bul = array(".","_","-","=","\\","\"");
							$degis = array("","","","","","");

							$TemizFiyat = str_replace($bul,$degis,$inovanceprint['siparis_fiyat']); ?>
                        <div style="width: 100%;margin: 0 auto;display: table;">
                            <?php
								$merchant_id 	= $paytrprint['paytr_magaza'];
								$merchant_key 	= $paytrprint['paytr_key'];
								$merchant_salt	= $paytrprint['paytr_salt'];
								$email = $userprint['uye_mail'];
								$payment_amount	= ceil($TemizFiyat)*100; 

								$merchant_oid = $siparisID;

								$user_name = $userprint['uye_ad'].$userprint['uye_soyad'];

								$user_address = $adressUser;

								$user_phone = $userprint['uye_tel'];

								$merchant_ok_url = $settingsprint['ayar_siteurl']."hesabim/siparisler?status=ok";

								$merchant_fail_url = $settingsprint['ayar_siteurl']."hesabim/siparisler?status=no";

								$user_basket = base64_encode(json_encode(array(
									array($suruncek1['surun_urun'], $inovanceprint['siparis_fiyat'], 1)
								)));

								if( isset( $_SERVER["HTTP_CLIENT_IP"] ) ) {
									$ip = $_SERVER["HTTP_CLIENT_IP"];
								} elseif( isset( $_SERVER["HTTP_X_FORWARDED_FOR"] ) ) {
									$ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
								} else {
									$ip = $_SERVER["REMOTE_ADDR"];
								}

								$user_ip=$ip;
								$timeout_limit = "30";

								$debug_on = 1;

								$test_mode = 1;

								$no_installment	= 0;

								$max_installment = 0;

								$currency = "TL";

								$hash_str = $merchant_id .$user_ip .$merchant_oid .$email .$payment_amount .$user_basket.$no_installment.$max_installment.$currency.$test_mode;
								$paytr_token=base64_encode(hash_hmac('sha256',$hash_str.$merchant_salt,$merchant_key,true));
								$post_vals=array(
									'merchant_id'=>$merchant_id,
									'user_ip'=>$user_ip,
									'merchant_oid'=>$merchant_oid,
									'email'=>$email,
									'payment_amount'=>$payment_amount,
									'paytr_token'=>$paytr_token,
									'user_basket'=>$user_basket,
									'debug_on'=>$debug_on,
									'no_installment'=>$no_installment,
									'max_installment'=>$max_installment,
									'user_name'=>$user_name,
									'user_address'=>$user_address,
									'user_phone'=>$user_phone,
									'merchant_ok_url'=>$merchant_ok_url,
									'merchant_fail_url'=>$merchant_fail_url,
									'timeout_limit'=>$timeout_limit,
									'currency'=>$currency,
									'test_mode'=>$test_mode
								);

								$ch=curl_init();
								curl_setopt($ch, CURLOPT_URL, "https://www.paytr.com/odeme/api/get-token");
								curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
								curl_setopt($ch, CURLOPT_POST, 1) ;
								curl_setopt($ch, CURLOPT_POSTFIELDS, $post_vals);
								curl_setopt($ch, CURLOPT_FRESH_CONNECT, true);
								curl_setopt($ch, CURLOPT_TIMEOUT, 20);

								curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);

								$result = @curl_exec($ch);

								if(curl_errno($ch))
									die("PAYTR IFRAME connection error. err:".curl_error($ch));

								curl_close($ch);

								$result=json_decode($result,1);

								if($result['status']=='success')
									$token=$result['token'];
								else
									die("PAYTR IFRAME failed. reason:".$result['reason']);

								?>

                            <!-- Ödeme formunun açılması için gereken HTML kodlar / Başlangıç -->
                            <script src="https://www.paytr.com/js/iframeResizer.min.js"></script>
                            <iframe src="https://www.paytr.com/odeme/guvenli/<?php echo $token;?>" id="paytriframe" frameborder="0" scrolling="no" style="width: 100%;"></iframe>
                            <script>
                            iFrameResize({}, '#paytriframe');
                            </script>
                            <!-- Ödeme formunun açılması için gereken HTML kodlar / Bitiş -->

                        </div>

                    </div>


                </div>
                <?php } else { 

					$shopier=$db->prepare("SELECT * from shopier where shopier_id=?");
					$shopier->execute(array(1));
					$shopierprint=$shopier->fetch(PDO::FETCH_ASSOC);

					$Api_Key=$shopierprint['shopier_apikey'];

					$Api_Secret=$shopierprint['shopier_apisecret'];

					include_once '../Shopier.php';


					$firstname=$userprint['uye_ad'];
					$lastname=$userprint['uye_soyad'];
					$email=$userprint['uye_mail'];
					$phone=$userprint['uye_mail'];
					$address=$adressUser;
					$city="İSTANBUL";
					$price=$inovanceprint['siparis_fiyat'];
					$postacode='34000';
					$country="Turkiye";


					$shopier = new Shopier($Api_Key, $Api_Secret);
					$shopier->setBuyer([
						'id' => $inovanceprint['siparis_id'],
						'first_name' => $firstname, 'last_name' => $lastname, 'email' => $email, 'phone' => $phone]);
					$shopier->setOrderBilling([
						'billing_address' => $address,
						'billing_city' => $city,
						'billing_country' => $country,
						'billing_postcode' => $postacode,
					]);
					$shopier->setOrderShipping([
						'shipping_address' => $address,
						'shipping_city' => $city,
						'shipping_country' => $country,
						'shipping_postcode' => $postacode,
					]);
					die($shopier->run(time(), $price, $settingsprint['ayar_siteurl'].'response.php'));
				} ?>
            </div>
        </div>
    </div>
</section>

<?php include 'footer.php'; ?>
