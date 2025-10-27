<?php require 'head.php'; ?>
<!DOCTYPE html>
<html lang="tr">

<head>
    <style>
    :root {
        --renk: <?php echo $settingsprint['ayar_renk'];
        ?>
    }
    </style>
    <style>
    :root {
        --renk2: <?php echo $settingsprint['ayar_renk2'];
        ?>
    }
    </style>
    <style>
    :root {
        --renk3: <?php echo $settingsprint['ayar_renk3'];
        ?>
    }
    </style>
    <style>
    :root {
        --renk4: <?php echo $settingsprint['ayar_renk4'];
        ?>
    }
    </style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <?php echo $motorprint['motor_yonay']; ?>
    <?php echo $motorprint['motor_gonay']; ?>
    <link rel="shortcut icon" href="admin/<?php echo $settingsprint['ayar_fav']; ?>">
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/font-awesome.css" />
    <link rel="stylesheet" href="css/flaticon.css" />
    <link rel="stylesheet" href="css/slick.css">
    <link rel="stylesheet" href="css/slick-theme.css" />
    <link rel="stylesheet" href="css/magnific-popup.css" />
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/woocommerce.css" />
    <?php if ($settingsprint['ayar_leoder']==1) { ?>
    <link rel="stylesheet" href="css/royal-preload.css" />
    <?php } ?>
    <link rel="stylesheet" type="text/css" href="plugins/revolution/revolution/css/settings.css">
    <link rel="stylesheet" type="text/css" href="plugins/revolution/revolution/css/navigation.css">
    <link href="admin/assets/lib/sweet-alerts2/sweetalert2.min.css" rel="stylesheet">
    <script src="//www.google.com/recaptcha/api.js?hl=tr"></script>