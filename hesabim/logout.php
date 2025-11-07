<?php 
// Session başlat
session_start();

// Debug: Çıkış işlemi başladı mı?
error_log("LOGOUT CALLED - Before destroy: " . print_r($_SESSION, true));

// Tüm session verilerini temizle
$_SESSION = array();

// Session'ı destroy et
session_destroy();

// Cookie'leri sil
if (isset($_COOKIE['PHPSESSID'])) {
    setcookie('PHPSESSID', '', time() - 3600, '/');
}

// Debug: Çıkış işlemi tamamlandı mı?
error_log("LOGOUT COMPLETED - After destroy");

// Redirect yap
header('Location: ../index.php?status=exit');
exit;
?>