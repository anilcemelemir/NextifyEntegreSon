-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 24 Ara 2021, 09:36:48
-- Sunucu sürümü: 8.0.17
-- PHP Sürümü: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `v7plus`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ayar`
--

CREATE TABLE `ayar` (
  `ayar_id` int(1) NOT NULL,
  `ayar_logo` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_fav` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_renk` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_siteurl` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_firmaadi` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_adres` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_ilce` varchar(200) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_il` varchar(200) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_fax` varchar(20) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_mail` varchar(100) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_kod` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci,
  `ayar_harita` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci,
  `ayar_ara` int(11) DEFAULT NULL,
  `ayar_resimparalax` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `resim_footer` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `resim_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_resimcounter` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_mobil` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_leoder` int(11) DEFAULT NULL,
  `ayar_imza` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_ark` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_pos` int(11) DEFAULT NULL,
  `ayar_renk2` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_renk3` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_renk4` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ranahtar` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `rgizlianahtar` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_whatsapp` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ayar`
--

INSERT INTO `ayar` (`ayar_id`, `ayar_logo`, `ayar_fav`, `ayar_renk`, `ayar_siteurl`, `ayar_firmaadi`, `ayar_title`, `ayar_description`, `ayar_keywords`, `ayar_adres`, `ayar_ilce`, `ayar_il`, `ayar_tel`, `ayar_fax`, `ayar_mail`, `ayar_kod`, `ayar_harita`, `ayar_ara`, `ayar_resimparalax`, `resim_footer`, `resim_title`, `ayar_resimcounter`, `ayar_mobil`, `ayar_leoder`, `ayar_imza`, `ayar_ark`, `ayar_pos`, `ayar_renk2`, `ayar_renk3`, `ayar_renk4`, `ranahtar`, `rgizlianahtar`, `ayar_whatsapp`) VALUES
(0, 'assets/img/genel/22885.jpg', 'assets/img/genel/26114.jpg', '#002CAE', 'http://site.com/', 'AJANS V7+  SCRİPT YAZILIMI', 'AJANS V7+  SCRİPT YAZILIMI ', 'Gelişmiş tam admin panel yönetimli PHP PDO tek ürün script yazılımlarımızı mutlaka inceleyin Sanal pos lu AJANS V7+  SCRİPT YAZILIMI incelemek için hemen inceleyin.', 'AJANS V7+  SCRİPT YAZILIMI, tek ürün yazılımı, tek ürün sistemi, tek ürün script satış sitesi, tek ürün satış yazılımı', 'Kuştepe Mahallesi, İstanbul Çevre Yolu, 34387', 'Şişli', 'İSTANBUL', '1234567889', '1234567889', 'bilgi@alanadi.com', '', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3008.096445415461!2d28.98946661568506!3d41.066884423764726!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14cab6fdcb64fda5%3A0x88def8117dd4a8b8!2sMecidiyek%C3%B6y!5e0!3m2!1str!2str!4v1517898741672\" width=\"100%\" height=\"400\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 1, 'assets/img/genel/27821.jpg', 'assets/img/genel/24762.jpg', 'assets/img/genel/24250.jpg', 'assets/img/genel/26263.jpg', '1', 1, '<p><b>Saygılarımla,</b><br><b>Ozan ÖZ</b></p><p><b>E-posta</b>: bilgi@sonyazilim.net <br><b>Telefon</b>: +90 212 909 96 86 (09.00 - 18.00)</p>', 'assets/img/genel/24053.jpg', 1, '#04B6F1', '#F8413E', '#FF6D26', '6LfPYPAUAAAAAEFnhWjNJZ3LdBltELGNWwLGClTq', '6LfPYPAUAAAAAHO2G9ORBV0rvp3Pl9An_kG4grn4', '1234567889');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ayar_kredi_karti`
--

CREATE TABLE `ayar_kredi_karti` (
  `id` int(11) NOT NULL,
  `iyzico_durum` varchar(255) NOT NULL,
  `iyzico_apiKey` varchar(255) NOT NULL,
  `iyzico_secretKey` varchar(255) NOT NULL,
  `iyzico_uri` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `ayar_kredi_karti`
--

INSERT INTO `ayar_kredi_karti` (`id`, `iyzico_durum`, `iyzico_apiKey`, `iyzico_secretKey`, `iyzico_uri`) VALUES
(1, 'aktif', 'sandbox-8akXq90Vc70BwQJ4RjdGdACeWflcvoVz', 'sandbox-aFKZYrpI3PSz56kJeIXuA1VGXp1465Rq', 'https://sandbox-api.iyzipay.com');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bilgi`
--

CREATE TABLE `bilgi` (
  `bilgi_id` int(11) NOT NULL,
  `bilgi_baslik` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `bilgi_aciklama` text CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `resim` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `bilgi`
--

INSERT INTO `bilgi` (`bilgi_id`, `bilgi_baslik`, `bilgi_aciklama`, `resim`) VALUES
(1, 'Kolay & Hızlı Sipariş', 'En basit ve hızlı işlem menüleri\r\n', 'assets/img/genel/2946520385.jpg'),
(2, 'Güvenli Ödeme', 'Online 3D güvenli ödeme özelliği', 'assets/img/genel/3073420510.jpg'),
(3, 'Mutlu Müşteriler', 'Her müşterimiz koşulsuz referansımızdır.', 'assets/img/genel/2579029586.jpg'),
(4, 'Gerçek Temsilci', 'Uzman ekibimiz her zaman yanınızda', 'assets/img/genel/2451925994.jpg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `blog`
--

CREATE TABLE `blog` (
  `blog_id` int(11) NOT NULL,
  `blog_resim` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `blog_tarih` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `blog_baslik` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `blog_kategori` int(11) NOT NULL,
  `blog_detay` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `blog_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `blog_descr` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `blog_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `blog`
--

INSERT INTO `blog` (`blog_id`, `blog_resim`, `blog_tarih`, `blog_baslik`, `blog_kategori`, `blog_detay`, `blog_title`, `blog_descr`, `blog_keyword`) VALUES
(1, 'assets/img/blog/2229722880.jpg', '2017-09-29 06:54:21', 'Samsung Galaxy Watch Active İncelemesi', 3, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam est nibh, bibendum ut erat a, molestie pretium leo. Nunc accumsan, purus id tempor vestibulum, ante lorem porta elit, a venenatis velit justo ut ipsum.</p>\r\n\r\n<p>Donec semper dictum posuere. Cras congue eros fringilla neque condimentum malesuada. Vivamus hendrerit, justo vitae vehicula consectetur, dui ligula tincidunt turpis, sit amet pulvinar tortor risus ac tortor. In id hendrerit tortor, vel fermentum nunc. Nullam sed venenatis leo, quis porta neque. Quisque sodales quam sit amet placerat malesuada. Praesent quis ultricies nibh. Duis sit amet leo convallis, imperdiet urna sed, varius justo. Aliquam erat volutpat. Nam nisl magna, tristique nec sodales eget, feugiat sit amet dui.</p>\r\n\r\n<p>Pellentesque pellentesque fringilla diam, vitae vehicula orci vulputate ut. Cras nec sagittis neque. In in pharetra arcu, at vulputate urna. Aenean porta mauris nec elit venenatis vehicula. Integer accumsan, est sed tempus ultrices, eros mi iaculis dolor, at laoreet ligula ex non ipsum. Sed vitae nisl dictum, porttitor urna id, porttitor ex. Donec dignissim velit neque, et laoreet mauris luctus non. Etiam egestas pretium euismod. Cras non mauris sapien. In hac habitasse platea dictumst. Donec tortor ligula, fringilla et justo a, mattis mollis sem. Nullam gravida odio erat, vitae ornare urna pretium vel. Duis aliquet vel neque pulvinar faucibus. Ut at sapien in turpis finibus varius vel a magna. Praesent lacinia urna eros, quis cursus diam aliquet a. Ut velit nisl, tempor ut mi non, euismod pellentesque erat. Nulla facilisi.</p>\r\n\r\n<p>Aliquam rutrum elit vel varius feugiat. Mauris mauris elit, ornare a auctor sit amet, vehicula et nulla. Pellentesque vitae justo tristique urna rhoncus pretium non ac ante. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent a lacus a turpis pharetra viverra. Nunc in lobortis elit. Maecenas sed felis sapien. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas at finibus nibh. Cras faucibus risus sit amet augue ornare, quis euismod velit tincidunt. Morbi quis neque vel nulla varius porta volutpat at libero. Sed convallis ante eget neque iaculis, et ullamcorper sem mattis. Phasellus at lorem ipsum. In hac habitasse platea dictumst. Nam accumsan, dui non pharetra rhoncus, mi nulla volutpat sapien, eu hendrerit massa diam ac odio. Mauris sollicitudin purus diam, et viverra justo volutpat vehicula. Quisque sed est et dui pharetra interdum. Donec et elementum augue. Ut dapibus semper mattis. Mauris arcu nibh, scelerisque et risus eget, bibendum tempus ligula.</p>\r\n\r\n<p>Vivamus venenatis turpis at ex ullamcorper, nec suscipit mi ultrices. Nullam ac pellentesque leo, at aliquet turpis. Curabitur lobortis efficitur tempor. Cras aliquam erat a tellus efficitur ultricies. Vestibulum tempus arcu mi, dignissim faucibus tortor luctus vel. Integer aliquet imperdiet tellus, id mollis augue feugiat quis. Donec consectetur sed sapien laoreet ultrices. In eleifend tortor at cursus sollicitudin. Suspendisse id accumsan lorem. Maecenas et enim nec augue dictum pharetra. Morbi sapien quam, convallis vitae sem id, elementum tempor enim. Nunc eget neque consectetur, vulputate quam eget, volutpat nibh. Nullam mi lorem, molestie sit amet turpis a, imperdiet cursus quam. Sed rhoncus urna nec arcu convallis, et euismod eros congue. Aliquam sed magna enim. Quisque semper pellentesque euismod. Aliquam posuere ipsum quis purus gravida vehicula. Nullam facilisis erat in velit convallis, vitae egestas eros tempus.</p>\r\n', 'Samsung Galaxy Watch Active İncelemesi', 'Samsung Galaxy Watch Active İncelemesi', 'Samsung Galaxy Watch Active İncelemesi'),
(11, 'assets/img/blog/2878427595.jpg', '2017-10-05 09:50:39', 'E-Kitap Okuyucu Almak İçin 11 Neden', 3, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam auctor dignissim arcu, eu scelerisque orci finibus vel. Suspendisse eget consectetur justo, non efficitur quam. Pellentesque lacinia id est eget lacinia. Phasellus ut sem et mi consectetur maximus. Etiam pharetra quam in nibh faucibus, at venenatis mi elementum. Nullam bibendum ultrices leo ut vehicula. Phasellus id turpis turpis. Integer scelerisque ac massa a vulputate.</p>\r\n\r\n<p>Fusce hendrerit eros nec justo maximus gravida. Vivamus sed consequat lorem. In hac habitasse platea dictumst. Duis ut eros vitae purus porttitor tristique. Donec eu dapibus ante, non porta erat. Integer nulla elit, egestas non enim vehicula, tempus vestibulum sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n\r\n<p>Nunc ex dolor, tincidunt ac feugiat non, faucibus eu sem. Fusce id odio quis elit pellentesque malesuada. Maecenas tincidunt porta imperdiet. Vivamus in arcu arcu. Quisque ut risus eu purus placerat porttitor vel non lacus. Nam et iaculis ex. Ut in malesuada leo. Phasellus ut condimentum odio. Nunc ac urna dignissim, egestas diam sit amet, molestie enim. Curabitur in porta libero, id volutpat magna.</p>\r\n\r\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer in scelerisque mauris. Nunc scelerisque hendrerit urna, quis pellentesque velit dictum a. Sed ipsum nisi, viverra tincidunt consequat bibendum, vulputate feugiat justo. Vivamus eget rutrum ante. Nullam semper diam vitae lacus malesuada, nec porttitor turpis tincidunt. Donec placerat urna quis arcu blandit, eget aliquet dui tincidunt. Sed viverra ex nec est consectetur aliquet. Nunc efficitur molestie turpis, ac faucibus nunc viverra ut. Aenean a magna ac nulla ultrices condimentum eu sed mi. Duis sit amet ligula rutrum nulla vehicula vulputate. Donec vehicula imperdiet sagittis. Donec ut pulvinar justo, non rhoncus felis. Curabitur bibendum nunc at dui iaculis, vitae ultricies purus luctus. Nullam efficitur, tellus mollis dignissim condimentum, nisl lacus accumsan orci, id maximus sapien odio nec quam. Praesent tincidunt urna tortor, tempor feugiat libero aliquam vitae.</p>\r\n\r\n<p>Vivamus ut sem vel velit molestie dapibus id vitae quam. Nulla vitae urna semper felis scelerisque tincidunt eu ut lacus. Donec at sapien et sem dapibus vehicula. Nulla facilisi. Ut eget blandit justo. Suspendisse metus ante, laoreet quis ex ac, convallis ullamcorper lorem. Phasellus tempor mi sem, sed pretium massa luctus vestibulum. Mauris in tristique risus.</p>\r\n', 'E-Kitap Okuyucu Almak İçin 11 Neden', 'E-Kitap Okuyucu Almak İçin 11 Neden', 'E-Kitap Okuyucu Almak İçin 11 Neden'),
(12, 'assets/img/blog/2799329727.jpg', '2017-09-29 06:54:21', 'En Çok Okunan Kitaplar', 3, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam est nibh, bibendum ut erat a, molestie pretium leo. Nunc accumsan, purus id tempor vestibulum, ante lorem porta elit, a venenatis velit justo ut ipsum.</p>\r\n\r\n<p>Donec semper dictum posuere. Cras congue eros fringilla neque condimentum malesuada. Vivamus hendrerit, justo vitae vehicula consectetur, dui ligula tincidunt turpis, sit amet pulvinar tortor risus ac tortor. In id hendrerit tortor, vel fermentum nunc. Nullam sed venenatis leo, quis porta neque. Quisque sodales quam sit amet placerat malesuada. Praesent quis ultricies nibh. Duis sit amet leo convallis, imperdiet urna sed, varius justo. Aliquam erat volutpat. Nam nisl magna, tristique nec sodales eget, feugiat sit amet dui.</p>\r\n\r\n<p>Pellentesque pellentesque fringilla diam, vitae vehicula orci vulputate ut. Cras nec sagittis neque. In in pharetra arcu, at vulputate urna. Aenean porta mauris nec elit venenatis vehicula. Integer accumsan, est sed tempus ultrices, eros mi iaculis dolor, at laoreet ligula ex non ipsum. Sed vitae nisl dictum, porttitor urna id, porttitor ex. Donec dignissim velit neque, et laoreet mauris luctus non. Etiam egestas pretium euismod. Cras non mauris sapien. In hac habitasse platea dictumst. Donec tortor ligula, fringilla et justo a, mattis mollis sem. Nullam gravida odio erat, vitae ornare urna pretium vel. Duis aliquet vel neque pulvinar faucibus. Ut at sapien in turpis finibus varius vel a magna. Praesent lacinia urna eros, quis cursus diam aliquet a. Ut velit nisl, tempor ut mi non, euismod pellentesque erat. Nulla facilisi.</p>\r\n\r\n<p>Aliquam rutrum elit vel varius feugiat. Mauris mauris elit, ornare a auctor sit amet, vehicula et nulla. Pellentesque vitae justo tristique urna rhoncus pretium non ac ante. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent a lacus a turpis pharetra viverra. Nunc in lobortis elit. Maecenas sed felis sapien. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas at finibus nibh. Cras faucibus risus sit amet augue ornare, quis euismod velit tincidunt. Morbi quis neque vel nulla varius porta volutpat at libero. Sed convallis ante eget neque iaculis, et ullamcorper sem mattis. Phasellus at lorem ipsum. In hac habitasse platea dictumst. Nam accumsan, dui non pharetra rhoncus, mi nulla volutpat sapien, eu hendrerit massa diam ac odio. Mauris sollicitudin purus diam, et viverra justo volutpat vehicula. Quisque sed est et dui pharetra interdum. Donec et elementum augue. Ut dapibus semper mattis. Mauris arcu nibh, scelerisque et risus eget, bibendum tempus ligula.</p>\r\n\r\n<p>Vivamus venenatis turpis at ex ullamcorper, nec suscipit mi ultrices. Nullam ac pellentesque leo, at aliquet turpis. Curabitur lobortis efficitur tempor. Cras aliquam erat a tellus efficitur ultricies. Vestibulum tempus arcu mi, dignissim faucibus tortor luctus vel. Integer aliquet imperdiet tellus, id mollis augue feugiat quis. Donec consectetur sed sapien laoreet ultrices. In eleifend tortor at cursus sollicitudin. Suspendisse id accumsan lorem. Maecenas et enim nec augue dictum pharetra. Morbi sapien quam, convallis vitae sem id, elementum tempor enim. Nunc eget neque consectetur, vulputate quam eget, volutpat nibh. Nullam mi lorem, molestie sit amet turpis a, imperdiet cursus quam. Sed rhoncus urna nec arcu convallis, et euismod eros congue. Aliquam sed magna enim. Quisque semper pellentesque euismod. Aliquam posuere ipsum quis purus gravida vehicula. Nullam facilisis erat in velit convallis, vitae egestas eros tempus.</p>\r\n', 'En Çok Okunan Kitaplar', 'En Çok Okunan Kitaplar', 'En Çok Okunan Kitaplar'),
(13, 'assets/img/blog/2881227026.jpg', '2017-09-29 06:54:22', 'Dondurma Nasıl Yapılır?', 3, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam auctor dignissim arcu, eu scelerisque orci finibus vel. Suspendisse eget consectetur justo, non efficitur quam. Pellentesque lacinia id est eget lacinia. Phasellus ut sem et mi consectetur maximus. Etiam pharetra quam in nibh faucibus, at venenatis mi elementum. Nullam bibendum ultrices leo ut vehicula. Phasellus id turpis turpis. Integer scelerisque ac massa a vulputate.</p>\r\n\r\n<p>Fusce hendrerit eros nec justo maximus gravida. Vivamus sed consequat lorem. In hac habitasse platea dictumst. Duis ut eros vitae purus porttitor tristique. Donec eu dapibus ante, non porta erat. Integer nulla elit, egestas non enim vehicula, tempus vestibulum sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n\r\n<p>Nunc ex dolor, tincidunt ac feugiat non, faucibus eu sem. Fusce id odio quis elit pellentesque malesuada. Maecenas tincidunt porta imperdiet. Vivamus in arcu arcu. Quisque ut risus eu purus placerat porttitor vel non lacus. Nam et iaculis ex. Ut in malesuada leo. Phasellus ut condimentum odio. Nunc ac urna dignissim, egestas diam sit amet, molestie enim. Curabitur in porta libero, id volutpat magna.</p>\r\n\r\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer in scelerisque mauris. Nunc scelerisque hendrerit urna, quis pellentesque velit dictum a. Sed ipsum nisi, viverra tincidunt consequat bibendum, vulputate feugiat justo. Vivamus eget rutrum ante. Nullam semper diam vitae lacus malesuada, nec porttitor turpis tincidunt. Donec placerat urna quis arcu blandit, eget aliquet dui tincidunt. Sed viverra ex nec est consectetur aliquet. Nunc efficitur molestie turpis, ac faucibus nunc viverra ut. Aenean a magna ac nulla ultrices condimentum eu sed mi. Duis sit amet ligula rutrum nulla vehicula vulputate. Donec vehicula imperdiet sagittis. Donec ut pulvinar justo, non rhoncus felis. Curabitur bibendum nunc at dui iaculis, vitae ultricies purus luctus. Nullam efficitur, tellus mollis dignissim condimentum, nisl lacus accumsan orci, id maximus sapien odio nec quam. Praesent tincidunt urna tortor, tempor feugiat libero aliquam vitae.</p>\r\n\r\n<p>Vivamus ut sem vel velit molestie dapibus id vitae quam. Nulla vitae urna semper felis scelerisque tincidunt eu ut lacus. Donec at sapien et sem dapibus vehicula. Nulla facilisi. Ut eget blandit justo. Suspendisse metus ante, laoreet quis ex ac, convallis ullamcorper lorem. Phasellus tempor mi sem, sed pretium massa luctus vestibulum. Mauris in tristique risus.</p>\r\n', 'Dondurma Nasıl Yapılır?', 'Dondurma Nasıl Yapılır?', 'Dondurma Nasıl Yapılır?'),
(14, 'assets/img/blog/2291320350.jpg', '2017-09-29 06:54:22', 'Porselen Makyaj Nasıl Yapılır?', 2, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam auctor dignissim arcu, eu scelerisque orci finibus vel. Suspendisse eget consectetur justo, non efficitur quam. Pellentesque lacinia id est eget lacinia. Phasellus ut sem et mi consectetur maximus. Etiam pharetra quam in nibh faucibus, at venenatis mi elementum. Nullam bibendum ultrices leo ut vehicula. Phasellus id turpis turpis. Integer scelerisque ac massa a vulputate.</p>\r\n\r\n<p>Fusce hendrerit eros nec justo maximus gravida. Vivamus sed consequat lorem. In hac habitasse platea dictumst. Duis ut eros vitae purus porttitor tristique. Donec eu dapibus ante, non porta erat. Integer nulla elit, egestas non enim vehicula, tempus vestibulum sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n\r\n<p>Nunc ex dolor, tincidunt ac feugiat non, faucibus eu sem. Fusce id odio quis elit pellentesque malesuada. Maecenas tincidunt porta imperdiet. Vivamus in arcu arcu. Quisque ut risus eu purus placerat porttitor vel non lacus. Nam et iaculis ex. Ut in malesuada leo. Phasellus ut condimentum odio. Nunc ac urna dignissim, egestas diam sit amet, molestie enim. Curabitur in porta libero, id volutpat magna.</p>\r\n\r\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer in scelerisque mauris. Nunc scelerisque hendrerit urna, quis pellentesque velit dictum a. Sed ipsum nisi, viverra tincidunt consequat bibendum, vulputate feugiat justo. Vivamus eget rutrum ante. Nullam semper diam vitae lacus malesuada, nec porttitor turpis tincidunt. Donec placerat urna quis arcu blandit, eget aliquet dui tincidunt. Sed viverra ex nec est consectetur aliquet. Nunc efficitur molestie turpis, ac faucibus nunc viverra ut. Aenean a magna ac nulla ultrices condimentum eu sed mi. Duis sit amet ligula rutrum nulla vehicula vulputate. Donec vehicula imperdiet sagittis. Donec ut pulvinar justo, non rhoncus felis. Curabitur bibendum nunc at dui iaculis, vitae ultricies purus luctus. Nullam efficitur, tellus mollis dignissim condimentum, nisl lacus accumsan orci, id maximus sapien odio nec quam. Praesent tincidunt urna tortor, tempor feugiat libero aliquam vitae.</p>\r\n\r\n<p>Vivamus ut sem vel velit molestie dapibus id vitae quam. Nulla vitae urna semper felis scelerisque tincidunt eu ut lacus. Donec at sapien et sem dapibus vehicula. Nulla facilisi. Ut eget blandit justo. Suspendisse metus ante, laoreet quis ex ac, convallis ullamcorper lorem. Phasellus tempor mi sem, sed pretium massa luctus vestibulum. Mauris in tristique risus.</p>\r\n', 'Porselen Makyaj Nasıl Yapılır?', 'Porselen Makyaj Nasıl Yapılır?', 'Porselen Makyaj Nasıl Yapılır?'),
(15, 'assets/img/blog/2599330178.jpg', '2017-09-29 06:54:21', 'Bulaşık Makinesi Temizliği Nasıl Yapılır?', 2, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam auctor dignissim arcu, eu scelerisque orci finibus vel. Suspendisse eget consectetur justo, non efficitur quam. Pellentesque lacinia id est eget lacinia. Phasellus ut sem et mi consectetur maximus. Etiam pharetra quam in nibh faucibus, at venenatis mi elementum. Nullam bibendum ultrices leo ut vehicula. Phasellus id turpis turpis. Integer scelerisque ac massa a vulputate.</p>\r\n\r\n<p>Fusce hendrerit eros nec justo maximus gravida. Vivamus sed consequat lorem. In hac habitasse platea dictumst. Duis ut eros vitae purus porttitor tristique. Donec eu dapibus ante, non porta erat. Integer nulla elit, egestas non enim vehicula, tempus vestibulum sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n\r\n<p>Nunc ex dolor, tincidunt ac feugiat non, faucibus eu sem. Fusce id odio quis elit pellentesque malesuada. Maecenas tincidunt porta imperdiet. Vivamus in arcu arcu. Quisque ut risus eu purus placerat porttitor vel non lacus. Nam et iaculis ex. Ut in malesuada leo. Phasellus ut condimentum odio. Nunc ac urna dignissim, egestas diam sit amet, molestie enim. Curabitur in porta libero, id volutpat magna.</p>\r\n\r\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer in scelerisque mauris. Nunc scelerisque hendrerit urna, quis pellentesque velit dictum a. Sed ipsum nisi, viverra tincidunt consequat bibendum, vulputate feugiat justo. Vivamus eget rutrum ante. Nullam semper diam vitae lacus malesuada, nec porttitor turpis tincidunt. Donec placerat urna quis arcu blandit, eget aliquet dui tincidunt. Sed viverra ex nec est consectetur aliquet. Nunc efficitur molestie turpis, ac faucibus nunc viverra ut. Aenean a magna ac nulla ultrices condimentum eu sed mi. Duis sit amet ligula rutrum nulla vehicula vulputate. Donec vehicula imperdiet sagittis. Donec ut pulvinar justo, non rhoncus felis. Curabitur bibendum nunc at dui iaculis, vitae ultricies purus luctus. Nullam efficitur, tellus mollis dignissim condimentum, nisl lacus accumsan orci, id maximus sapien odio nec quam. Praesent tincidunt urna tortor, tempor feugiat libero aliquam vitae.</p>\r\n\r\n<p>Vivamus ut sem vel velit molestie dapibus id vitae quam. Nulla vitae urna semper felis scelerisque tincidunt eu ut lacus. Donec at sapien et sem dapibus vehicula. Nulla facilisi. Ut eget blandit justo. Suspendisse metus ante, laoreet quis ex ac, convallis ullamcorper lorem. Phasellus tempor mi sem, sed pretium massa luctus vestibulum. Mauris in tristique risus.</p>\r\n', 'Bulaşık Makinesi Temizliği Nasıl Yapılır?', 'Bulaşık Makinesi Temizliği Nasıl Yapılır?', 'Bulaşık Makinesi Temizliği Nasıl Yapılır?'),
(16, 'assets/img/blog/2749428382.jpg', '2017-10-05 09:50:39', 'Fotoğraf Makinesi Çeşitleri Nelerdir?', 2, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam auctor dignissim arcu, eu scelerisque orci finibus vel. Suspendisse eget consectetur justo, non efficitur quam. Pellentesque lacinia id est eget lacinia. Phasellus ut sem et mi consectetur maximus. Etiam pharetra quam in nibh faucibus, at venenatis mi elementum. Nullam bibendum ultrices leo ut vehicula. Phasellus id turpis turpis. Integer scelerisque ac massa a vulputate.</p>\r\n\r\n<p>Fusce hendrerit eros nec justo maximus gravida. Vivamus sed consequat lorem. In hac habitasse platea dictumst. Duis ut eros vitae purus porttitor tristique. Donec eu dapibus ante, non porta erat. Integer nulla elit, egestas non enim vehicula, tempus vestibulum sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n\r\n<p>Nunc ex dolor, tincidunt ac feugiat non, faucibus eu sem. Fusce id odio quis elit pellentesque malesuada. Maecenas tincidunt porta imperdiet. Vivamus in arcu arcu. Quisque ut risus eu purus placerat porttitor vel non lacus. Nam et iaculis ex. Ut in malesuada leo. Phasellus ut condimentum odio. Nunc ac urna dignissim, egestas diam sit amet, molestie enim. Curabitur in porta libero, id volutpat magna.</p>\r\n\r\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer in scelerisque mauris. Nunc scelerisque hendrerit urna, quis pellentesque velit dictum a. Sed ipsum nisi, viverra tincidunt consequat bibendum, vulputate feugiat justo. Vivamus eget rutrum ante. Nullam semper diam vitae lacus malesuada, nec porttitor turpis tincidunt. Donec placerat urna quis arcu blandit, eget aliquet dui tincidunt. Sed viverra ex nec est consectetur aliquet. Nunc efficitur molestie turpis, ac faucibus nunc viverra ut. Aenean a magna ac nulla ultrices condimentum eu sed mi. Duis sit amet ligula rutrum nulla vehicula vulputate. Donec vehicula imperdiet sagittis. Donec ut pulvinar justo, non rhoncus felis. Curabitur bibendum nunc at dui iaculis, vitae ultricies purus luctus. Nullam efficitur, tellus mollis dignissim condimentum, nisl lacus accumsan orci, id maximus sapien odio nec quam. Praesent tincidunt urna tortor, tempor feugiat libero aliquam vitae.</p>\r\n\r\n<p>Vivamus ut sem vel velit molestie dapibus id vitae quam. Nulla vitae urna semper felis scelerisque tincidunt eu ut lacus. Donec at sapien et sem dapibus vehicula. Nulla facilisi. Ut eget blandit justo. Suspendisse metus ante, laoreet quis ex ac, convallis ullamcorper lorem. Phasellus tempor mi sem, sed pretium massa luctus vestibulum. Mauris in tristique risus.</p>\r\n', 'Fotoğraf Makinesi Çeşitleri Nelerdir?', 'Fotoğraf Makinesi Çeşitleri Nelerdir?', 'Fotoğraf Makinesi Çeşitleri Nelerdir?'),
(17, 'assets/img/blog/2052931469.jpg', '2017-09-29 06:54:21', 'Aksiyon Kamera Nedir?', 5, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam auctor dignissim arcu, eu scelerisque orci finibus vel. Suspendisse eget consectetur justo, non efficitur quam. Pellentesque lacinia id est eget lacinia. Phasellus ut sem et mi consectetur maximus. Etiam pharetra quam in nibh faucibus, at venenatis mi elementum. Nullam bibendum ultrices leo ut vehicula. Phasellus id turpis turpis. Integer scelerisque ac massa a vulputate.</p>\r\n\r\n<p>Fusce hendrerit eros nec justo maximus gravida. Vivamus sed consequat lorem. In hac habitasse platea dictumst. Duis ut eros vitae purus porttitor tristique. Donec eu dapibus ante, non porta erat. Integer nulla elit, egestas non enim vehicula, tempus vestibulum sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n\r\n<p>Nunc ex dolor, tincidunt ac feugiat non, faucibus eu sem. Fusce id odio quis elit pellentesque malesuada. Maecenas tincidunt porta imperdiet. Vivamus in arcu arcu. Quisque ut risus eu purus placerat porttitor vel non lacus. Nam et iaculis ex. Ut in malesuada leo. Phasellus ut condimentum odio. Nunc ac urna dignissim, egestas diam sit amet, molestie enim. Curabitur in porta libero, id volutpat magna.</p>\r\n\r\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer in scelerisque mauris. Nunc scelerisque hendrerit urna, quis pellentesque velit dictum a. Sed ipsum nisi, viverra tincidunt consequat bibendum, vulputate feugiat justo. Vivamus eget rutrum ante. Nullam semper diam vitae lacus malesuada, nec porttitor turpis tincidunt. Donec placerat urna quis arcu blandit, eget aliquet dui tincidunt. Sed viverra ex nec est consectetur aliquet. Nunc efficitur molestie turpis, ac faucibus nunc viverra ut. Aenean a magna ac nulla ultrices condimentum eu sed mi. Duis sit amet ligula rutrum nulla vehicula vulputate. Donec vehicula imperdiet sagittis. Donec ut pulvinar justo, non rhoncus felis. Curabitur bibendum nunc at dui iaculis, vitae ultricies purus luctus. Nullam efficitur, tellus mollis dignissim condimentum, nisl lacus accumsan orci, id maximus sapien odio nec quam. Praesent tincidunt urna tortor, tempor feugiat libero aliquam vitae.</p>\r\n\r\n<p>Vivamus ut sem vel velit molestie dapibus id vitae quam. Nulla vitae urna semper felis scelerisque tincidunt eu ut lacus. Donec at sapien et sem dapibus vehicula. Nulla facilisi. Ut eget blandit justo. Suspendisse metus ante, laoreet quis ex ac, convallis ullamcorper lorem. Phasellus tempor mi sem, sed pretium massa luctus vestibulum. Mauris in tristique risus.</p>\r\n', 'Aksiyon Kamera Nedir?', 'Aksiyon Kamera Nedir?', 'Aksiyon Kamera Nedir?'),
(18, 'assets/img/blog/2109020018.jpg', '2017-09-29 06:54:22', 'En İyi Kulaklık Markaları', 3, '<p style=\"text-align: justify; \">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam auctor dignissim arcu, eu scelerisque orci finibus vel. Suspendisse eget consectetur justo, non efficitur quam. Pellentesque lacinia id est eget lacinia. Phasellus ut sem et mi consectetur maximus. Etiam pharetra quam in nibh faucibus, at venenatis mi elementum. Nullam bibendum ultrices leo ut vehicula. Phasellus id turpis turpis. Integer scelerisque ac massa a vulputate.</p>\r\n\r\n<p style=\"text-align: justify; \">Fusce hendrerit eros nec justo maximus gravida. Vivamus sed consequat lorem. In hac habitasse platea dictumst. Duis ut eros vitae purus porttitor tristique. Donec eu dapibus ante, non porta erat. Integer nulla elit, egestas non enim vehicula, tempus vestibulum sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n\r\n<p style=\"text-align: justify;\">Nunc ex dolor, tincidunt ac feugiat non, faucibus eu sem. Fusce id odio quis elit pellentesque malesuada. Maecenas tincidunt porta imperdiet. Vivamus in arcu arcu. Quisque ut risus eu purus placerat porttitor vel non lacus. Nam et iaculis ex. Ut in malesuada leo. Phasellus ut condimentum odio. Nunc ac urna dignissim, egestas diam sit amet, molestie enim. Curabitur in porta libero, id volutpat magna.</p>\r\n\r\n<p style=\"text-align: justify;\">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer in scelerisque mauris. Nunc scelerisque hendrerit urna, quis pellentesque velit dictum a. Sed ipsum nisi, viverra tincidunt consequat bibendum, vulputate feugiat justo. Vivamus eget rutrum ante. Nullam semper diam vitae lacus malesuada, nec porttitor turpis tincidunt. Donec placerat urna quis arcu blandit, eget aliquet dui tincidunt. Sed viverra ex nec est consectetur aliquet. Nunc efficitur molestie turpis, ac faucibus nunc viverra ut. Aenean a magna ac nulla ultrices condimentum eu sed mi. Duis sit amet ligula rutrum nulla vehicula vulputate. Donec vehicula imperdiet sagittis. Donec ut pulvinar justo, non rhoncus felis. Curabitur bibendum nunc at dui iaculis, vitae ultricies purus luctus. Nullam efficitur, tellus mollis dignissim condimentum, nisl lacus accumsan orci, id maximus sapien odio nec quam. Praesent tincidunt urna tortor, tempor feugiat libero aliquam vitae.</p>\r\n\r\n<p style=\"text-align: justify;\">Vivamus ut sem vel velit molestie dapibus id vitae quam. Nulla vitae urna semper felis scelerisque tincidunt eu ut lacus. Donec at sapien et sem dapibus vehicula. Nulla facilisi. Ut eget blandit justo. Suspendisse metus ante, laoreet quis ex ac, convallis ullamcorper lorem. Phasellus tempor mi sem, sed pretium massa luctus vestibulum. Mauris in tristique risus.</p>\r\n', 'En İyi Kulaklık Markaları', 'En İyi Kulaklık Markaları', 'En İyi Kulaklık Markaları'),
(20, 'assets/img/blog/2397728417.jpg', '2017-10-05 09:50:39', 'Sırt Çantası Alırken Bunlara Dikkat!', 3, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam auctor dignissim arcu, eu scelerisque orci finibus vel. Suspendisse eget consectetur justo, non efficitur quam. Pellentesque lacinia id est eget lacinia. Phasellus ut sem et mi consectetur maximus. Etiam pharetra quam in nibh faucibus, at venenatis mi elementum. Nullam bibendum ultrices leo ut vehicula. Phasellus id turpis turpis. Integer scelerisque ac massa a vulputate.</p>\r\n\r\n<p>Fusce hendrerit eros nec justo maximus gravida. Vivamus sed consequat lorem. In hac habitasse platea dictumst. Duis ut eros vitae purus porttitor tristique. Donec eu dapibus ante, non porta erat. Integer nulla elit, egestas non enim vehicula, tempus vestibulum sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n\r\n<p>Nunc ex dolor, tincidunt ac feugiat non, faucibus eu sem. Fusce id odio quis elit pellentesque malesuada. Maecenas tincidunt porta imperdiet. Vivamus in arcu arcu. Quisque ut risus eu purus placerat porttitor vel non lacus. Nam et iaculis ex. Ut in malesuada leo. Phasellus ut condimentum odio. Nunc ac urna dignissim, egestas diam sit amet, molestie enim. Curabitur in porta libero, id volutpat magna.</p>\r\n\r\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer in scelerisque mauris. Nunc scelerisque hendrerit urna, quis pellentesque velit dictum a. Sed ipsum nisi, viverra tincidunt consequat bibendum, vulputate feugiat justo. Vivamus eget rutrum ante. Nullam semper diam vitae lacus malesuada, nec porttitor turpis tincidunt. Donec placerat urna quis arcu blandit, eget aliquet dui tincidunt. Sed viverra ex nec est consectetur aliquet. Nunc efficitur molestie turpis, ac faucibus nunc viverra ut. Aenean a magna ac nulla ultrices condimentum eu sed mi. Duis sit amet ligula rutrum nulla vehicula vulputate. Donec vehicula imperdiet sagittis. Donec ut pulvinar justo, non rhoncus felis. Curabitur bibendum nunc at dui iaculis, vitae ultricies purus luctus. Nullam efficitur, tellus mollis dignissim condimentum, nisl lacus accumsan orci, id maximus sapien odio nec quam. Praesent tincidunt urna tortor, tempor feugiat libero aliquam vitae.</p>\r\n\r\n<p>Vivamus ut sem vel velit molestie dapibus id vitae quam. Nulla vitae urna semper felis scelerisque tincidunt eu ut lacus. Donec at sapien et sem dapibus vehicula. Nulla facilisi. Ut eget blandit justo. Suspendisse metus ante, laoreet quis ex ac, convallis ullamcorper lorem. Phasellus tempor mi sem, sed pretium massa luctus vestibulum. Mauris in tristique risus.</p>\r\n', 'Sırt Çantası Alırken Bunlara Dikkat!', 'Sırt Çantası Alırken Bunlara Dikkat!', 'Sırt Çantası Alırken Bunlara Dikkat!');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `counter`
--

CREATE TABLE `counter` (
  `counter_id` int(11) NOT NULL,
  `counter_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `counter_rakam` int(155) NOT NULL,
  `counter_isim` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `counter`
--

INSERT INTO `counter` (`counter_id`, `counter_icon`, `counter_rakam`, `counter_isim`) VALUES
(1, 'fa', 65, 'Php Html'),
(2, 'fa', 75, 'Javascript'),
(3, 'fa', 45, 'Java'),
(4, 'fa', 80, 'Asp Net');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `demo`
--

CREATE TABLE `demo` (
  `id` int(11) NOT NULL,
  `durum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `demo`
--

INSERT INTO `demo` (`id`, `durum`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `destek`
--

CREATE TABLE `destek` (
  `destek_id` int(11) NOT NULL,
  `destek_tarih` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `destek_uye` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `destek_baslik` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `destek_uyeoku` int(11) NOT NULL DEFAULT '0',
  `destek_adminoku` int(11) NOT NULL DEFAULT '0',
  `destek_durum` int(11) NOT NULL DEFAULT '0',
  `destek_onem` int(11) NOT NULL DEFAULT '1',
  `destek_departman` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `destek`
--

INSERT INTO `destek` (`destek_id`, `destek_tarih`, `destek_uye`, `destek_baslik`, `destek_uyeoku`, `destek_adminoku`, `destek_durum`, `destek_onem`, `destek_departman`) VALUES
(1, '2020-11-11 13:55:25', '19', 'Yaşanan Sorun İle İlgili', 1, 1, 1, 1, 'Teknik Destek'),
(2, '2020-11-11 13:59:10', '19', 'Fatura Ödeme Hk.', 1, 1, 0, 1, 'Muhasebe');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `destekmesaj`
--

CREATE TABLE `destekmesaj` (
  `destekmesaj_id` int(11) NOT NULL,
  `destekmesaj_tarih` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `destekmesaj_destek` int(11) NOT NULL,
  `destekmesaj_aciklama` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `destekmesaj_kim` int(11) NOT NULL,
  `destekmesaj_resim` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `destekmesaj`
--

INSERT INTO `destekmesaj` (`destekmesaj_id`, `destekmesaj_tarih`, `destekmesaj_destek`, `destekmesaj_aciklama`, `destekmesaj_kim`, `destekmesaj_resim`) VALUES
(1, '2020-11-11 13:55:25', 1, 'Merhaba yaşadığımız sorun ile ilgili buradan çözüm bulabilir miyiz?', 2, '0'),
(2, '2020-11-11 13:57:43', 1, 'Merhabalar, elbette sorunu iletirseniz yardımcı olabiliriz.', 1, '0'),
(3, '2020-11-11 13:59:10', 2, 'Merhabalar fatura ödedim.', 2, '0'),
(4, '2020-11-11 13:59:38', 2, 'Merhabalar, \r\nÖdemeniz için teşekkür ederiz.', 1, '0');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `duyuru`
--

CREATE TABLE `duyuru` (
  `duyuru_id` int(11) NOT NULL,
  `duyuru_baslik` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `duyuru_detay` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `duyuru_tarih` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `duyuru_durum` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `duyuru`
--

INSERT INTO `duyuru` (`duyuru_id`, `duyuru_baslik`, `duyuru_detay`, `duyuru_tarih`, `duyuru_durum`) VALUES
(1, 'Deneme Duyuru', 'Tam anlamı ile yönetim paneli kontrollü gelişmiş PHP, PDO, HTML5, BOOTSTRAP teknolojisi ile yazılımlar ile site yönetiminin zorluğunu yaşamayın keyfini sürün. Tüm yazılımlarımız da standart olarak sunulan sipariş takip, kolay iade ve kargo takip bilgileri', '2018-08-14 09:09:54', 1),
(2, 'Deneme Duyuru 2', 'Deneme Duyuru 2 Açıklaması', '2018-08-14 09:09:54', 1),
(3, 'Deneme Başlık Adminden', '<p>Deneme içerik&nbsp;Adminden</p>', '2018-09-03 10:10:17', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `eklenti`
--

CREATE TABLE `eklenti` (
  `id` int(11) NOT NULL,
  `ad` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `cinsi` int(11) NOT NULL DEFAULT '0',
  `fiyat` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `aciklama` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `sira` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `eklenti`
--

INSERT INTO `eklenti` (`id`, `ad`, `cinsi`, `fiyat`, `aciklama`, `sira`) VALUES
(6, ' Seo Ayarları', 1, '100', 'Tüm sayfaların meta etiketleri özenle hazırlanır görseller sıkıştırılır. İç seo tamamlanır.', 3),
(7, 'Özgün İçerik 5 Adet ', 1, '125', 'Hakkımızda, Hizmetler ve Blog vb. gibi özgün içerik', 4),
(8, 'Banner Tasarımı 2 Adet', 1, '125', 'Sektörünüze uygun banner görselleri', 1),
(9, 'Logo Tasarımı', 1, '75', 'Özgün ve Marka Tesciline Uygun Tasarım', 2),
(10, 'Özgün İçerik 10 Adet ', 1, '225', 'Hakkımızda, Hizmetler ve Blog vb. gibi özgün içerik', 5),
(11, 'Özgün İçerik 20 Adet ', 1, '400', 'Hakkımızda, Hizmetler ve Blog vb. gibi özgün içerik', 6),
(12, 'SSD 1 Paket', 0, '50', '', 1),
(13, 'SSD 2 Paket', 0, '60', '', 2),
(14, 'SSD 3 Paket', 0, '70', '', 3),
(15, 'SSD 4 Paket', 0, '80', '', 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `flink`
--

CREATE TABLE `flink` (
  `flink_id` int(11) NOT NULL,
  `flink_ad` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `flink_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `flink`
--

INSERT INTO `flink` (`flink_id`, `flink_ad`, `flink_link`) VALUES
(1, 'Dekorasyon ', '#'),
(2, 'İç Mimarlık', '#'),
(3, 'Mobilya Takımları', '#'),
(4, 'Koltuk Takımları', '#'),
(5, 'Köşe Koltukları', '#'),
(6, 'Yemek Odası Takımı', '#'),
(7, 'Yatak Odası Takımı', '#'),
(8, 'Salon Takımı', '#'),
(9, 'Mutfak Dolapları', '#'),
(10, 'Banyo Modelleri', '#'),
(11, 'Salon Dekoru', '#'),
(12, 'Dekoratif Perde', '#'),
(13, 'Yatak Odası Modelleri', '#'),
(14, 'Amerikan Mutfak', '#'),
(15, 'Dekoratif Kapı ', '#'),
(16, 'Genç Odası', '#'),
(17, 'Çocuk Odası', '#'),
(18, 'Mimarlık', '#');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fmenu`
--

CREATE TABLE `fmenu` (
  `fmenu_id` int(11) NOT NULL,
  `fmenu_ad` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `fmenu_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `fmenu_sira` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `fmenu`
--

INSERT INTO `fmenu` (`fmenu_id`, `fmenu_ad`, `fmenu_link`, `fmenu_sira`) VALUES
(2, 'Referanslar', 'referanslar', '2'),
(5, 'Blog', 'blog', '5'),
(6, 'İletisim', 'iletisim', '7'),
(7, 'SSS', 'sss', '6'),
(8, 'Ürünler', 'urunler', '4');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hesap`
--

CREATE TABLE `hesap` (
  `hesap_id` int(11) NOT NULL,
  `hesap_banka` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `hesap_isim` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `hesap_sube` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `hesap_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `hesap_iban` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `hesap`
--

INSERT INTO `hesap` (`hesap_id`, `hesap_banka`, `hesap_isim`, `hesap_sube`, `hesap_no`, `hesap_iban`) VALUES
(1, 'ENPARA (FİNANSBANK)', 'En Şirket adı Tic. Ltd.şti', 'Altıntepe/209', '6296911', 'TR38 0006 2000 2090 0006 2969 11 '),
(2, 'İŞ BANKASI', 'İş Şirket adı Tic. Ltd.şti', 'Altıntepe/209', '6296911', 'TR38 0006 2000 2090 0006 2969 11 ');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hit`
--

CREATE TABLE `hit` (
  `gun` int(11) NOT NULL,
  `ay` int(11) NOT NULL,
  `yil` int(11) NOT NULL,
  `simdi` int(11) NOT NULL,
  `sayac` int(11) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `hit`
--

INSERT INTO `hit` (`gun`, `ay`, `yil`, `simdi`, `sayac`, `ip`, `id`) VALUES
(4, 11, 2020, 1604476849, 37, '::1', 1),
(5, 11, 2020, 1604573511, 2, '::1', 2),
(6, 11, 2020, 1604649166, 25, '::1', 3),
(7, 11, 2020, 1604726541, 24, '::1', 4),
(9, 11, 2020, 1604917709, 50, '::1', 5),
(9, 11, 2020, 1604952069, 5, '188.119.39.136', 6),
(10, 11, 2020, 1604956501, 5, '188.119.39.136', 7),
(11, 11, 2020, 1605092982, 12, '78.183.25.62', 8),
(25, 11, 2020, 1606320463, 3, '::1', 9),
(26, 11, 2020, 1606382179, 2, '::1', 10),
(28, 11, 2020, 1606547850, 5, '::1', 11),
(30, 11, 2020, 1606733126, 5, '::1', 12),
(1, 12, 2020, 1606829754, 1, '::1', 13),
(2, 12, 2020, 1606893346, 3, '::1', 14),
(3, 12, 2020, 1607001094, 8, '::1', 15),
(12, 2, 2021, 1613108273, 2, '::1', 16),
(20, 12, 2021, 1639987913, 2, '::1', 17),
(21, 12, 2021, 1640081880, 3, '::1', 18),
(22, 12, 2021, 1640162288, 3, '::1', 19),
(23, 12, 2021, 1640248424, 24, '::1', 20),
(23, 12, 2021, 1640271641, 2, '95.7.195.133', 21),
(23, 12, 2021, 1640288142, 2, '88.241.8.233', 22),
(24, 12, 2021, 1640328798, 5, '::1', 23);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hizmetler`
--

CREATE TABLE `hizmetler` (
  `hizmet_id` int(11) NOT NULL,
  `hizmet_baslik` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `hizmet_icerik` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci,
  `hizmet_resim` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `hizmet_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `hizmet_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `hizmet_descr` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `hizmet_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `hizmet_vitrin` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `hizmetler`
--

INSERT INTO `hizmetler` (`hizmet_id`, `hizmet_baslik`, `hizmet_icerik`, `hizmet_resim`, `hizmet_icon`, `hizmet_title`, `hizmet_descr`, `hizmet_keyword`, `hizmet_vitrin`) VALUES
(1, 'WEB TASARIM', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p><p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p><p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p><p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p><p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2968724967.jpg', NULL, 'Web Tasarım Hizmetimiz | Son Yazılım', 'Gelişmiş kodlama alt yapısı ile en güncel teknoloji kullanarak rakiplerimizden sıyrılıp uygun ve modern tasarımlar sunuyoruz.', 'web tasarım hizmeti, web site tasarımı, kurumsal web tasarım', '1'),
(2, 'SEO ÇALIŞMASI', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2636126854.jpg', NULL, 'SEO ÇALIŞMASI HİZMETİ |Son Yazılım', 'Günümüz yöntemlerinde arama motorlarında yaşanan güncellemeler sonucu seo çalışmaları daha profesyonel adımlar gerektirmektedir. Profesyonel Seo için Elvin Soft\'u tercih edin.', 'Seo çalışması, Arama motorlarında yükselme, seo hizmeti, kurumsal seo', '1'),
(3, 'E TİCARET', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2064924794.jpg', NULL, 'E TİCARET HİZMETLERİ ', 'Türkiye\'nin en büyük firmalarının kullandığı alt yapı ile güvenli kaliteli ve hızlı e ticaret sistemleri sadece Elvin Soft\'ta', 'E ticaret, e ticaret sitesi aç, e ticaret sitesi kur', '1'),
(4, 'SOSYAL MEDYA YÖNETİMİ', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2574526986.jpg', NULL, 'SOSYAL MEDYA YÖNETİMİ ', 'Sanal platformda en çok kişiye veya müşteriye ulaşmak için en etkili reklam yöntemi olan sosyal medyanızı profesyonel ekibimize devredebilirsiniz.', 'Sosyal medya yönetimi, sosyal medya pazarlama, sosyal medya e ticaret', '1'),
(5, ' MOBİL UYGULAMA ', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2598425770.jpg', NULL, ' MOBİL UYGULAMA YAZILIM GELİŞTİRME ', 'Günümüz çağında mobil uygulamalar en kullanışlı ve kişilere ulaşmanın en kolay yoludur. Bu mobil uygulamalarınızı Elvin Soft olarak projelendirmek ve yayına almak isteriz.', 'Mobil uygulama yapma, mobil uygulama yazılımı, mobil uygulama', '1'),
(6, 'ADWORDS ÇALIŞMASI', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2399928939.jpg', NULL, 'ADWORDS ÇALIŞMA HİZMETİ ', 'Adwords reklam çalışmaları özen, dikkat ve profesyonelliğin yanı sıra uzun ve kaliteli bir tecrübe ister tüm bu özelliklere sahip olan Elvin Soft ile eşsiz Adwords çalışması için bizi arayın.', 'Adwords çalışması, adwords reklam', '1'),
(7, 'REKLAM YÖNETİMİ', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2176926316.jpg', NULL, 'DİJİTAL REKLAM YÖNETİMİ ', 'Dijital reklam yönetimi olarak bilinen en çok kitleye ulaşabilen reklam çeşidi olan reklam yönetiminizi alanında uzman ekibimize bırakmanız satışlarınızı olumlu etkileyecektir.', 'reklam yönetimi, dijital reklam yönetimi, reklam', '1'),
(8, 'KURUMSAL KİMLİK', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/3142722828.jpg', NULL, 'KURUMSAL KİMLİK HİZMETİ ', 'Kurumsal firmaların en büyük elden reklam ve kaliteyi ön plana çıkartabilmek için mutlaka kurumsal kimlik çalışması yaptırması gerekir. Kurumsal Kimlik Elvin Soft ayrıcalığı ile.', 'kurumsal kimlik, eşantiyon, kurumsal kimlik çalışması', '1'),
(9, 'PROJE GELİŞTİRME', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/3054327046.jpg', NULL, 'PROJE GELİŞTİRME HİZMETİ ', 'Hali hazırda yada aklınızda olan her türlü projeyi yeniden yapılandırma veya geliştirmeye yönelik profesyonel ve yön verici çalışmanızı Elvin Soft ayrıcalığı yaşayın.', 'proje geliştirme, yazılım güncelleme, yazılım geliştirme', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `il`
--

CREATE TABLE `il` (
  `id` int(2) NOT NULL,
  `il_adi` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `il_plaka` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `il`
--

INSERT INTO `il` (`id`, `il_adi`, `il_plaka`) VALUES
(1, 'İSTANBUL', 34),
(2, 'ANKARA', 6),
(3, 'İZMİR', 35),
(4, 'BURSA', 16),
(5, 'ADANA', 1),
(6, 'ADIYAMAN', 2),
(7, 'AFYONKARAHİSAR', 3),
(8, 'AĞRI', 4),
(9, 'AKSARAY', 68),
(10, 'AMASYA', 5),
(11, 'ANTALYA', 7),
(12, 'ARDAHAN', 75),
(13, 'ARTVİN', 8),
(14, 'AYDIN', 9),
(15, 'BALIKESİR', 10),
(16, 'BARTIN', 74),
(17, 'BATMAN', 72),
(18, 'BAYBURT', 69),
(19, 'BİLECİK', 11),
(20, 'BİNGÖL', 12),
(21, 'BİTLİS', 13),
(22, 'BOLU', 14),
(23, 'BURDUR', 15),
(24, 'ÇANAKKALE', 17),
(25, 'ÇANKIRI', 18),
(26, 'ÇORUM', 19),
(27, 'DENİZLİ', 20),
(28, 'DİYARBAKIR', 21),
(29, 'KOCAELİ', 41),
(30, 'KONYA', 42),
(31, 'KÜTAHYA', 43),
(32, 'MALATYA', 44),
(33, 'MANİSA', 45),
(34, 'MARDİN', 47),
(35, 'MERSİN', 33),
(36, 'MUĞLA', 48),
(37, 'MUŞ', 49),
(38, 'NEVŞEHİR', 50),
(39, 'NİĞDE', 51),
(40, 'ORDU', 52),
(41, 'OSMANİYE', 80),
(42, 'RİZE', 53),
(43, 'SAKARYA', 54),
(44, 'SAMSUN', 55),
(45, 'SİİRT', 56),
(46, 'SİNOP', 57),
(47, 'ŞIRNAK', 73),
(48, 'SİVAS', 58),
(49, 'TEKİRDAĞ', 59),
(50, 'TOKAT', 60),
(51, 'TRABZON', 61),
(52, 'TUNCELİ', 62),
(53, 'ŞANLIURFA', 63),
(54, 'UŞAK', 64),
(55, 'VAN', 65),
(56, 'YALOVA', 77),
(57, 'YOZGAT', 66),
(58, 'ZONGULDAK', 67),
(59, 'DÜZCE', 81),
(60, 'EDİRNE', 22),
(61, 'ELAZIĞ', 23),
(62, 'ERZİNCAN', 24),
(63, 'ERZURUM', 25),
(64, 'ESKİŞEHİR', 26),
(65, 'GAZİANTEP', 27),
(66, 'GİRESUN', 28),
(67, 'GÜMÜŞHANE', 29),
(68, 'HAKKARİ', 30),
(69, 'HATAY', 31),
(70, 'IĞDIR', 76),
(71, 'ISPARTA', 32),
(72, 'KAHRAMANMARAŞ', 46),
(73, 'KARABÜK', 78),
(74, 'KARAMAN', 70),
(75, 'KARS', 36),
(76, 'KASTAMONU', 37),
(77, 'KAYSERİ', 38),
(78, 'KİLİS', 79),
(79, 'KIRIKKALE', 71),
(80, 'KIRKLARELİ', 39),
(81, 'KIRŞEHİR', 40);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `iletisim`
--

CREATE TABLE `iletisim` (
  `iletisim_id` int(11) NOT NULL,
  `iletisim_tarih` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `iletisim_isim` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `iletisim_mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `iletisim_mesaj` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `iletisim`
--

INSERT INTO `iletisim` (`iletisim_id`, `iletisim_tarih`, `iletisim_isim`, `iletisim_mail`, `iletisim_mesaj`) VALUES
(1, '2018-01-25 10:59:37', 'Ahmet Aksu', 'ahmet@hotmail.com', 'Merhaba web sitesi yazılımı istiyorum.'),
(2, '2018-01-25 10:59:39', 'Kemal Demir', 'ahmet@hotmail.com', 'Merhaba web sitesi yazılımı istiyorum.');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriler`
--

CREATE TABLE `kategoriler` (
  `kategori_id` int(11) NOT NULL,
  `kategori_ad` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `kategori_sira` int(11) NOT NULL,
  `kategori_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `kategori_descr` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `kategori_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kategoriler`
--

INSERT INTO `kategoriler` (`kategori_id`, `kategori_ad`, `kategori_sira`, `kategori_title`, `kategori_descr`, `kategori_keyword`) VALUES
(1, 'Kurumsal', 1, 'Kurumsal', 'Kurumsal', 'Kurumsal'),
(3, 'Çilingir', 3, 'Çilingir', 'Çilingir', 'Çilingir'),
(4, 'Nakliyat', 4, 'Nakliyat', 'Nakliyat', 'Nakliyat'),
(5, 'Avukat / Hukuk Bürosu', 2, 'Avukat / Hukuk Bürosu', 'Avukat / Hukuk Bürosu', 'Avukat / Hukuk Bürosu'),
(6, 'İnşaat / Müteahhit', 8, 'İnşaat / Müteahhit', 'İnşaat / Müteahhit', 'İnşaat / Müteahhit'),
(7, 'İlaçlama Firması', 6, 'İlaçlama Firması', 'İlaçlama Firması', 'İlaçlama Firması'),
(8, 'Temizlik Firması', 7, 'Temizlik Firması', 'Temizlik Firması', 'Temizlik Firması'),
(9, 'Tek Ürün', 9, 'Tek Ürün', 'Tek Ürün', 'Tek Ürün'),
(10, 'Spor Salonu', 10, 'Spor Salonu', 'Spor Salonu', 'Spor Salonu'),
(11, 'Sağlık / Hastane', 11, 'Sağlık / Hastane', 'Sağlık / Hastane', 'Sağlık / Hastane'),
(12, 'Restaurant / Cafe', 0, 'Restaurant / Cafe', 'Restaurant / Cafe', 'Restaurant / Cafe');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategorilerb`
--

CREATE TABLE `kategorilerb` (
  `kategori_id` int(11) NOT NULL,
  `kategori_ad` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `kategori_sira` int(11) NOT NULL,
  `kategori_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `kategori_descr` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `kategori_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kategorilerb`
--

INSERT INTO `kategorilerb` (`kategori_id`, `kategori_ad`, `kategori_sira`, `kategori_title`, `kategori_descr`, `kategori_keyword`) VALUES
(2, 'Sınırsız Blog Kategorisi 2', 2, 'Sınırsız Blog Kategorisi 2', 'Sınırsız Blog Kategorisi 2', 'Sınırsız Blog Kategorisi 2'),
(3, 'Sınırsız Blog Kategorisi 3', 3, 'Sınırsız Blog Kategorisi 3', 'Sınırsız Blog Kategorisi 3', 'Sınırsız Blog Kategorisi 3'),
(5, 'Sınırsız Blog Kategorisi 1', 1, 'Sınırsız Blog Kategorisi 1', 'Sınırsız Blog Kategorisi 1', 'Sınırsız Blog Kategorisi 1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoripaket`
--

CREATE TABLE `kategoripaket` (
  `kategori_id` int(11) NOT NULL,
  `kategori_ad` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `kategori_sira` int(11) NOT NULL,
  `kategori_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `kategori_descr` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `kategori_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `vitrin` int(11) DEFAULT '0',
  `resim` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kategoripaket`
--

INSERT INTO `kategoripaket` (`kategori_id`, `kategori_ad`, `kategori_sira`, `kategori_title`, `kategori_descr`, `kategori_keyword`, `vitrin`, `resim`) VALUES
(1, 'Seo Hizmeti', 1, 'Seo Hizmeti', 'Seo Hizmeti', 'Seo Hizmeti', 1, 'assets/img/genel/26170.jpg'),
(3, 'İçerik Hizmeti', 2, 'İçerik Hizmeti', 'İçerik Hizmeti', 'İçerik Hizmeti', 1, 'assets/img/genel/22745.jpg'),
(4, 'Tasarım Hizmeti', 3, 'Tasarım Hizmeti', 'Tasarım Hizmeti', 'Tasarım Hizmeti', 1, 'assets/img/genel/24766.jpg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriproje`
--

CREATE TABLE `kategoriproje` (
  `kategori_id` int(11) NOT NULL,
  `kategori_ad` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `kategori_sira` int(11) NOT NULL,
  `kategori_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `kategori_descr` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `kategori_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `vitrin` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kategoriproje`
--

INSERT INTO `kategoriproje` (`kategori_id`, `kategori_ad`, `kategori_sira`, `kategori_title`, `kategori_descr`, `kategori_keyword`, `vitrin`) VALUES
(1, 'Kurumsal Projeler', 1, 'Kurumsal Projeler', 'Kurumsal Projeler', 'Kurumsal Projeler', 1),
(3, 'Tamamlanan Projeler', 2, 'Tamamlanan Projeler', 'Tamamlanan Projeler', 'Tamamlanan Projeler', 1),
(4, 'Devam Eden Projeler', 3, '1', '1', '1', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kredi_karti_odemesi`
--

CREATE TABLE `kredi_karti_odemesi` (
  `id` int(11) NOT NULL,
  `siparis_id` int(11) NOT NULL,
  `odeme_kodu` varchar(255) NOT NULL,
  `odeme_tarih` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `kredi_karti_odemesi`
--

INSERT INTO `kredi_karti_odemesi` (`id`, `siparis_id`, `odeme_kodu`, `odeme_tarih`) VALUES
(1, 72, '535930', '2018-09-11 14:17:02'),
(2, 73, '894251', '2018-09-11 14:19:20'),
(3, 74, '539344', '2018-09-11 14:22:12'),
(4, 75, '359096', '2018-09-12 13:25:40'),
(5, 76, '167830', '2018-09-12 13:33:17'),
(6, 77, '696976', '2018-09-16 00:26:18'),
(7, 78, '046753', '2018-09-16 00:32:26'),
(8, 79, '657064', '2018-09-17 15:16:13'),
(9, 85, '803877', '2018-09-19 18:56:30');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanici`
--

CREATE TABLE `kullanici` (
  `kullanici_id` int(11) NOT NULL,
  `kullanici_adi` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_pass` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_adsoyad` varchar(500) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_resim` varchar(500) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kullanici`
--

INSERT INTO `kullanici` (`kullanici_id`, `kullanici_adi`, `kullanici_pass`, `kullanici_adsoyad`, `kullanici_resim`) VALUES
(0, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Son Yazılım', 'assets/img/genel/28853.jpg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mail`
--

CREATE TABLE `mail` (
  `mail_id` int(11) NOT NULL,
  `mail_user` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `mail_host` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `mail_port` int(250) NOT NULL,
  `mail_pass` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `mail_secure` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `mail_sender` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `mail_name` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `mail_bildirim` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `mail`
--

INSERT INTO `mail` (`mail_id`, `mail_user`, `mail_host`, `mail_port`, `mail_pass`, `mail_secure`, `mail_sender`, `mail_name`, `mail_bildirim`) VALUES
(0, 'bilgi@example.com', 'smtp.yandex.com.tr', 465, 'xxxx', 'ssl', 'bilgi@example.com', 'Ajans V6plus', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `markalar`
--

CREATE TABLE `markalar` (
  `hizmet_id` int(11) NOT NULL,
  `hizmet_baslik` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `hizmet_icerik` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `hizmet_resim` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `hizmet_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `hizmet_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `hizmet_descr` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `hizmet_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `hizmet_vitrin` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `markalar`
--

INSERT INTO `markalar` (`hizmet_id`, `hizmet_baslik`, `hizmet_icerik`, `hizmet_resim`, `hizmet_icon`, `hizmet_title`, `hizmet_descr`, `hizmet_keyword`, `hizmet_vitrin`) VALUES
(1, 'Maktek Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/3037931371.jpg', '', 'Maktek Kombi Servisi', 'Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa', 'Maktek Kombi Servisi', ''),
(11, 'Baykan Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2906928423.jpg', '', 'Baykan Kombi Servisi', 'Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus.', 'Baykan Kombi Servisi', ''),
(12, 'Alarko Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2611229008.jpg', '', 'Alarko Kombi Servisi', 'Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus.', 'Alarko Kombi Servisi', ''),
(37, 'İmmergas Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/3037931371.jpg', '', 'İmmergas Kombi Servisi', 'Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa', 'Maktek Kombi Servisi', ''),
(38, 'Ferroli Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2906928423.jpg', '', 'Ferroli Kombi Servisi', 'Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus.', 'Ferroli Kombi Servisi', ''),
(39, 'Eca Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2611229008.jpg', '', 'Eca Kombi Servisi', 'Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus.', 'Eca Kombi Servisi', ''),
(40, 'Beko Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/3037931371.jpg', '', 'Beko Kombi Servisi', 'Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa', 'Beko Kombi Servisi', ''),
(41, 'Protherm Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2906928423.jpg', '', 'Protherm Kombi Servisi', 'Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus.', 'Protherm Kombi Servisi', ''),
(42, 'Demirdöküm Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2611229008.jpg', '', 'Demirdöküm Kombi Servisi', 'Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus.', 'Demirdöküm Kombi Servisi', ''),
(43, 'Bosch Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/3037931371.jpg', '', 'Bosch Kombi Servisi', 'Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa', 'Bosch Kombi Servisi', ''),
(44, 'Viessmann Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2906928423.jpg', '', 'Viessmann Kombi Servisi', 'Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus.', 'Viessmann Kombi Servisi', ''),
(45, 'Buderus Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2611229008.jpg', '', 'Buderus Kombi Servisi', 'Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus.', 'Buderus Kombi Servisi', ''),
(46, 'Vaillant Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2611229008.jpg', '', 'Vaillant Kombi Servisi', 'Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus.', 'Vaillant Kombi Servisi', '');
INSERT INTO `markalar` (`hizmet_id`, `hizmet_baslik`, `hizmet_icerik`, `hizmet_resim`, `hizmet_icon`, `hizmet_title`, `hizmet_descr`, `hizmet_keyword`, `hizmet_vitrin`) VALUES
(47, 'Aeg Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2906928423.jpg', '', 'Aeg Kombi Servisi', 'Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus.', 'Aeg Kombi Servisi', ''),
(48, 'Airfel Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2611229008.jpg', '', 'Airfel Kombi Servisi', 'Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus.', 'Airfel Kombi Servisi', ''),
(49, 'Ariston Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2611229008.jpg', '', 'Ariston Kombi Servisi', 'Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus.', 'Ariston Kombi Servisi', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mesajlar`
--

CREATE TABLE `mesajlar` (
  `mesaj_id` int(11) NOT NULL,
  `mesaj_tarih` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `mesaj_ad` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `mesaj_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `mesaj_mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `mesaj_icerik` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `mesajlar`
--

INSERT INTO `mesajlar` (`mesaj_id`, `mesaj_tarih`, `mesaj_ad`, `mesaj_tel`, `mesaj_mail`, `mesaj_icerik`) VALUES
(14, '2020-11-11 14:44:50', 'Ozan Öz', NULL, 'webkozik@gmail.com', 'Deneme İletişim formu mesajıdır.'),
(15, '2020-12-04 10:12:49', 'Ozan Öz', NULL, 'webkozik@gmail.com', 'dsagag'),
(16, '2020-12-04 12:32:00', 'Ozan Öz', NULL, 'webkozik@gmail.com', 'adsgdag'),
(17, '2020-12-04 12:32:45', 'Ozan Öz', NULL, 'webkozik@gmail.com', 'asdgdag'),
(18, '2020-12-04 12:37:44', 'Ozan Öz', NULL, 'webkozik@gmail.com', 'zgsdgsdg'),
(19, '2020-12-04 12:38:45', 'Ozan Öz', NULL, 'webkozik@gmail.com', 'safadsg'),
(20, '2020-12-04 12:40:24', 'Ozan Öz', NULL, 'webkozik@gmail.com', 'adgdag'),
(21, '2020-12-04 12:41:23', 'Ozan Öz', NULL, 'webkozik@gmail.com', 'adsgdag');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `meta`
--

CREATE TABLE `meta` (
  `meta_id` int(11) NOT NULL,
  `meta_ad` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `meta_descr` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `meta_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `meta`
--

INSERT INTO `meta` (`meta_id`, `meta_ad`, `meta_title`, `meta_descr`, `meta_keyword`) VALUES
(1, 'Ürünler', 'Ürünler | WEB AJANS V7+', 'Gelişmiş WEB AJANS V7+ scriptleri ile full admin kontrollü PHP PDO HTML 5 yazılımları buradan inceleyebilir ve satın alabilirsiniz.', 'WEB AJANS V7+'),
(2, 'Hizmetler', 'Hizmetler | WEB AJANS V7+', 'Gelişmiş PHP PDO gelişmiş admin panelli WEB AJANS V7+ için Hemen hizmetlerimizi inceleyiniz.', 'WEB AJANS V7+'),
(3, 'Projeler', 'Projeler | WEB AJANS V7+', 'WEB AJANS V7+ için geliştirdiğimiz tüm projeleri inceleyebilirsiniz.', 'WEB AJANS V7+ yazılımı projeleri'),
(4, 'Blog', 'Blog | WEB AJANS V7+', 'WEB AJANS V7+ ile ilgili blog, haber ve duyuru paylaşımı sayfasında size uygun kampanya güncel duyuruları takip edin.', 'WEB AJANS V7+ blog sayfası,'),
(5, 'Sık Sorulan Sorular', 'Sık Sorulan Sorular | WEB AJANS V7+', 'Sık Sorulan Sorular WEB AJANS V7+ satın alırken ve almadan önce aklınıza takılan soruları yanıtlıyoruz.', 'Sık Sorulan Sorular , WEB AJANS V7+  sık sorulan sorular'),
(8, 'İletişim', 'İLETİŞİM | WEB AJANS V7+', 'Türkiye\'de ilk ve tek en kapsamlı ve gelişmiş son sitem WEB AJANS V7+ için hemen iletişime geçin.', 'WEB AJANS V7+ sipariş sayfası'),
(9, 'Üye Ol', 'Üye Ol | WEB AJANS V7+', 'Üye Ol WEB AJANS V7+ yazılımı satın almak için Üye Ol.', 'Üye Ol'),
(10, 'Üye Girişi', 'Üye Girişi | WEB AJANS V7+', 'Üye Girişi WEB AJANS V7+ yazılımı satın almak için Üye Girişi yap.', 'Üye Girişi'),
(11, 'Hesabım', 'Hesabım | WEB AJANS V7+', 'Hesabım TWEB AJANS V7+ satın almak için satın al.', 'Hesabım'),
(12, 'Paketler', 'Paketler | WEB AJANS V7+', 'Gelişmiş WEB AJANS V7+ ile full admin kontrollü PHP PDO HTML 5 yazılımları buradan inceleyebilir ve satın alabilirsiniz.', 'tek ürün scripti, tek ürün yazılımı, single product'),
(13, 'Şifremi Unuttum', 'Şifremi Unuttum | WEB AJANS V7+', 'Şifremi Unuttum TWEB AJANS V7+ satın almak için satın al.', 'Şifremi Unuttum'),
(14, 'Sepetim', 'Sepetim | WEB AJANS V7+', 'Sepetim TWEB AJANS V7+ satın almak için satın al.', 'Sepetim'),
(15, 'Referanslar', 'Referanslar | WEB AJANS V7+', 'Referanslar WEB AJANS V7+ satın almak için satın al.', 'Referanslar ');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `motor`
--

CREATE TABLE `motor` (
  `motor_id` int(11) NOT NULL,
  `motor_analitik` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `motor_metrika` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `motor_gonay` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `motor_yonay` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `motor`
--

INSERT INTO `motor` (`motor_id`, `motor_analitik`, `motor_metrika`, `motor_gonay`, `motor_yonay`) VALUES
(1, '', '', '', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `odeme`
--

CREATE TABLE `odeme` (
  `odeme_id` int(11) NOT NULL,
  `odeme_adi` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `odeme_durum` int(11) NOT NULL,
  `odeme_not` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `odeme`
--

INSERT INTO `odeme` (`odeme_id`, `odeme_adi`, `odeme_durum`, `odeme_not`) VALUES
(1, 'Havale ile Öde', 1, 'Ödeme işlemi sırasında lütfen sipariş numaranızı belirtiniz.'),
(2, 'Kapıda Öde', 1, 'Kapıda İster Kredi kartı ister nakit ödeyebilirsiniz.'),
(3, 'Kredi Kartı', 1, 'Kredi kartı ile online ödeme');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `odemebildirim`
--

CREATE TABLE `odemebildirim` (
  `id` int(11) NOT NULL,
  `tarih` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `siparis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `omenu`
--

CREATE TABLE `omenu` (
  `omenu_id` int(11) NOT NULL,
  `omenu_ad` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `omenu_ust` int(11) NOT NULL DEFAULT '0',
  `omenu_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `omenu_sira` int(11) NOT NULL,
  `omenu_durum` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `omenu`
--

INSERT INTO `omenu` (`omenu_id`, `omenu_ad`, `omenu_ust`, `omenu_link`, `omenu_sira`, `omenu_durum`) VALUES
(71, 'HİZMETLER', 0, 'hizmetler', 2, 71),
(73, 'SAYFALAR', 0, '#', 1, 73),
(74, 'PAKETLER', 0, '#', 4, 74),
(76, 'İptal ve İade Şartları', 73, 'sayfa-iptal-ve-iade-sartlari-4', 3, 73),
(79, 'WEB TASARIM', 71, 'hizmet-web-tasarim-1', 1, 71),
(80, 'SEO ÇALIŞMASI', 71, 'hizmet-seo-calismasi-2', 2, 71),
(81, 'E TİCARET', 71, 'hizmet-e-ticaret-3', 3, 71),
(82, 'SOSYAL MEDYA YÖNETİMİ', 71, 'hizmet-sosyal-medya-yonetimi-4', 4, 71),
(83, 'MOBİL UYGULAMA', 71, 'hizmet-mobil-uygulama-5', 5, 71),
(84, 'ADWORDS ÇALIŞMASI', 71, 'hizmet-adwords-calismasi-6', 6, 71),
(85, 'REKLAM YÖNETİMİ', 71, 'hizmet-reklam-yonetimi-7', 8, 71),
(86, 'KURUMSAL KİMLİK', 71, 'hizmet-kurumsal-kimlik-8', 9, 71),
(87, 'PROJE GELİŞTİRME', 71, 'hizmet-proje-gelistirme-9', 9, 71),
(98, 'Mesafeli Satış Sözleşmesi', 73, 'sayfa-mesafeli-satis-sozlesmesi-6', 3, 73),
(99, 'İçerik Hizmeti', 74, 'paket-icerik-hizmeti-3', 3, 74),
(100, 'Seo Hizmeti', 74, 'paket-seo-hizmeti-1', 1, 74),
(101, 'Tasarım Hizmeti', 74, 'paket-tasarim-hizmeti-4', 2, 74),
(103, 'Hakkımızda', 73, 'sayfa-hakkimizda-1', 1, 73),
(104, 'Tüm Hizmetlerimiz', 71, 'hizmetler', 25, 71),
(105, 'Banka Hesaplarimiz', 73, 'banka-hesaplarimiz', 3, 73),
(106, 'BLOG', 0, 'blog', 6, 0),
(107, 'İLETİŞİM', 0, 'iletisim', 7, 0),
(108, 'SSS', 0, 'sss', 5, 0),
(109, 'TÜM ÜRÜNLER', 0, 'urunler', 1, 0),
(110, 'Tüm Paketler', 74, 'paketler', 4, 74);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `paytr`
--

CREATE TABLE `paytr` (
  `paytr_id` int(11) NOT NULL,
  `paytr_magaza` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `paytr_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `paytr_salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `paytr`
--

INSERT INTO `paytr` (`paytr_id`, `paytr_magaza`, `paytr_key`, `paytr_salt`) VALUES
(1, '', '', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `projeler`
--

CREATE TABLE `projeler` (
  `proje_id` int(11) NOT NULL,
  `proje_baslik` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `proje_resim` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `proje_icerik` varchar(2999) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `proje_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `proje_descr` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `proje_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `proje_vitrin` int(11) DEFAULT '0',
  `kategori` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `projeler`
--

INSERT INTO `projeler` (`proje_id`, `proje_baslik`, `proje_resim`, `proje_icerik`, `proje_title`, `proje_descr`, `proje_keyword`, `proje_vitrin`, `kategori`) VALUES
(113, 'Tamirci Firma Sitesi', 'assets/img/projeler/2393422889.jpg', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\"><span open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Fusce congue rhoncus lectus, ultricies suscipit diam gravida non. Etiam consectetur consequat pulvinar.<font color=\"#0000ff\"> Phasellus nisl arcu</font>, blandit varius ultrices id, interdum a ante. Nulla facilisi. Integer faucibus mauris magna, sit amet fermentum risus feugiat quis. Phasellus sed mauris at <u>nulla varius consectetur</u>. Integer non tortor quis sapien accumsan tristique. Nunc pharetra nunc non metus porta, non mollis mi suscipit. Sed sagittis quis dui sit amet imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec et enim in ex sagittis lacinia sed sed ante. Integer quis tortor eu sem facilisis sagittis sit amet at massa. </span><font face=\"Arial Black\">Sed congue ut mi vitae</font><font face=\"Open Sans, Arial, sans-serif\"> consequat.</font></p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Aliquam imperdiet, dui a semper ultrices, odio odio semper est, sed lobortis velit mauris sit amet est. Morbi elementum ligula et urna vulputate finibus. Morbi dapibus lorem id quam iaculis, eget iaculis urna pharetra. Vivamus sodales mi diam, quis faucibus diam luctus id. <font color=\"#ff0000\">Pellentesque habitant</font> morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur non nisi eu velit aliquet pellentesque. Duis facilisis tortor in sagittis consectetur. Quisque dolor ante, ullamcorper a blandit elementum, consectetur scelerisque ante. Morbi posuere ligula non auctor molestie. Fusce non metus elementum, finibus magna sed, sagittis ex. Curabitur fermentum nunc mattis consequat faucibus. Donec dignissim eros erat, eu accumsan felis finibus id. Nulla posuere, nibh in efficitur tempus, neque ante placerat turpis, id dictum augue arcu a enim.</p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Integer leo turpis, aliquam sed pretium lacinia, elementum non augue. Phasellus lobortis risus facilisis mi vestibulum congue. Suspendisse quis lorem eget sapien tincidunt lacinia posuere ut nunc. Integer hendrerit libero lorem, et lobortis quam pellentesque eu. Aenean dapibus efficitur tellus, sit amet elementum tellus. Curabitur scelerisque felis quis ultricies interdum. Praesent lacus nunc, dignissim id nisi sit amet, interdum gravida neque. Integer eu lacus leo. Morbi mattis leo <font color=\"#104a5a\">a leo luctus</font>, ullamcorper tempus ex porta. Aenean auctor massa eget vulputate convallis. Suspendisse pellentesque sem in neque consequat, vel lobortis libero aliquam. Vivamus nibh nisi, laoreet nec ornare nec, ultricies id lectus.<u> </u></p>', 'Tamirci Firma Sitesi', 'Tamirci Firma Sitesi', 'Tamirci Firma Sitesi', 1, 4),
(120, 'Hastane Proje Tasarımı', 'assets/img/projeler/2393422889.jpg', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\"><span open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Fusce congue rhoncus lectus, ultricies suscipit diam gravida non. Etiam consectetur consequat pulvinar.<font color=\"#0000ff\"> Phasellus nisl arcu</font>, blandit varius ultrices id, interdum a ante. Nulla facilisi. Integer faucibus mauris magna, sit amet fermentum risus feugiat quis. Phasellus sed mauris at <u>nulla varius consectetur</u>. Integer non tortor quis sapien accumsan tristique. Nunc pharetra nunc non metus porta, non mollis mi suscipit. Sed sagittis quis dui sit amet imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec et enim in ex sagittis lacinia sed sed ante. Integer quis tortor eu sem facilisis sagittis sit amet at massa. </span><font face=\"Arial Black\">Sed congue ut mi vitae</font><font face=\"Open Sans, Arial, sans-serif\"> consequat.</font></p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Aliquam imperdiet, dui a semper ultrices, odio odio semper est, sed lobortis velit mauris sit amet est. Morbi elementum ligula et urna vulputate finibus. Morbi dapibus lorem id quam iaculis, eget iaculis urna pharetra. Vivamus sodales mi diam, quis faucibus diam luctus id. <font color=\"#ff0000\">Pellentesque habitant</font> morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur non nisi eu velit aliquet pellentesque. Duis facilisis tortor in sagittis consectetur. Quisque dolor ante, ullamcorper a blandit elementum, consectetur scelerisque ante. Morbi posuere ligula non auctor molestie. Fusce non metus elementum, finibus magna sed, sagittis ex. Curabitur fermentum nunc mattis consequat faucibus. Donec dignissim eros erat, eu accumsan felis finibus id. Nulla posuere, nibh in efficitur tempus, neque ante placerat turpis, id dictum augue arcu a enim.</p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Integer leo turpis, aliquam sed pretium lacinia, elementum non augue. Phasellus lobortis risus facilisis mi vestibulum congue. Suspendisse quis lorem eget sapien tincidunt lacinia posuere ut nunc. Integer hendrerit libero lorem, et lobortis quam pellentesque eu. Aenean dapibus efficitur tellus, sit amet elementum tellus. Curabitur scelerisque felis quis ultricies interdum. Praesent lacus nunc, dignissim id nisi sit amet, interdum gravida neque. Integer eu lacus leo. Morbi mattis leo <font color=\"#104a5a\">a leo luctus</font>, ullamcorper tempus ex porta. Aenean auctor massa eget vulputate convallis. Suspendisse pellentesque sem in neque consequat, vel lobortis libero aliquam. Vivamus nibh nisi, laoreet nec ornare nec, ultricies id lectus.<u> </u></p>', 'Hastane Proje Tasarımı', 'Hastane Proje Tasarımı', 'Hastane Proje Tasarımı', 1, 4),
(121, 'Vakıf Web Site Yazılım Projesi', 'assets/img/projeler/2393422889.jpg', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\"><span style=\"font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Fusce congue rhoncus lectus, ultricies suscipit diam gravida non. Etiam consectetur consequat pulvinar.<font color=\"#0000ff\"> Phasellus nisl arcu</font>, blandit varius ultrices id, interdum a ante. Nulla facilisi. Integer faucibus mauris magna, sit amet fermentum risus feugiat quis. Phasellus sed mauris at <u>nulla varius consectetur</u>. Integer non tortor quis sapien accumsan tristique. Nunc pharetra nunc non metus porta, non mollis mi suscipit. Sed sagittis quis dui sit amet imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec et enim in ex sagittis lacinia sed sed ante. Integer quis tortor eu sem facilisis sagittis sit amet at massa. </span><font face=\"Arial Black\">Sed congue ut mi vitae</font><font face=\"Open Sans, Arial, sans-serif\"> consequat.</font></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Aliquam imperdiet, dui a semper ultrices, odio odio semper est, sed lobortis velit mauris sit amet est. Morbi elementum ligula et urna vulputate finibus. Morbi dapibus lorem id quam iaculis, eget iaculis urna pharetra. Vivamus sodales mi diam, quis faucibus diam luctus id. <font color=\"#ff0000\">Pellentesque habitant</font> morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur non nisi eu velit aliquet pellentesque. Duis facilisis tortor in sagittis consectetur. Quisque dolor ante, ullamcorper a blandit elementum, consectetur scelerisque ante. Morbi posuere ligula non auctor molestie. Fusce non metus elementum, finibus magna sed, sagittis ex. Curabitur fermentum nunc mattis consequat faucibus. Donec dignissim eros erat, eu accumsan felis finibus id. Nulla posuere, nibh in efficitur tempus, neque ante placerat turpis, id dictum augue arcu a enim.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Integer leo turpis, aliquam sed pretium lacinia, <b>elementum non</b> augue. Phasellus lobortis risus facilisis mi vestibulum congue. Suspendisse quis lorem eget sapien tincidunt lacinia posuere ut nunc. Integer hendrerit libero lorem, et lobortis quam pellentesque eu. Aenean dapibus efficitur tellus, sit amet elementum tellus. Curabitur scelerisque felis quis ultricies interdum. Praesent lacus nunc, dignissim id nisi sit amet, interdum gravida neque. Integer eu lacus leo. Morbi mattis leo <font color=\"#104a5a\">a leo luctus</font>, <b>ullamcorper</b> tempus ex porta. Aenean auctor massa eget vulputate convallis. Suspendisse pellentesque sem in neque consequat, vel lobortis libero aliquam. Vivamus nibh nisi, laoreet nec ornare nec, ultricies id lectus.<u><b> </b></u></p>', 'Vakıf Web Site Yazılım Projesi', 'Vakıf Web Site Yazılım Projesi', 'Vakıf Web Site Yazılım Projesi', 0, 4),
(122, 'Çilingir Firma Yazılım Projesi', 'assets/img/projeler/2393422889.jpg', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\"><span open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Fusce congue rhoncus lectus, ultricies suscipit diam gravida non. Etiam consectetur consequat pulvinar.<font color=\"#0000ff\"> Phasellus nisl arcu</font>, blandit varius ultrices id, interdum a ante. Nulla facilisi. Integer faucibus mauris magna, sit amet fermentum risus feugiat quis. Phasellus sed mauris at <u>nulla varius consectetur</u>. Integer non tortor quis sapien accumsan tristique. Nunc pharetra nunc non metus porta, non mollis mi suscipit. Sed sagittis quis dui sit amet imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec et enim in ex sagittis lacinia sed sed ante. Integer quis tortor eu sem facilisis sagittis sit amet at massa. </span><font face=\"Arial Black\">Sed congue ut mi vitae</font><font face=\"Open Sans, Arial, sans-serif\"> consequat.</font></p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Aliquam imperdiet, dui a semper ultrices, odio odio semper est, sed lobortis velit mauris sit amet est. Morbi elementum ligula et urna vulputate finibus. Morbi dapibus lorem id quam iaculis, eget iaculis urna pharetra. Vivamus sodales mi diam, quis faucibus diam luctus id. <font color=\"#ff0000\">Pellentesque habitant</font> morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur non nisi eu velit aliquet pellentesque. Duis facilisis tortor in sagittis consectetur. Quisque dolor ante, ullamcorper a blandit elementum, consectetur scelerisque ante. Morbi posuere ligula non auctor molestie. Fusce non metus elementum, finibus magna sed, sagittis ex. Curabitur fermentum nunc mattis consequat faucibus. Donec dignissim eros erat, eu accumsan felis finibus id. Nulla posuere, nibh in efficitur tempus, neque ante placerat turpis, id dictum augue arcu a enim.</p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Integer leo turpis, aliquam sed pretium lacinia, elementum non augue. Phasellus lobortis risus facilisis mi vestibulum congue. Suspendisse quis lorem eget sapien tincidunt lacinia posuere ut nunc. Integer hendrerit libero lorem, et lobortis quam pellentesque eu. Aenean dapibus efficitur tellus, sit amet elementum tellus. Curabitur scelerisque felis quis ultricies interdum. Praesent lacus nunc, dignissim id nisi sit amet, interdum gravida neque. Integer eu lacus leo. Morbi mattis leo <font color=\"#104a5a\">a leo luctus</font>, ullamcorper tempus ex porta. Aenean auctor massa eget vulputate convallis. Suspendisse pellentesque sem in neque consequat, vel lobortis libero aliquam. Vivamus nibh nisi, laoreet nec ornare nec, ultricies id lectus.<u> </u></p>', 'Çilingir Firma Yazılım Projesi', 'Çilingir Firma Yazılım Projesi', 'Çilingir Firma Yazılım Projesi', 1, 1),
(123, 'Nakliyat firma web site yazılımı', 'assets/img/projeler/2393422889.jpg', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\"><span open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Fusce congue rhoncus lectus, ultricies suscipit diam gravida non. Etiam consectetur consequat pulvinar.<font color=\"#0000ff\"> Phasellus nisl arcu</font>, blandit varius ultrices id, interdum a ante. Nulla facilisi. Integer faucibus mauris magna, sit amet fermentum risus feugiat quis. Phasellus sed mauris at <u>nulla varius consectetur</u>. Integer non tortor quis sapien accumsan tristique. Nunc pharetra nunc non metus porta, non mollis mi suscipit. Sed sagittis quis dui sit amet imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec et enim in ex sagittis lacinia sed sed ante. Integer quis tortor eu sem facilisis sagittis sit amet at massa. </span><font face=\"Arial Black\">Sed congue ut mi vitae</font><font face=\"Open Sans, Arial, sans-serif\"> consequat.</font></p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Aliquam imperdiet, dui a semper ultrices, odio odio semper est, sed lobortis velit mauris sit amet est. Morbi elementum ligula et urna vulputate finibus. Morbi dapibus lorem id quam iaculis, eget iaculis urna pharetra. Vivamus sodales mi diam, quis faucibus diam luctus id. <font color=\"#ff0000\">Pellentesque habitant</font> morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur non nisi eu velit aliquet pellentesque. Duis facilisis tortor in sagittis consectetur. Quisque dolor ante, ullamcorper a blandit elementum, consectetur scelerisque ante. Morbi posuere ligula non auctor molestie. Fusce non metus elementum, finibus magna sed, sagittis ex. Curabitur fermentum nunc mattis consequat faucibus. Donec dignissim eros erat, eu accumsan felis finibus id. Nulla posuere, nibh in efficitur tempus, neque ante placerat turpis, id dictum augue arcu a enim.</p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Integer leo turpis, aliquam sed pretium lacinia, elementum non augue. Phasellus lobortis risus facilisis mi vestibulum congue. Suspendisse quis lorem eget sapien tincidunt lacinia posuere ut nunc. Integer hendrerit libero lorem, et lobortis quam pellentesque eu. Aenean dapibus efficitur tellus, sit amet elementum tellus. Curabitur scelerisque felis quis ultricies interdum. Praesent lacus nunc, dignissim id nisi sit amet, interdum gravida neque. Integer eu lacus leo. Morbi mattis leo <font color=\"#104a5a\">a leo luctus</font>, ullamcorper tempus ex porta. Aenean auctor massa eget vulputate convallis. Suspendisse pellentesque sem in neque consequat, vel lobortis libero aliquam. Vivamus nibh nisi, laoreet nec ornare nec, ultricies id lectus.<u> </u></p>', 'Nakliyat firma web site yazılımı', 'Nakliyat firma web site yazılımı', 'Nakliyat firma web site yazılımı', 1, 1),
(124, 'Emlak Firma Web Site Yazılımı', 'assets/img/projeler/2393422889.jpg', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\"><span open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Fusce congue rhoncus lectus, ultricies suscipit diam gravida non. Etiam consectetur consequat pulvinar.<font color=\"#0000ff\"> Phasellus nisl arcu</font>, blandit varius ultrices id, interdum a ante. Nulla facilisi. Integer faucibus mauris magna, sit amet fermentum risus feugiat quis. Phasellus sed mauris at <u>nulla varius consectetur</u>. Integer non tortor quis sapien accumsan tristique. Nunc pharetra nunc non metus porta, non mollis mi suscipit. Sed sagittis quis dui sit amet imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec et enim in ex sagittis lacinia sed sed ante. Integer quis tortor eu sem facilisis sagittis sit amet at massa. </span><font face=\"Arial Black\">Sed congue ut mi vitae</font><font face=\"Open Sans, Arial, sans-serif\"> consequat.</font></p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Aliquam imperdiet, dui a semper ultrices, odio odio semper est, sed lobortis velit mauris sit amet est. Morbi elementum ligula et urna vulputate finibus. Morbi dapibus lorem id quam iaculis, eget iaculis urna pharetra. Vivamus sodales mi diam, quis faucibus diam luctus id. <font color=\"#ff0000\">Pellentesque habitant</font> morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur non nisi eu velit aliquet pellentesque. Duis facilisis tortor in sagittis consectetur. Quisque dolor ante, ullamcorper a blandit elementum, consectetur scelerisque ante. Morbi posuere ligula non auctor molestie. Fusce non metus elementum, finibus magna sed, sagittis ex. Curabitur fermentum nunc mattis consequat faucibus. Donec dignissim eros erat, eu accumsan felis finibus id. Nulla posuere, nibh in efficitur tempus, neque ante placerat turpis, id dictum augue arcu a enim.</p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Integer leo turpis, aliquam sed pretium lacinia, elementum non augue. Phasellus lobortis risus facilisis mi vestibulum congue. Suspendisse quis lorem eget sapien tincidunt lacinia posuere ut nunc. Integer hendrerit libero lorem, et lobortis quam pellentesque eu. Aenean dapibus efficitur tellus, sit amet elementum tellus. Curabitur scelerisque felis quis ultricies interdum. Praesent lacus nunc, dignissim id nisi sit amet, interdum gravida neque. Integer eu lacus leo. Morbi mattis leo <font color=\"#104a5a\">a leo luctus</font>, ullamcorper tempus ex porta. Aenean auctor massa eget vulputate convallis. Suspendisse pellentesque sem in neque consequat, vel lobortis libero aliquam. Vivamus nibh nisi, laoreet nec ornare nec, ultricies id lectus.<u> </u></p>', 'Emlak Firma Web Site Yazılımı', 'Emlak Firma Web Site Yazılımı', 'Emlak Firma Web Site Yazılımı', 0, 3),
(125, 'Gelişmiş İlan Site Yazılımı', 'assets/img/projeler/2393422889.jpg', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\"><span open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Fusce congue rhoncus lectus, ultricies suscipit diam gravida non. Etiam consectetur consequat pulvinar.<font color=\"#0000ff\"> Phasellus nisl arcu</font>, blandit varius ultrices id, interdum a ante. Nulla facilisi. Integer faucibus mauris magna, sit amet fermentum risus feugiat quis. Phasellus sed mauris at <u>nulla varius consectetur</u>. Integer non tortor quis sapien accumsan tristique. Nunc pharetra nunc non metus porta, non mollis mi suscipit. Sed sagittis quis dui sit amet imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec et enim in ex sagittis lacinia sed sed ante. Integer quis tortor eu sem facilisis sagittis sit amet at massa. </span><font face=\"Arial Black\">Sed congue ut mi vitae</font><font face=\"Open Sans, Arial, sans-serif\"> consequat.</font></p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Aliquam imperdiet, dui a semper ultrices, odio odio semper est, sed lobortis velit mauris sit amet est. Morbi elementum ligula et urna vulputate finibus. Morbi dapibus lorem id quam iaculis, eget iaculis urna pharetra. Vivamus sodales mi diam, quis faucibus diam luctus id. <font color=\"#ff0000\">Pellentesque habitant</font> morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur non nisi eu velit aliquet pellentesque. Duis facilisis tortor in sagittis consectetur. Quisque dolor ante, ullamcorper a blandit elementum, consectetur scelerisque ante. Morbi posuere ligula non auctor molestie. Fusce non metus elementum, finibus magna sed, sagittis ex. Curabitur fermentum nunc mattis consequat faucibus. Donec dignissim eros erat, eu accumsan felis finibus id. Nulla posuere, nibh in efficitur tempus, neque ante placerat turpis, id dictum augue arcu a enim.</p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Integer leo turpis, aliquam sed pretium lacinia, elementum non augue. Phasellus lobortis risus facilisis mi vestibulum congue. Suspendisse quis lorem eget sapien tincidunt lacinia posuere ut nunc. Integer hendrerit libero lorem, et lobortis quam pellentesque eu. Aenean dapibus efficitur tellus, sit amet elementum tellus. Curabitur scelerisque felis quis ultricies interdum. Praesent lacus nunc, dignissim id nisi sit amet, interdum gravida neque. Integer eu lacus leo. Morbi mattis leo <font color=\"#104a5a\">a leo luctus</font>, ullamcorper tempus ex porta. Aenean auctor massa eget vulputate convallis. Suspendisse pellentesque sem in neque consequat, vel lobortis libero aliquam. Vivamus nibh nisi, laoreet nec ornare nec, ultricies id lectus.<u> </u></p>', 'Gelişmiş İlan Site Yazılımı', 'Gelişmiş İlan Site Yazılımı', 'Gelişmiş İlan Site Yazılımı', 0, 3),
(126, 'Belediye Web Site Projesi', 'assets/img/projeler/2393422889.jpg', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\"><span open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Fusce congue rhoncus lectus, ultricies suscipit diam gravida non. Etiam consectetur consequat pulvinar.<font color=\"#0000ff\"> Phasellus nisl arcu</font>, blandit varius ultrices id, interdum a ante. Nulla facilisi. Integer faucibus mauris magna, sit amet fermentum risus feugiat quis. Phasellus sed mauris at <u>nulla varius consectetur</u>. Integer non tortor quis sapien accumsan tristique. Nunc pharetra nunc non metus porta, non mollis mi suscipit. Sed sagittis quis dui sit amet imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec et enim in ex sagittis lacinia sed sed ante. Integer quis tortor eu sem facilisis sagittis sit amet at massa. </span><font face=\"Arial Black\">Sed congue ut mi vitae</font><font face=\"Open Sans, Arial, sans-serif\"> consequat.</font></p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Aliquam imperdiet, dui a semper ultrices, odio odio semper est, sed lobortis velit mauris sit amet est. Morbi elementum ligula et urna vulputate finibus. Morbi dapibus lorem id quam iaculis, eget iaculis urna pharetra. Vivamus sodales mi diam, quis faucibus diam luctus id. <font color=\"#ff0000\">Pellentesque habitant</font> morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur non nisi eu velit aliquet pellentesque. Duis facilisis tortor in sagittis consectetur. Quisque dolor ante, ullamcorper a blandit elementum, consectetur scelerisque ante. Morbi posuere ligula non auctor molestie. Fusce non metus elementum, finibus magna sed, sagittis ex. Curabitur fermentum nunc mattis consequat faucibus. Donec dignissim eros erat, eu accumsan felis finibus id. Nulla posuere, nibh in efficitur tempus, neque ante placerat turpis, id dictum augue arcu a enim.</p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Integer leo turpis, aliquam sed pretium lacinia, elementum non augue. Phasellus lobortis risus facilisis mi vestibulum congue. Suspendisse quis lorem eget sapien tincidunt lacinia posuere ut nunc. Integer hendrerit libero lorem, et lobortis quam pellentesque eu. Aenean dapibus efficitur tellus, sit amet elementum tellus. Curabitur scelerisque felis quis ultricies interdum. Praesent lacus nunc, dignissim id nisi sit amet, interdum gravida neque. Integer eu lacus leo. Morbi mattis leo <font color=\"#104a5a\">a leo luctus</font>, ullamcorper tempus ex porta. Aenean auctor massa eget vulputate convallis. Suspendisse pellentesque sem in neque consequat, vel lobortis libero aliquam. Vivamus nibh nisi, laoreet nec ornare nec, ultricies id lectus.<u> </u></p>', 'Belediye Web Site Projesi', 'Belediye Web Site Projesi', 'Belediye Web Site Projesi', 1, 1),
(159, 'Gelişmiş Kurumsal Firma Yazılımı', 'assets/img/projeler/2393422889.jpg', '<p style=\"box-sizing: border-box; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-family: \"Open Sans\"; font-size: 16px; line-height: 28px; color: rgb(123, 123, 123); padding: 0px; text-align: justify;\"><span open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"box-sizing: border-box;\">Fusce congue rhoncus lectus, ultricies suscipit diam gravida non. Etiam consectetur consequat pulvinar.<font color=\"#0000ff\" style=\"box-sizing: border-box;\">Phasellus nisl arcu</font>, blandit varius ultrices id, interdum a ante. Nulla facilisi. Integer faucibus mauris magna, sit amet fermentum risus feugiat quis. Phasellus sed mauris at <u style=\"box-sizing: border-box;\">nulla varius consectetur</u>. Integer non tortor quis sapien accumsan tristique. Nunc pharetra nunc non metus porta, non mollis mi suscipit. Sed sagittis quis dui sit amet imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec et enim in ex sagittis lacinia sed sed ante. Integer quis tortor eu sem facilisis sagittis sit amet at massa. </span><font face=\"Arial Black\" style=\"box-sizing: border-box;\">Sed congue ut mi vitae</font><font face=\"Open Sans, Arial, sans-serif\" style=\"box-sizing: border-box;\"> consequat.</font></p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"box-sizing: border-box; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-family: \"Open Sans\"; font-size: 16px; line-height: 28px; color: rgb(123, 123, 123); padding: 0px; text-align: justify;\">Aliquam imperdiet, dui a semper ultrices, odio odio semper est, sed lobortis velit mauris sit amet est. Morbi elementum ligula et urna vulputate finibus. Morbi dapibus lorem id quam iaculis, eget iaculis urna pharetra. Vivamus sodales mi diam, quis faucibus diam luctus id. <font color=\"#ff0000\" style=\"box-sizing: border-box;\">Pellentesque habitant</font> morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur non nisi eu velit aliquet pellentesque. Duis facilisis tortor in sagittis consectetur. Quisque dolor ante, ullamcorper a blandit elementum, consectetur scelerisque ante. Morbi posuere ligula non auctor molestie. Fusce non metus elementum, finibus magna sed, sagittis ex. Curabitur fermentum nunc mattis consequat faucibus. Donec dignissim eros erat, eu accumsan felis finibus id. Nulla posuere, nibh in efficitur tempus, neque ante placerat turpis, id dictum augue arcu a enim.</p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"box-sizing: border-box; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-family: \"Open Sans\"; font-size: 16px; line-height: 28px; color: rgb(123, 123, 123); padding: 0px; text-align: justify;\">Integer leo turpis, aliquam sed pretium lacinia, <b style=\"box-sizing: border-box; font-weight: bold;\">elementum non</b> augue. Phasellus lobortis risus facilisis mi vestibulum congue. Suspendisse quis lorem eget sapien tincidunt lacinia posu', 'Gelişmiş Kurumsal Firma Yazılımı', 'Gelişmiş Kurumsal Firma Yazılımı', 'Gelişmiş Kurumsal Firma Yazılımı', 1, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `randevu`
--

CREATE TABLE `randevu` (
  `randevu_id` int(11) NOT NULL,
  `randevu_tarih` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `randevu_ad` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `randevu_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `randevu_hizmet` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `randevu_not` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `randevu_zaman` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `randevu_il` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `randevu_ilce` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `randevu_adres` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `randevu`
--

INSERT INTO `randevu` (`randevu_id`, `randevu_tarih`, `randevu_ad`, `randevu_tel`, `randevu_hizmet`, `randevu_not`, `randevu_zaman`, `randevu_il`, `randevu_ilce`, `randevu_adres`) VALUES
(1, '2018-02-23 15:41:08', 'OZAN ÖZ', '0546 667 6703', 'DIŞ CEPHE CAM TEMİZLİĞİ', 'TEMİZLİK YAPILACAK', '222222-02-22 22:22', 'İZMİR', 'Bağcılar', 'zcgvbxbvxvb'),
(2, '2018-04-05 13:53:24', 'asdfadsf', 'adfadf', 'ÖZEL MOBİLYA TASARIMI', 'zdxgsxh', '', '', '', ''),
(3, '2018-04-24 07:44:30', 'asdfadsf', 'adfadf', 'WEB TASARIM', 'FDHGJ', '', '', '', ''),
(4, '2018-04-24 07:46:56', 'asdfadsf', 'adfadf', 'WEB TASARIM', 'FDHGJ', '', '', '', ''),
(5, '2018-09-05 12:44:14', 'asdfadsf', '05456676703', 'WEB TASARIM', 'dfhdgjhdgj', '', '', '', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `referanslar`
--

CREATE TABLE `referanslar` (
  `referans_id` int(11) NOT NULL,
  `referans_resim1` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `referans_adi` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `referans_kategori` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `referans_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `referanslar`
--

INSERT INTO `referanslar` (`referans_id`, `referans_resim1`, `referans_adi`, `referans_kategori`, `referans_link`) VALUES
(11, 'assets/img/referanslar/2137129686.jpg', 'Firma', 'KURUMSAL', 'https://www.sonyazilim.net/'),
(12, 'assets/img/referanslar/2738929450.jpg', 'Firma', 'KURUMSAL', 'https://www.sonyazilim.net/'),
(13, 'assets/img/referanslar/3148524803.jpg', 'Firma', 'KURUMSAL', 'https://www.sonyazilim.net/'),
(14, 'assets/img/referanslar/2222820247.jpg', 'Firma', 'KURUMSAL', 'https://www.sonyazilim.net/'),
(15, 'assets/img/referanslar/2703124506.jpg', 'Firma', 'KURUMSAL', 'https://www.sonyazilim.net/'),
(16, 'assets/img/referanslar/2325021996.jpg', 'Firma', 'KURUMSAL', 'https://www.sonyazilim.net/'),
(18, 'assets/img/referanslar/3107231826.jpg', 'Firma', 'KURUMSAL', 'https://www.sonyazilim.net/'),
(19, 'assets/img/referanslar/2327828040.jpg', 'Firma', 'KURUMSAL', 'https://www.sonyazilim.net/'),
(20, 'assets/img/referanslar/2138823311.jpg', 'Firma', 'Kurumsal', 'https://www.sonyazilim.net/');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `resim`
--

CREATE TABLE `resim` (
  `resim_id` int(11) NOT NULL,
  `resim_urun` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `resim_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `resim`
--

INSERT INTO `resim` (`resim_id`, `resim_urun`, `resim_link`) VALUES
(225, '65', 'assets/img/urunler/2486426043.jpg'),
(226, '90', 'assets/img/urunler/2889731298.jpg'),
(228, '99', 'assets/img/urunler/2775621103.jpg'),
(229, '100', 'assets/img/urunler/3198323694.jpg'),
(230, '103', 'assets/img/urunler/2683622754.jpg'),
(231, '104', 'assets/img/urunler/3073525210.jpg'),
(232, '105', 'assets/img/urunler/2329328352.jpg'),
(233, '106', 'assets/img/urunler/3005223095.jpg'),
(234, '107', 'assets/img/urunler/2696621181.jpg'),
(236, '109', 'assets/img/urunler/2808326844.jpg'),
(237, '110', 'assets/img/urunler/2240322845.jpg'),
(238, '111', 'assets/img/urunler/2510531487.jpg'),
(239, '112', 'assets/img/urunler/2727630217.jpg'),
(240, '113', 'assets/img/urunler/2841130394.jpg'),
(242, '108', 'assets/img/urunler/2025627861.jpg'),
(243, '113', 'assets/img/urunler/2326026080.jpg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `resimgaleri`
--

CREATE TABLE `resimgaleri` (
  `resim_id` int(11) NOT NULL,
  `resim_baslik` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `resim_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `resimgaleri`
--

INSERT INTO `resimgaleri` (`resim_id`, `resim_baslik`, `resim_link`) VALUES
(40, '2081424944.jpg', 'assets/img/galeri/2512827769.jpg'),
(41, '2246824459.jpg', 'assets/img/galeri/2850631758.jpg'),
(42, '2530225462.jpg', 'assets/img/galeri/2734320481.jpg'),
(43, '2327622595.jpg', 'assets/img/galeri/2457329505.jpg'),
(44, '2952120010.jpg', 'assets/img/galeri/2094925986.jpg'),
(45, '2755025302.jpg', 'assets/img/galeri/2979920494.jpg'),
(46, '2986320462.jpg', 'assets/img/galeri/2163631120.jpg'),
(47, '2997631713.jpg', 'assets/img/galeri/3177727547.jpg'),
(48, '3091531310.jpg', 'assets/img/galeri/2377820054.jpg'),
(49, '3121320824.jpg', 'assets/img/galeri/2066224395.jpg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sayfalar`
--

CREATE TABLE `sayfalar` (
  `sayfa_id` int(11) NOT NULL,
  `sayfa_baslik` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `sayfa_icerik` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `sayfa_menu` int(11) NOT NULL,
  `sayfa_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `sayfa_descr` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `sayfa_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `sayfalar`
--

INSERT INTO `sayfalar` (`sayfa_id`, `sayfa_baslik`, `sayfa_icerik`, `sayfa_menu`, `sayfa_title`, `sayfa_descr`, `sayfa_keyword`) VALUES
(1, 'HAKKIMIZDA', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \"Open Sans\", Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nec arcu ut tortor volutpat posuere non eu justo. Pellentesque elementum ultricies enim a elementum. Integer feugiat sagittis diam. Praesent eget pellentesque turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc nec urna venenatis, bibendum lacus at, bibendum elit. Nunc eu neque et purus luctus volutpat. Curabitur ultrices dignissim metus, id sodales nulla aliquet ut. Aliquam viverra faucibus odio in scelerisque.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \"Open Sans\", Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ut rhoncus lectus, et varius nisl. Integer non eros eros. Quisque vel felis mollis, consectetur libero ut, congue turpis. Integer consectetur accumsan libero varius sollicitudin. Praesent eget posuere ex. Morbi vitae enim at elit scelerisque ornare nec ut tortor. Sed semper felis a ligula viverra, eleifend commodo libero laoreet. Vivamus quis sem risus. Proin dapibus tortor eu lectus scelerisque, sit amet semper odio dignissim. Nunc id est maximus, pellentesque odio ac, sodales diam. Phasellus efficitur dui id mauris cursus, a iaculis nisi accumsan. Cras tempus ante volutpat tellus iaculis molestie. Nam feugiat malesuada enim at imperdiet. Phasellus accumsan sodales lectus vitae cursus. In mattis velit non ex pellentesque, in fermentum eros tristique.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \"Open Sans\", Arial, sans-serif;\">Suspendisse potenti. Nullam id varius neque. Sed vel turpis eget ante pharetra semper. Proin pretium elit ac viverra lobortis. Aliquam convallis sapien et nunc consequat, sed iaculis arcu porttitor. Mauris interdum sit amet elit id luctus. Donec euismod massa cursus felis pellentesque eleifend.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \"Open Sans\", Arial, sans-serif;\">Sed a viverra justo. In hac habitasse platea dictumst. Pellentesque rhoncus ipsum vel scelerisque suscipit. Vivamus ut tortor luctus, interdum risus eget, luctus mi. Pellentesque sit amet nunc ac turpis tincidunt molestie at in lectus. Aenean hendrerit nunc ut nunc porttitor semper. Phasellus vestibulum, ligula quis cursus bibendum, sapien sapien efficitur odio, nec accumsan eros diam ut nibh. Sed sagittis mauris quis finibus cursus. Phasellus suscipit dolor ut mi tincidunt, eu porta massa ornare.</p>', 1, 'HAKKIMIZDA', 'HAKKIMIZDA Description', 'HAKKIMIZDA Keywords'),
(4, 'İPTAL VE İADE ŞARTLARI', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nec arcu ut tortor volutpat posuere non eu justo. Pellentesque elementum ultricies enim a elementum. Integer feugiat sagittis diam. Praesent eget pellentesque turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p><p>Nunc nec urna venenatis, bibendum lacus at, bibendum elit. Nunc eu neque et purus luctus volutpat. Curabitur ultrices dignissim metus, id sodales nulla aliquet ut. Aliquam viverra faucibus odio in scelerisque.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ut rhoncus lectus, et varius nisl. Integer non eros eros. Quisque vel felis mollis, consectetur libero ut, congue turpis. Integer consectetur accumsan libero varius sollicitudin. Praesent eget posuere ex. Morbi vitae enim at elit scelerisque ornare nec ut tortor. Sed semper felis a ligula viverra, eleifend commodo libero laoreet. </p><p>Vivamus quis sem risus. Proin dapibus tortor eu lectus scelerisque, sit amet semper odio dignissim. Nunc id est maximus, pellentesque odio ac, sodales diam. Phasellus efficitur dui id mauris cursus, a iaculis nisi accumsan. Cras tempus ante volutpat tellus iaculis molestie. Nam feugiat malesuada enim at imperdiet. Phasellus accumsan sodales lectus vitae cursus. In mattis velit non ex pellentesque, in fermentum eros tristique.\r\n\r\nSuspendisse potenti. Nullam id varius neque. Sed vel turpis eget ante pharetra semper. Proin pretium elit ac viverra lobortis. </p><p>Aliquam convallis sapien et nunc consequat, sed iaculis arcu porttitor. Mauris interdum sit amet elit id luctus. Donec euismod massa cursus felis pellentesque eleifend.\r\n\r\nSed a viverra justo. In hac habitasse platea dictumst. Pellentesque rhoncus ipsum vel scelerisque suscipit. Vivamus ut tortor luctus, interdum risus eget, luctus mi. Pellentesque sit amet nunc ac turpis tincidunt molestie at in lectus. Aenean hendrerit nunc ut nunc porttitor semper. Phasellus vestibulum, ligula quis cursus bibendum, sapien sapien efficitur odio, nec accumsan eros diam ut nibh. Sed sagittis mauris quis finibus cursus. Phasellus suscipit dolor ut mi tincidunt, eu porta massa ornare.</p>', 1, 'İPTAL VE İADE ŞARTLARI', 'Tekurunscripti.com İPTAL VE İADE ŞARTLARI sözleşmesi', 'İPTAL VE İADE ŞARTLARI'),
(6, 'MESAFELİ SATIŞ SÖZLEŞMESİ', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nec arcu ut tortor volutpat posuere non eu justo. Pellentesque elementum ultricies enim a elementum. Integer feugiat sagittis diam. Praesent eget pellentesque turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc nec urna venenatis, bibendum lacus at, bibendum elit. Nunc eu neque et purus luctus volutpat. Curabitur ultrices dignissim metus, id sodales nulla aliquet ut. Aliquam viverra faucibus odio in scelerisque.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ut rhoncus lectus, et varius nisl. Integer non eros eros. Quisque vel felis mollis, consectetur libero ut, congue turpis. Integer consectetur accumsan libero varius sollicitudin. Praesent eget posuere ex. Morbi vitae enim at elit scelerisque ornare nec ut tortor. Sed semper felis a ligula viverra, eleifend commodo libero laoreet. Vivamus quis sem risus. Proin dapibus tortor eu lectus scelerisque, sit amet semper odio dignissim. Nunc id est maximus, pellentesque odio ac, sodales diam. Phasellus efficitur dui id mauris cursus, a iaculis nisi accumsan. Cras tempus ante volutpat tellus iaculis molestie. Nam feugiat malesuada enim at imperdiet. Phasellus accumsan sodales lectus vitae cursus. In mattis velit non ex pellentesque, in fermentum eros tristique.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Suspendisse potenti. Nullam id varius neque. Sed vel turpis eget ante pharetra semper. Proin pretium elit ac viverra lobortis. Aliquam convallis sapien et nunc consequat, sed iaculis arcu porttitor. Mauris interdum sit amet elit id luctus. Donec euismod massa cursus felis pellentesque eleifend.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Sed a viverra justo. In hac habitasse platea dictumst. Pellentesque rhoncus ipsum vel scelerisque suscipit. Vivamus ut tortor luctus, interdum risus eget, luctus mi. Pellentesque sit amet nunc ac turpis tincidunt molestie at in lectus. Aenean hendrerit nunc ut nunc porttitor semper. Phasellus vestibulum, ligula quis cursus bibendum, sapien sapien efficitur odio, nec accumsan eros diam ut nibh. Sed sagittis mauris quis finibus cursus. Phasellus suscipit dolor ut mi tincidunt, eu porta massa ornare.</p>', 1, 'MESAFELİ SATIŞ SÖZLEŞMESİ ', 'mesafeli satış sözleşmesi ', 'mesafeli satış sözleşmesi ');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `shopier`
--

CREATE TABLE `shopier` (
  `shopier_id` int(11) NOT NULL,
  `shopier_apikey` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `shopier_apisecret` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `shopier`
--

INSERT INTO `shopier` (`shopier_id`, `shopier_apikey`, `shopier_apisecret`) VALUES
(1, '', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparis`
--

CREATE TABLE `siparis` (
  `siparis_id` int(11) NOT NULL,
  `siparis_tarih` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `siparis_ad` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `siparis_durum` int(11) DEFAULT '1',
  `siparis_odeme` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `siparis_not` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci,
  `siparis_fiyat` int(11) DEFAULT NULL,
  `siparis_fiyat_kdvsiz` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `iyzico_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `siparis`
--

INSERT INTO `siparis` (`siparis_id`, `siparis_tarih`, `siparis_ad`, `siparis_durum`, `siparis_odeme`, `siparis_not`, `siparis_fiyat`, `siparis_fiyat_kdvsiz`, `iyzico_token`) VALUES
(130, '2020-11-11 13:38:36', '19', 0, 'Kredi Kartı', NULL, 967, '819', NULL),
(131, '2020-11-11 13:42:13', '19', 1, 'Havale ile Öde', NULL, 1498, '1269', NULL),
(132, '2020-11-11 14:05:13', '19', 1, 'Havale ile Öde', NULL, 1132, '959', NULL),
(133, '2020-11-11 14:32:33', '19', 1, 'Havale ile Öde', NULL, 1350, '1144', NULL),
(134, '2020-12-04 10:04:29', '19', 1, 'Kredi Kartı', NULL, 601, '509', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `slayt`
--

CREATE TABLE `slayt` (
  `slayt_id` int(1) NOT NULL,
  `slayt_baslik` varchar(150) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `slayt_resim` varchar(355) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `slayt_sira` int(11) NOT NULL,
  `slayt_aciklama` varchar(500) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `slayt_butonad` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `slayt_butonlink` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `slayt_renk` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `slayt`
--

INSERT INTO `slayt` (`slayt_id`, `slayt_baslik`, `slayt_resim`, `slayt_sira`, `slayt_aciklama`, `slayt_butonad`, `slayt_butonlink`, `slayt_renk`) VALUES
(16, 'SEKTÖRE ÖZEL <br> WEB SİTELERİ', 'assets/img/slayt/24101.jpg', 2, 'Ekibimizde yer alan uzman kod ve tasarım ekibimiz tarafından <br> sektörünüz ne olursa olsun size en uygun tasarım için çalışıyor ', 'Hemen İletişime Geç', 'iletisim', '#000'),
(17, 'PROFESYONEL <br> WEB TASARIM', 'assets/img/slayt/21408.jpg', 1, 'Deneme açıklama alanı ile daha çok bilgi paylaşımı', 'İLETİŞİME GEÇ', 'iletisim', '#000');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `smenu`
--

CREATE TABLE `smenu` (
  `smenu_id` int(11) NOT NULL,
  `smenu_ad` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `smenu_durum` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `smenu`
--

INSERT INTO `smenu` (`smenu_id`, `smenu_ad`, `smenu_durum`) VALUES
(10, 'Kurumsal', '1'),
(15, 'HİZMETLERİMİZ', '1'),
(16, 'HİZMET BÖLGELERİ', '1'),
(19, 'İLETİŞİM', '1'),
(22, 'HESAP NUMARALARIMIZ', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sms`
--

CREATE TABLE `sms` (
  `sms_id` int(11) NOT NULL,
  `sms_kullanici` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `sms_sifre` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `sms_baslik` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `sms_durum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `sms`
--

INSERT INTO `sms` (`sms_id`, `sms_kullanici`, `sms_sifre`, `sms_baslik`, `sms_durum`) VALUES
(0, '05368436122', 'Labirent4332426!', 'SON YAZILIM', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sosyal`
--

CREATE TABLE `sosyal` (
  `sosyal_id` int(1) NOT NULL,
  `sosyal_link` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `sosyal_icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `sosyal`
--

INSERT INTO `sosyal` (`sosyal_id`, `sosyal_link`, `sosyal_icon`) VALUES
(1, 'https://www.facebook.com/', 'fa fa-facebook'),
(2, 'https://twitter.com/', 'fa fa-twitter'),
(3, 'https://www.instagram.com/', 'fa fa-instagram'),
(4, 'https://youtube.com', 'fa fa-youtube');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sss`
--

CREATE TABLE `sss` (
  `sss_id` int(11) NOT NULL,
  `sss_soru` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `sss_cevap` varchar(755) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `sss_sira` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `sss`
--

INSERT INTO `sss` (`sss_id`, `sss_soru`, `sss_cevap`, `sss_sira`) VALUES
(1, 'Satın alma işlemi nasıl yapılır?', 'Almak istediğiniz yazılımı hemen satın al butonu yardımı ile satın al formuna ulaşabilir yada kolay iletişim butonu ile bizimle iletişime geçerek satın alma işlemi gerçekleştirebilirsiniz.', 0),
(2, 'Ürünlerin iade hakkı var mıdır?', 'Yazılımlarımı açık kaynak olması sebebi ile herhangi bir iade söz konusu değildir. Bu sebeple ürünü satın almadan önce bir demo site kurulup tüm detayları incelemeniz ve  tüm isteklerinize cevap verdiğini anladığınızda satın almanız gerekir.', 4),
(3, 'Web site kurulduktan sonra içerik nasıl girilir?', 'Web site kurulumu tamamlandıktan sonra genelde tüm müşterilerimizin içeriklerini editörlerimiz tarafından girmekteyiz. Bu satın alma aşamasında anlaşmaya bağlı olarak değişkenlik gösterebilir. Eğer siz giriş yapmak isterseniz tarafınıza verilen admin bilgilerinizi kullanarak gelişmiş panel yardımı ile kolayca girebilirsiniz.', 6),
(4, 'Daha önce hiç web site kullanmadık eğitim veriyor musunuz?', 'Tüm web site içeriğinizi kolayca düzenleyebileceğiniz kullanımı basit bir yönetim paneline sahip olacaksınız bu türkçe panel yardımı kolayca içeriklerinizi teknik bilgiye ihtiyaç kalmadan kendiniz girebilirsiniz. Yinede sorun yaşadığınız da destek ekibimizi aramaktan hiç çekinmeyin.', 3),
(7, 'Şu anda web sitemiz var içerikleri aynı şekilde taşıyabilir miyiz?', 'Eski web sitenizde bulunan tüm içeriklerinizi dilerseniz alanında uzman editörlerimiz tarafından eksiksiz olarak girilir. Siteniz bu aşamalarda yayında olmayacaktır ve yarım içerikle müşteri ve ziyaretçi kaybı yaşamazsınız web siteniz tüm bilgiler girildikten sonra yayına alınacaktır.', 6),
(8, 'Satın aldığımı yazılımı birden fazla sitede kullanabilirmiyiz?', 'Satışını yaptığımız tüm scriptlerimiz full açık kaynak olması sebebi ile birden fazla siteye herhangi bir sınırlama olmadan kurulum gerçekleştirebilirsiniz.', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `surun`
--

CREATE TABLE `surun` (
  `surun_id` int(11) NOT NULL,
  `surun_urun` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `surun_adet` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `surun_siparis` int(11) NOT NULL,
  `surun_fiyat` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `surun`
--

INSERT INTO `surun` (`surun_id`, `surun_urun`, `surun_adet`, `surun_siparis`, `surun_fiyat`) VALUES
(12, '65', '2', 47, '219'),
(13, '90', '1', 48, '119'),
(14, 'TEK ÜRÜN SCRİPTİ  KOZMETİK V1', '1', 49, '219'),
(15, 'TEK ÜRÜN SCRİPTİ ELEKTRONİK V1', '3', 50, '119'),
(16, 'TEK ÜRÜN SCRİPTİ ELEKTRONİK V1', '1', 51, '119'),
(17, 'TEK ÜRÜN SCRİPTİ  KOZMETİK V1', '1', 51, '219'),
(18, 'TEK ÜRÜN SCRİPTİ ELEKTRONİK V1', '1', 52, '119'),
(19, 'TEK ÜRÜN SCRİPTİ  KOZMETİK V1', '5', 52, '219'),
(20, 'TEK ÜRÜN SCRİPTİ ELEKTRONİK V1', '1', 53, '119'),
(21, 'TEK ÜRÜN SCRİPTİ ELEKTRONİK V1', '1', 54, '119'),
(22, 'TEK ÜRÜN SCRİPTİ  KOZMETİK V1', '2', 54, '219'),
(23, 'TEK ÜRÜN SCRİPTİ  KOZMETİK V1', '1', 55, '219'),
(24, 'TEK ÜRÜN SCRİPTİ ELEKTRONİK V1', '1', 56, '119'),
(25, 'TEK ÜRÜN SCRİPTİ ELEKTRONİK V1', '1', 57, '119'),
(26, 'TEK ÜRÜN SCRİPTİ  KOZMETİK V1', '1', 59, '219'),
(27, 'TEK ÜRÜN SCRİPTİ ELEKTRONİK V1', '1', 60, '119'),
(28, 'Deneme Paket 3', '1', 61, '179'),
(29, 'TEK ÜRÜN SCRİPTİ  KOZMETİK V1', '1', 61, '219'),
(30, 'TEK ÜRÜN SCRİPTİ ELEKTRONİK V1', '3', 61, '119'),
(31, 'Gelişmiş Web Tasarım V1', '1', 62, '119'),
(32, 'Gelişmiş Web Tasarım V1', '1', 63, '219'),
(33, 'Gelişmiş Web Tasarım V1', '1', 64, '119'),
(34, 'Deneme Paket 4', '1', 65, '179'),
(35, 'Gelişmiş Web Tasarım V1', '1', 66, '119'),
(36, 'Deneme Paket 2', '1', 66, '134'),
(37, 'Gelişmiş Web Tasarım V1', '1', 67, '119'),
(38, 'Deneme Paket 3', '1', 68, '179'),
(39, 'Gelişmiş Web Tasarım V1', '1', 69, '219'),
(40, 'Deneme Paket 3', '1', 70, '179'),
(41, 'Gelişmiş Web Tasarım V1', '1', 71, '119'),
(42, 'Deneme Paket 2', '1', 72, '134'),
(43, 'Gelişmiş Web Tasarım V1', '1', 73, '219'),
(44, 'Deneme Paket 3', '1', 74, '179'),
(45, 'Gelişmiş Web Tasarım V1', '1', 75, '219'),
(46, 'Deneme Paket 2', '1', 76, '134'),
(47, 'Deneme Paket 2', '1', 77, '134'),
(48, 'Gelişmiş Web Tasarım V1', '1', 78, '219'),
(49, 'Gelişmiş Web Tasarım V1', '1', 79, '119'),
(50, 'Gelişmiş Web Tasarım V1', '1', 80, '119'),
(51, 'Deneme Paket 4', '1', 81, '179'),
(52, 'Deneme Paket 1', '1', 82, '124'),
(53, 'Gelişmiş Web Tasarım V1', '1', 82, '219'),
(54, 'Gelişmiş Web Tasarım V1', '1', 83, '219'),
(55, 'Gelişmiş Web Tasarım V1', '1', 84, '119'),
(56, 'Gelişmiş Web Tasarım V1', '1', 85, '219'),
(57, 'Restaurant | Cafe | Bar Scripti', '1', 86, '449'),
(58, 'Restaurant | Cafe | Bar Scripti', '1', 87, '449'),
(59, 'Restaurant | Cafe | Bar Scripti', '1', 88, '449'),
(60, 'Deneme Paket 1', '1', 89, '124'),
(61, 'Sağlık | Güzellik | Poliklinik Scripti', '1', 90, '449'),
(62, 'Deneme Paket 2', '1', 91, '134'),
(63, 'Restaurant | Cafe | Bar Scripti', '1', 92, '449'),
(64, 'Restaurant | Cafe | Bar Scripti', '2', 93, '449'),
(65, 'Restaurant | Cafe | Bar Scripti', '1', 94, '449'),
(66, 'Deneme Paket 3', '1', 95, '179'),
(67, 'Restaurant | Cafe | Bar Scripti', '1', 96, '449'),
(68, 'Restaurant | Cafe | Bar Scripti', '1', 97, '449'),
(69, 'Sağlık | Güzellik | Poliklinik Scripti', '1', 98, '449'),
(70, 'Tek Ürün Satış Scripti V2', '1', 99, '449'),
(71, 'Sağlık | Güzellik | Poliklinik Scripti', '1', 100, '449'),
(72, 'Restaurant | Cafe | Bar Scripti', '1', 101, '449'),
(73, 'Deneme Paket 7', '1', 101, '179'),
(74, '<b>Spor Salonu Body Fitness Scripti-449TL</b><br><b>Alan Adı: </b>erarhaliyikama.com', '1', 101, '449'),
(75, '<b>Sağlık | Güzellik | Poliklinik Scripti-449TL</b><br><b>Alan Adı: </b>gaziantepanahtar.com.tr<br> -Özgün İçerik 20 Adet  +400TL<br>', '1', 102, '449'),
(76, 'Deneme Paket 3', '1', 102, '179'),
(77, 'Deneme Paket 6', '1', 103, '179'),
(78, '<b>Sağlık | Güzellik | Poliklinik Scripti-449TL</b><br><b>Alan Adı: </b>erarhaliyikama.com', '1', 104, '449'),
(79, 'Deneme Paket 4', '1', 104, '179'),
(80, 'Deneme Paket 6', '1', 105, '179'),
(81, '<b>Sağlık | Güzellik | Poliklinik Scripti-449TL</b><br><b>Alan Adı: </b>http://asfadf.co<br><b>Hosting: </b>SSD 2 Paket +60TL<br> -Logo Tasarımı +75TL<br> -Özgün İçerik 5 Adet  +125TL<br> -Özgün İçerik 10 Adet  +225TL<br> -Özgün İçerik 20 Adet  +400TL<br>', '1', 106, '449'),
(82, '<b>Sağlık | Güzellik | Poliklinik Scripti-449TL</b><br><b>Alan Adı: </b>gaziantepanahtar.com.tr<br><b>Hosting: </b>SSD 4 Paket +80TL<br> -Özgün İçerik 5 Adet  +125TL<br> -Özgün İçerik 10 Adet  +225TL<br>', '1', 107, '449'),
(83, 'Deneme Paket 6', '1', 108, '179'),
(84, '<b>Spor Salonu Body Fitness Scripti-449TL</b><br><b>Alan Adı: </b>gaziantepanahtar.com.tr<br><b>Hosting: </b>SSD 3 Paket +70TL<br> -Logo Tasarımı +75TL<br> -Özgün İçerik 20 Adet  +400TL<br>', '0', 109, '449'),
(85, '<b>Spor Salonu Body Fitness Scripti-449TL</b><br><b>Alan Adı: </b>geveycim.com<br><b>Hosting: </b>SSD 4 Paket +80TL', 'Deneme Özel bilgi alanı', 110, '449'),
(86, '<b>Deneme ürün 2-799TL</b><br><b>Alan Adı: </b>erarhaliyikama.com', 'Deneme ürün 2 açıklama', 111, '799'),
(87, '<b>Platinum denemem e-499TL</b><br><b>Alan Adı: </b>geveycim.com<br> -Özgün İçerik 20 Adet  +400TL<br>', 'Link burada', 111, '499'),
(88, '<b>Sağlık | Güzellik | Poliklinik Scripti-449TL</b><br><b>Alan Adı: </b>http://asfadf', '', 112, '449'),
(89, '<b>Restaurant | Cafe | Bar Scripti-449TL</b><br><b>Alan Adı: </b>gaziantepanahtar.com.tr', '', 113, '449'),
(90, 'Deneme Paket 7', '', 114, '179'),
(91, '<b>Sağlık | Güzellik | Poliklinik Scripti-449TL</b><br><b>Alan Adı: </b>gaziantepanahtar.com.tr', '', 115, '449'),
(92, '<b>Sağlık | Güzellik | Poliklinik Scripti-449TL</b><br><b>Alan Adı: </b>gaziantepanahtar.com.tr', '', 116, '449'),
(93, '<b>Sağlık | Güzellik | Poliklinik Scripti-449TL</b><br><b>Alan Adı: </b>gaziantepanahtar.com.tr<br><b>Hosting: </b>SSD 2 Paket +60TL<br> -Logo Tasarımı +75TL<br>', '', 117, '449'),
(94, 'Deneme Paket 7', '', 118, '179'),
(95, '<b>deneme-1TL</b><br><b>Alan Adı: </b>https://salonmixkuafor.com/<br><b>Hosting: </b>SSD 1 Paket +50TL<br> -Logo Tasarımı +75TL<br>', 'Açıklama giriniz.', 119, '1'),
(96, '<b>Spor Salonu Body Fitness Scripti-449TL</b><br><b>Alan Adı: </b>https://salonmixkuafor.com/<br><b>Hosting: </b>SSD 1 Paket +50TL<br> - Seo Ayarları +100TL<br>', 'Deneme Özel bilgi alanı', 120, '449'),
(97, 'Deneme Paket 7', '', 121, '179'),
(98, 'Deneme Paket 8', '', 122, '179'),
(99, 'Deneme Paket 6', '', 123, '179'),
(100, '<b>test-1TL</b><br><b>Alan Adı: </b>https://salonmixkuafor.com/', 'Açıklama giriniz.', 124, '1'),
(101, '<b>test-1TL</b><br><b>Alan Adı: </b>https://sitepaket.com/<br> -Özgün İçerik 5 Adet  +125TL<br> -Özgün İçerik 10 Adet  +225TL<br>', 'Açıklama giriniz.', 125, '1'),
(102, '<b>test-1TL</b><br><b>Alan Adı: </b>https://salonmixkuafor.com/', 'Açıklama giriniz.', 126, '1'),
(103, '<b>test-1TL</b><br><b>Alan Adı: </b>https://salonmixkuafor.com/', 'Açıklama giriniz.', 127, '1'),
(104, '<b>test-1TL</b><br><b>Alan Adı: </b>https://salonmixkuafor.com/', 'Açıklama giriniz.', 128, '1'),
(105, '<b>Restaurant | Cafe | Bar Scripti-449TL</b><br><b>Alan Adı: </b>http://deneme.com/<br><b>Hosting: </b>SSD 2 Paket +60TL<br> -Logo Tasarımı <b>+75TL</b><br> - Seo Ayarları <b>+100TL</b><br> -Özgün İçerik 10 Adet  <b>+225TL</b><br> -Özgün İçerik 20 Adet  <b>+400TL</b><br>', '', 129, '1309'),
(106, '<b>Restaurant | Cafe | Bar Scripti-449TL</b><br><b>Alan Adı: </b>http://deneme.com/<br><b>Hosting: </b>SSD 3 Paket +70TL<br> -Logo Tasarımı <b>+75TL</b><br> - Seo Ayarları <b>+100TL</b><br> -Özgün İçerik 5 Adet  <b>+125TL</b><br>', '<p>Başarılı Ödeme Sonrası Onaylı Siparişlerde Görünecek Alan (İndirme Linki gibi bilgileri ürün detaydan ekleyebilirsiniz. Her ürün için ayrıdır.)</p>', 130, '819'),
(107, '<b>Sağlık | Güzellik | Poliklinik Scripti-449TL</b><br><b>Alan Adı: </b>http://deneme.com/<br><b>Hosting: </b>SSD 3 Paket +70TL<br> -Özgün İçerik 5 Adet  <b>+125TL</b><br> -Özgün İçerik 10 Adet  <b>+225TL</b><br> -Özgün İçerik 20 Adet  <b>+400TL</b><br>', '', 131, '1269'),
(108, '<b>Sağlık | Güzellik | Poliklinik Scripti-449TL</b><br><b>Alan Adı: </b>gaziantepanahtar.com.tr<br><b>Hosting: </b>SSD 2 Paket +60TL<br> - Seo Ayarları <b>+100TL</b><br> -Özgün İçerik 5 Adet  <b>+125TL</b><br> -Özgün İçerik 10 Adet  <b>+225TL</b><br>', '', 132, '959'),
(109, '<b>Sağlık | Güzellik | Poliklinik Scripti-449TL</b><br><b>Alan Adı: </b>gaziantepanahtar.com.tr<br><b>Hosting: </b>SSD 3 Paket +70TL<br> -Özgün İçerik 10 Adet  <b>+225TL</b><br> -Özgün İçerik 20 Adet  <b>+400TL</b><br>', '', 133, '1144'),
(110, '<b>Sağlık | Güzellik | Poliklinik Scripti-449TL</b><br><b>Alan Adı: </b>gaziantepanahtar.com.tr<br><b>Hosting: </b>SSD 2 Paket +60TL', '', 134, '509');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunler`
--

CREATE TABLE `urunler` (
  `urun_id` int(11) NOT NULL,
  `urun_baslik` varchar(455) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_aciklama` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci,
  `urun_efiyat` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_fiyat` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_kargo` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_vitrin` int(11) DEFAULT '0',
  `urun_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_descr` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_demo` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_auser` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_apass` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_kategori` int(11) DEFAULT NULL,
  `urun_paket` int(11) DEFAULT '0',
  `alanadi` int(11) DEFAULT '1',
  `hosting` int(11) DEFAULT '1',
  `eklenti` int(11) DEFAULT '1',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `urunler`
--

INSERT INTO `urunler` (`urun_id`, `urun_baslik`, `urun_aciklama`, `urun_efiyat`, `urun_fiyat`, `urun_kargo`, `urun_vitrin`, `urun_title`, `urun_descr`, `urun_keyword`, `urun_demo`, `urun_admin`, `urun_auser`, `urun_apass`, `urun_kategori`, `urun_paket`, `alanadi`, `hosting`, `eklenti`, `link`) VALUES
(65, 'Nakliyat V1 Scritpi', '<p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\"><span style=\"box-sizing: border-box; font-weight: 700;\">Mobil uyumlu son yazılım nakliyat scripti;</span></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><br style=\"box-sizing: border-box;\"></p><div rel=\"text-align: center;\" style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\"><span style=\"box-sizing: border-box; font-weight: 700;\">PHP-PDO-HTML5</span></div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\"><br style=\"box-sizing: border-box;\"></div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* %100 admin kontrolü</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* Full seo uyumlu</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* Beni ara özelliği ve SMS bildirim sistemi</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* Hızlı teklif formu ve SMS bildirim sistemi</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* SMTP destekli iletişim formu</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* Sınırsız hizmet ekleme özelliği</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* Sınırsız blog ekleme özelliği</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* sınırsız sayfa ekleme özellği</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* Tüm sayfalarda dnamik meta etiket desteği</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* Hızlı açılış</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* Hatasız kodlama</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* Basit admin panel kullanımı (Nakliyeciler için hazırlandı.)</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* 39 adet renk seçeneği (Adminden ayarlama)</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* Sınırsız slayt ekleme başlık ve açıklama ve buton tanımlama</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\"></div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">ve daha bir çok özellik...</div>', '749', '449', '', 0, 'Mobil uyumlu son yazılım nakliyat scripti;', 'Mobil uyumlu son yazılım nakliyat scripti;', 'Mobil uyumlu son yazılım nakliyat scripti;', 'https://www.sonyazilim.com/nakliyat/', 'https://www.sonyazilim.com/nakliyat/sonpanel', 'admin', 'admin', 4, 0, 1, 1, 1, NULL),
(90, 'Nakliyat Scripti V2', '<p style=\"box-sizing: border-box; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" line-height:=\"\" 28px;=\"\" color:=\"\" rgb(123,=\"\" 123,=\"\" 123);=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Dinamik slayt ekleme. (Başlık, açıklama ve buton ekleme) + (Boş bırakıldığında buton ve yazı alanları çıkmayacaktır.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- 40 Adet birbirinden güzel renk seçenekleri (Admin panel kontrollü)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tüm dinamik ve sabit sayfalar için admin panel kontrollü belirtme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Header menüleri admin panelinden ekleme silme ve düzenleme alanı.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tüm admin paneli SweetAlert ile uyarı pencereleri. (Dinamik aktif uyarı penceresi)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfada tüm alanlar aktif pasif edebilme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfa tüm başlık ve yazı alanları admin panelden düzenleme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tam içerik yönetimi.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Resim Galerisi eklentisi. (Admin panelinde eklenen tüm resimlere title başlık etiketi ekleme)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Video Galerisi eklentisi. (Admin panelden kod ile youtube video ekle)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Admin randevu kontrolü ve tam sayfa yazdırma özelliği</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sınırsız Hizmet Ekleme</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sınırsız Hizmet Bölgesi Ekleme</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- SMS bildirimi admin aktif pasif yapma. (İletişim ve randevu için admin bildirimi.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Randevu Talep Formu bildirimi (Admin randevu talep formu için hem mail hem sms bildirimi.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- MAİL bildirimi (İletişim admin bildirimi. – randevu sonucunda admin bildirimi)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer menüleri adminden düzenleme, ekleme ve silme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sosyal medya yönetimi.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer link ekleme düzenleme silme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Full admin kontörlü ve basit kullanım.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Whastapp Destek Modülü. (Aktif, pasif özelliği yön değiştirme.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tıkla Ara Modülü. (Aktif, pasif yapabilme.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Daha sayamadığımız birçok özellik için demoları inceleyebilirsiniz.</span><br></p>', '749', '449', '', 1, 'Yeni Nakliyat Scripti V2', 'Yeni Nakliyat Scripti V2', 'Yeni Nakliyat Scripti V2', 'https://www.sonyazilim.com/nakliyatv2/', 'https://www.sonyazilim.com/nakliyatv2/trex/', 'admin', 'admin', 4, 0, 1, 1, 1, NULL),
(91, 'Deneme Paket 1', 'Açıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz', '', '124', '', 1, '', '', '', '', '', '', '', 4, 1, 1, 1, 1, NULL),
(92, 'Deneme Paket 2', 'Açıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz', '', '134', '', 1, '', '', '', '', '', '', '', 4, 1, 1, 1, 1, NULL),
(93, 'Deneme Paket 3', 'Açıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz', '', '179', '', 1, '', '', '', '', '', '', '', 3, 1, 1, 1, 1, NULL),
(94, 'Deneme Paket 4', 'Açıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz', '', '179', '', 1, '', '', '', '', '', '', '', 3, 1, 1, 1, 1, NULL),
(95, 'Deneme Paket 5', 'Açıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz', '', '179', '', 1, '', '', '', '', '', '', '', 3, 1, 1, 1, 1, NULL),
(96, 'Deneme Paket 6', 'Açıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz', '', '179', '', 1, '', '', '', '', '', '', '', 1, 1, 1, 1, 1, NULL),
(97, 'Deneme Paket 7', 'Açıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz', '', '179', '', 1, '', '', '', '', '', '', '', 1, 1, 1, 1, 1, NULL),
(98, 'Deneme Paket 8', 'Açıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz', '', '179', '', 1, '', '', '', '', '', '', '', 1, 1, 1, 1, 1, NULL),
(99, 'Kurumsal V2 firma scripti', '<p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">Full SEO + Full Kontrol</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*Full Meta</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">Eklediğiniz tüm ürünlerin, blog konularının, hizmetlerin, projelerin, ve kurumsal sayfaların başlıkları title ve açıklama alanları otomatik olarak description meta tagları olarak tanımlanmaktadır.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*SMTP destekli İletişim modülü</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">İletişim formu ile iletilen mesajlar size anında mail olarak iletilir..</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*Blog modülü</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">Adminden sınırsız blog ekleyebilir silebilir ve düzenleyebilirsiniz.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*Sayfalar modülü</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">Adminden sınırsız sayfa ekleyebilir silebilir ve düzenleyebilirsiniz. Eklediğiniz tüm sayfalar otomatik olarak footer ve headerda yayınlanmaktadır.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*Sık Sorulan Sorular modülü</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">Adminden sınırsız soru ve cevap ekleyebilir silebilir ve düzenleyebilirsiniz.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*Hizmetlerimiz modülü</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">Adminden hizmetlerimiz alanını aktif pasif yapabilirsiniz. Pasif yaptığınızda üst menüden, ana sayfadan ve footerden otomatik olarak kalkar.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*Projeler modülü</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">Adminden projelerimiz alanını aktif pasif yapabilirsiniz. Pasif yaptığınızda üst menüden, ana sayfadan ve footerden otomatik olarak kalkar.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*Ürünler modülü</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">Adminden ürünlerimiz alanını aktif pasif yapabilirsiniz. Pasif yaptığınızda üst menüden, ana sayfadan ve footerden otomatik olarak kalkar.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*Yorumlar modülü</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">Adminden yorumlar alanını aktif pasif yapabilirsiniz. Pasif yaptığınızda üst menüden, ana sayfadan ve footerden otomatik olarak kalkar.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*Counter modülü</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">Adminden counter (rakam sayan alan) alanını aktif pasif yapabilirsiniz. Pasif yaptığınızda üst menüden, ana sayfadan ve footerden otomatik olarak kalkar.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*Tercih modülü</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">Adminden tercih alanını aktif pasif yapabilirsiniz. Pasif yaptığınızda üst menüden, ana sayfadan ve footerden otomatik olarak kalkar.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"box-sizing: border-box; font-weight: 700;\">Full admin panel kontrolünü görünce inanamayacaksınız!</span></p>', '749', '449', '', 0, 'Kurumsal V2 firma scripti', 'Kurumsal V2 firma scripti', 'Kurumsal V2 firma scripti', 'https://sonyazilim.com/kurumsalv2/', 'https://sonyazilim.com/kurumsalv2/sonpanel', 'admin', 'admin', 1, 0, 0, 0, 0, '<p><br></p>'),
(100, 'Kurumsal V3 Firma Scripti', '<p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Dinamik slayt ekleme. (Başlık, açıklama ve buton ekleme)</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">-Site ana meta kelimeleri belirleme. (Title, Description, Keywords)</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Tüm dinamik ve sabit sayfalar için admin panel kontrollü belirtme. (Title, Description, Keywords)</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Header menüleri admin panelinden ekleme silme ve düzenleme alanı.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Tüm admin paneli SweetAlert ile uyarı pencereleri. (Dinamik aktif uyarı penceresi)</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Hizmetler, Projeler ve Ürünler \'de ana sayfa vitrin belirleme.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Ana sayfada tüm alanlar aktif pasif edebilme.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Ana sayfa tüm başlık ve yazı alanları admin panelden düzenleme.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Tam içerik yönetimi.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Resim Galerisi eklentisi. (Admin panelinde eklenen tüm resimlere title başlık etiketi ekleme)</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Video Galerisi eklentisi. (Admin panelden kod ile youtube video ekle)</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Ürünler modülü. (Title, Description, Keywords)</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Satın alma formu.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Ödeme seçenekleri yönetimi.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- SMS bildirimi admin aktif pasif yapma. (İletişim admin bildirimi. – Sipariş sonucunda admin ve müşteri anlık bildirim)</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Footer menüleri adminden düzenleme, ekleme ve silme.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Sosyal medya yönetimi.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Footer link ekleme düzenleme silme.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Full admin kontörlü ve basit kullanım.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Daha sayamadığımız birçok özellik için demoları inceleyebilirsiniz.</p>', '749', '449', '', 1, 'Kurumsal V3 Firma Scripti', 'Kurumsal V3 Firma Scripti', 'Kurumsal V3 Firma Scripti', 'https://www.sonyazilim.com/kurumsalv3/', 'https://www.sonyazilim.com/kurumsalv3/trex', 'admin', 'admin', 1, 0, 1, 1, 1, NULL),
(103, 'Kurumsal V4 Firma Scripti', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Dinamik slayt ekleme. (Başlık, açıklama ve buton ekleme) + (Boş bırakıldığında buton ve yazı alanları çıkmayacaktır.)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- 39 Adet birbirinden güzel renk seçenekleri (Admin panel kontrollü)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Tüm dinamik ve sabit sayfalar için admin panel kontrollü belirtme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Header menüleri admin panelinden ekleme silme ve düzenleme alanı.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Tüm admin paneli SweetAlert ile uyarı pencereleri. (Dinamik aktif uyarı penceresi)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Hizmetler, Projeler ve Ürünler \'de ana sayfa vitrin belirleme.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Ana sayfada tüm alanlar aktif pasif edebilme.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Ana sayfa tüm başlık ve yazı alanları admin panelden düzenleme.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Tam içerik yönetimi.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Resim Galerisi eklentisi. (Admin panelinde eklenen tüm resimlere title başlık etiketi ekleme)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Video Galerisi eklentisi. (Admin panelden kod ile youtube video ekle)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Ürünler modülü. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Satın alma formu. </span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Ödeme seçenekleri yönetimi.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- SMS bildirimi admin aktif pasif yapma. (İletişim admin bildirimi. – Sipariş sonucunda admin ve müşteri anlık bildirim)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Footer menüleri adminden düzenleme, ekleme ve silme.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Sosyal medya yönetimi.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Footer link ekleme düzenleme silme.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Full admin kontörlü ve basit kullanım.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Daha sayamadığımız birçok özellik için demoları inceleyebilirsiniz.</span><br></p>', '749', '449', '', 0, 'Kurumsal V4 Firma Scripti', 'Kurumsal V4 Firma Scripti', 'Kurumsal V4 Firma Scripti', 'https://www.sonyazilim.com/v4/', 'https://www.sonyazilim.com/v4/trex', 'admin', 'admin', 1, 0, 1, 1, 1, NULL),
(104, 'GELİŞMİŞ KURUMSAL SCRİPTİ V5', '<p style=\"box-sizing: border-box; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" line-height:=\"\" 28px;=\"\" color:=\"\" rgb(123,=\"\" 123,=\"\" 123);=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Dinamik slayt ekleme. (Başlık, açıklama ve buton ekleme) + (Boş bırakıldığında buton ve yazı alanları çıkmayacaktır.)<br style=\"box-sizing: border-box;\">- ÜRÜNLERDE TOPLU RESİM YÜKLEME ÖZELLİĞİ<br style=\"box-sizing: border-box;\">- Hizmet detay sayfasında o hizmete özel teklif al formu.<br style=\"box-sizing: border-box;\">- Ürünlerde fiyat göster gizle.<br style=\"box-sizing: border-box;\">- Ürünlerde satın al butonu göster gizle.<br style=\"box-sizing: border-box;\">- Ürünlerde hızlı incele özelliği.<br style=\"box-sizing: border-box;\">- Video ve resim galeri özelliği.<br style=\"box-sizing: border-box;\">- Sınırsı üst ve alt menü ekleme özelliği.<br style=\"box-sizing: border-box;\">- Slayt üzerinde yazan yazılara her birine ayrı renk belirleme özelliği<br style=\"box-sizing: border-box;\"></span><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer ve sidebarda admin kontrolü son tweetler özelliği</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Yeni tasarım gelişmiş iletişim sayfası.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- 39 Adet birbirinden güzel renk seçenekleri (Admin panel kontrollü)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tüm dinamik ve sabit sayfalar için admin panel kontrollü belirtme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Header menüleri admin panelinden ekleme silme ve düzenleme alanı.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tüm admin paneli SweetAlert ile uyarı pencereleri. (Dinamik aktif uyarı penceresi)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfada tüm alanlar aktif pasif edebilme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfa tüm başlık ve yazı alanları admin panelden düzenleme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tam içerik yönetimi.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sınırsız Ürün Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- SMS bildirimi admin aktif pasif yapma. (İletişim ve sipariş için admin bildirimi.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- MAİL bildirimi (İletişim admin bildirimi. – Sipariş sonucunda admin bildirimi)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer menüleri adminden düzenleme, ekleme ve silme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sosyal medya yönetimi.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer link ekleme düzenleme silme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Full admin kontörlü ve basit kullanım.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Whastapp Destek Modülü. (Aktif, pasif özelliği yön değiştirme.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tıkla ara kolay erişim butonu.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sık sorulan sorular modülü</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Daha sayamadığımız birçok özellik için demoları inceleyebilirsiniz.</span><br></p>', '749', '449', '', 1, 'GELİŞMİŞ KURUMSAL SCRİPTİ V5', 'GELİŞMİŞ KURUMSAL SCRİPTİ V5', 'GELİŞMİŞ KURUMSAL SCRİPTİ V5', 'https://www.sonyazilim.com/v5/', 'https://www.sonyazilim.com/v5/trex', 'admin', 'admin', 1, 0, 1, 1, 1, NULL),
(105, 'Mobil Uyumlu Çilingir Scripti', '<p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">-BAŞLICA ÖZELLİKLER-</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Dinamik slayt ekleme. (Başlık, açıklama ve buton ekleme) + (Boş bırakıldığında buton ve yazı alanları çıkmayacaktır.)<br style=\"box-sizing: border-box;\">- 39 Adet birbirinden güzel renk seçenekleri (Admin panel kontrollü)<br style=\"box-sizing: border-box;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)<br style=\"box-sizing: border-box;\">- Tüm dinamik ve sabit sayfalar için admin panel kontrollü belirtme. (Title, Description, Keywords)<br style=\"box-sizing: border-box;\">- Header menüleri admin panelinden ekleme silme ve düzenleme alanı.<br style=\"box-sizing: border-box;\">- Tüm admin paneli SweetAlert ile uyarı pencereleri. (Dinamik aktif uyarı penceresi)<br style=\"box-sizing: border-box;\">- Ana sayfada tüm alanlar aktif pasif edebilme.<br style=\"box-sizing: border-box;\">- Ana sayfa tüm başlık ve yazı alanları admin panelden düzenleme.<br style=\"box-sizing: border-box;\">- Tam içerik yönetimi.<br style=\"box-sizing: border-box;\">- Resim Galerisi eklentisi. (Admin panelinde eklenen tüm resimlere title başlık etiketi ekleme)<br style=\"box-sizing: border-box;\">- Video Galerisi eklentisi. (Admin panelden kod ile youtube video ekle)<br style=\"box-sizing: border-box;\">- Admin randevu kontrolü ve tam sayfa yazdırma özelliği<br style=\"box-sizing: border-box;\">- Sınırsız Hizmet Ekleme<br style=\"box-sizing: border-box;\">- Sınırsız Hizmet Bölgesi Ekleme<br style=\"box-sizing: border-box;\">- SMS bildirimi admin aktif pasif yapma. (İletişim ve randevu için admin bildirimi.)<br style=\"box-sizing: border-box;\">- Servis Talep Formu bildirimi (Admin randevu talep formu için hem mail hem sms bildirimi.)<br style=\"box-sizing: border-box;\">- MAİL bildirimi (İletişim admin bildirimi. – randevu sonucunda admin bildirimi)<br style=\"box-sizing: border-box;\">- Footer menüleri adminden düzenleme, ekleme ve silme.<br style=\"box-sizing: border-box;\">- Sosyal medya yönetimi.<br style=\"box-sizing: border-box;\">- Footer link ekleme düzenleme silme.<br style=\"box-sizing: border-box;\">- Full admin kontörlü ve basit kullanım.<br style=\"box-sizing: border-box;\">- Whastapp Destek Modülü. (Aktif, pasif özelliği yön değiştirme.)<br style=\"box-sizing: border-box;\">- Daha sayamadığımız birçok özellik için demoları inceleyebilirsiniz.<br style=\"box-sizing: border-box;\">- Tıkla Ara! butonu aktif/pasif özelliği</p>', '749', '449', '', 1, 'Mobil Uyumlu Çilingir Scripti', 'Mobil Uyumlu Çilingir Scripti', 'Mobil Uyumlu Çilingir Scripti', 'https://www.sonyazilim.com/cilingir/', 'https://www.sonyazilim.com/cilingir/trex', 'admin', 'admin', 3, 0, 1, 1, 1, NULL),
(106, 'Avukat ve Hukuk Bürosu Scripti', '<p style=\"box-sizing: border-box; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" line-height:=\"\" 28px;=\"\" color:=\"\" rgb(123,=\"\" 123,=\"\" 123);=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Gelişmiş dinamik her slayt yazı rengini panelden farklı yapma özelliği ile müşterilerinizin başını döndürün.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sınırsız üst ve alt menü ekleme özelliği.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Yeni tasarım gelişmiş iletişim sayfası.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- 39 Adet birbirinden güzel renk seçenekleri (Admin panel kontrollü)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tüm dinamik ve sabit sayfalar için admin panel kontrollü belirtme. (Title, Description, Keywords)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Header menüleri admin panelinden ekleme silme ve düzenleme alanı.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tüm admin paneli SweetAlert ile uyarı pencereleri. (Dinamik aktif uyarı penceresi)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfada tüm alanlar aktif pasif edebilme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfa tüm başlık ve yazı alanları admin panelden düzenleme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tam içerik yönetimi.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sınırsız Avukat Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sınırsız Hizmet Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sınırsız Belge ödül görselleri ekleme düzenleme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- 7 tane otomatik dil seçeneğini yönetim panelinden aktif pasif yapabilme komple açıp kapatabilme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Anasayfa html alan düzenleme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- SMS bildirimi admin aktif pasif yapma. (İletişim ve Randevu için admin bildirimi.)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- MAİL bildirimi (İletişim admin bildirimi. – Randevu sonucunda admin bildirimi)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer menüleri adminden düzenleme, ekleme ve silme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sosyal medya yönetimi.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer link ekleme düzenleme silme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Full admin kontörlü ve basit kullanım.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Yeni Tasarım KOLAY ERİŞİM full iletişim kanalları yönetimi hepsi adminden ayrıca belirtilip aktif ve pasif edilerek kullanılabilir.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Yeni Tasarım üst menüde online randevu modülü (Aktif, pasif özelliği.)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Daha sayamadığımız birçok özellik için demoları inceleyebilirsiniz.</span><br></p>', '749', '449', '', 1, 'Avukat ve Hukuk Bürosu Scripti', 'Avukat ve Hukuk Bürosu Scripti', 'Avukat ve Hukuk Bürosu Scripti', 'https://www.sonyazilim.com/avukat/', 'https://www.sonyazilim.com/avukat/trex', 'admin', 'admin', 5, 0, 1, 1, 1, NULL);
INSERT INTO `urunler` (`urun_id`, `urun_baslik`, `urun_aciklama`, `urun_efiyat`, `urun_fiyat`, `urun_kargo`, `urun_vitrin`, `urun_title`, `urun_descr`, `urun_keyword`, `urun_demo`, `urun_admin`, `urun_auser`, `urun_apass`, `urun_kategori`, `urun_paket`, `alanadi`, `hosting`, `eklenti`, `link`) VALUES
(107, 'İNŞAAT FİRMA SCRİPTİ', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Gelişmiş dinamik YENİ STİL her slayt yazı rengini panelden farklı yapma özelliği ile müşterilerinizin başını döndürün.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Sınırsız üst ve alt menü ekleme özelliği.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Yeni tasarım gelişmiş iletişim sayfası.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- 39 Adet birbirinden güzel renk seçenekleri (Admin panel kontrollü)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Tüm dinamik ve sabit sayfalar için admin panel kontrollü belirtme. (Title, Description, Keywords)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Header menüleri admin panelinden ekleme silme ve düzenleme alanı.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Tüm admin paneli SweetAlert ile uyarı pencereleri. (Dinamik aktif uyarı penceresi)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Ana sayfada tüm alanlar aktif pasif edebilme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Ana sayfa tüm başlık ve yazı alanları admin panelden düzenleme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Tam içerik yönetimi.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Sınırsız Avukat Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Sınırsız Hizmet Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Sınırsız RESİM GALERİSİ Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Sınırsız VİDEO GALERİSİ Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Sınırsız Belge ödül görselleri ekleme düzenleme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- 7 tane otomatik dil seçeneğini yönetim panelinden aktif pasif yapabilme komple açıp kapatabilme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Anasayfa html alan düzenleme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- SMS bildirimi admin aktif pasif yapma. (İletişim ve Randevu için admin bildirimi.)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- MAİL bildirimi (İletişim admin bildirimi. – Randevu sonucunda admin bildirimi)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Footer menüleri adminden düzenleme, ekleme ve silme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Sosyal medya yönetimi.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Footer link ekleme düzenleme silme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Müşteri Yorumu admin paneli kontrol.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Full admin kontörlü ve basit kullanım.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Yeni Tasarım KOLAY ERİŞİM full iletişim kanalları yönetimi hepsi adminden ayrıca belirtilip aktif ve pasif edilerek kullanılabilir.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Yeni Tasarım üst menüde online randevu modülü (Aktif, pasif özelliği.)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Daha sayamadığımız birçok özellik için demoları inceleyebilirsiniz.</span><br></p>', '749', '449', '', 1, 'İNŞAAT FİRMA SCRİPTİ', 'İNŞAAT FİRMA SCRİPTİ', 'İNŞAAT FİRMA SCRİPTİ', 'https://www.sonyazilim.com/insaat/', 'https://www.sonyazilim.com/insaat/trex', 'admin', 'admin', 6, 0, 1, 1, 1, NULL),
(108, 'İlaçlama Şirketi Scripti', '<p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"box-sizing: border-box; font-weight: 700;\">-BAŞLICA ÖZELLİKLER-</span><br style=\"box-sizing: border-box;\"></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Dinamik slayt ekleme. (Başlık, açıklama ve buton ekleme) + (Boş bırakıldığında buton ve yazı alanları çıkmayacaktır.)<br style=\"box-sizing: border-box;\">- 39 Adet birbirinden güzel renk seçenekleri (Admin panel kontrollü)<br style=\"box-sizing: border-box;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)<br style=\"box-sizing: border-box;\">- Tüm dinamik ve sabit sayfalar için admin panel kontrollü belirtme. (Title, Description, Keywords)<br style=\"box-sizing: border-box;\">- Header menüleri admin panelinden ekleme silme ve düzenleme alanı.<br style=\"box-sizing: border-box;\">- Tüm admin paneli SweetAlert ile uyarı pencereleri. (Dinamik aktif uyarı penceresi)<br style=\"box-sizing: border-box;\">- Ana sayfada tüm alanlar aktif pasif edebilme.<br style=\"box-sizing: border-box;\">- Ana sayfa tüm başlık ve yazı alanları admin panelden düzenleme.<br style=\"box-sizing: border-box;\">- Tam içerik yönetimi.<br style=\"box-sizing: border-box;\">- Resim Galerisi eklentisi. (Admin panelinde eklenen tüm resimlere title başlık etiketi ekleme)<br style=\"box-sizing: border-box;\">- Video Galerisi eklentisi. (Admin panelden kod ile youtube video ekle)<br style=\"box-sizing: border-box;\">- Sınırsız Hizmet Ekleme<br style=\"box-sizing: border-box;\">- Sınırsız Hizmet Bölgesi Ekleme<br style=\"box-sizing: border-box;\">- SMS bildirimi admin aktif pasif yapma. (İletişim admin bildirimi.)<br style=\"box-sizing: border-box;\">- MAİL bildirimi (İletişim admin bildirimi. – Sipariş sonucunda admin bildirimi)<br style=\"box-sizing: border-box;\">- Footer menüleri adminden düzenleme, ekleme ve silme.<br style=\"box-sizing: border-box;\">- Sosyal medya yönetimi.<br style=\"box-sizing: border-box;\">- Footer link ekleme düzenleme silme.<br style=\"box-sizing: border-box;\">- Full admin kontörlü ve basit kullanım.<br style=\"box-sizing: border-box;\">-Whastapp Destek Modülü. (Aktif, pasif özelliği yön değiştirme.)<br style=\"box-sizing: border-box;\">- Daha sayamadığımız birçok özellik için demoları inceleyebilirsiniz.</p>', '749', '449', '', 1, 'İlaçlama Şirketi Scripti', 'İlaçlama Şirketi Scripti', 'İlaçlama Şirketi Scripti', 'https://www.sonyazilim.com/ilaclama/', 'https://www.sonyazilim.com/ilaclama/trex/', 'admin', 'admin', 7, 0, 1, 1, 1, NULL),
(109, 'Temizlik Şirketi Scripti', '<span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Dinamik slayt ekleme. (Başlık, açıklama ve buton ekleme) + (Boş bırakıldığında buton ve yazı alanları çıkmayacaktır.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- 39 Adet birbirinden güzel renk seçenekleri (Admin panel kontrollü)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tüm dinamik ve sabit sayfalar için admin panel kontrollü belirtme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Header menüleri admin panelinden ekleme silme ve düzenleme alanı.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tüm admin paneli SweetAlert ile uyarı pencereleri. (Dinamik aktif uyarı penceresi)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfada tüm alanlar aktif pasif edebilme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfa tüm başlık ve yazı alanları admin panelden düzenleme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tam içerik yönetimi.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Resim Galerisi eklentisi. (Admin panelinde eklenen tüm resimlere title başlık etiketi ekleme)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Video Galerisi eklentisi. (Admin panelden kod ile youtube video ekle)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Admin randevu kontrolü ve tam sayfa yazdırma özelliği</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sınırsız Hizmet Ekleme</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sınırsız Hizmet Bölgesi Ekleme</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- SMS bildirimi admin aktif pasif yapma. (İletişim ve randevu için admin bildirimi.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Servis Talep Formu bildirimi (Admin randevu talep formu için hem mail hem sms bildirimi.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- MAİL bildirimi (İletişim admin bildirimi. – randevu sonucunda admin bildirimi)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer menüleri adminden düzenleme, ekleme ve silme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sosyal medya yönetimi.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer link ekleme düzenleme silme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Full admin kontörlü ve basit kullanım.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Whastapp Destek Modülü. (Aktif, pasif özelliği yön değiştirme.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Daha sayamadığımız birçok özellik için demoları inceleyebilirsiniz.</span>', '749', '449', '', 1, 'Temizlik Şirketi Scripti', 'Temizlik Şirketi Scripti', 'Temizlik Şirketi Scripti', 'https://www.sonyazilim.com/temizlik/', 'https://www.sonyazilim.com/temizlik/trex/', 'admin', 'admin', 8, 0, 1, 1, 1, NULL),
(110, 'Tek Ürün Satış Scripti V2', '<span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Dinamik slayt . (Slayt görseli ekleme yazı içeriği düzenleme arkaplan rengi ve yazı rengini düzenleyebilme)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- ÜRÜNLERDE TOPLU RESİM YÜKLEME ÖZELLİĞİ</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- KOLAY İADE MODÜLÜ</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- 39 Adet birbirinden güzel renk seçenekleri (Admin panel kontrollü)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tüm dinamik ve sabit sayfalar için admin panel kontrollü belirtme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Header menüleri admin panelinden ekleme silme ve düzenleme alanı.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tüm admin paneli SweetAlert ile uyarı pencereleri. (Dinamik aktif uyarı penceresi)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfada tüm alanlar aktif pasif edebilme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfada tüm alanların arkaplan renklerini panelden düzenleme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfa tüm başlık ve yazıların renklerini panelden düzenleme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfa tüm başlık ve yazı alanları admin panelden düzenleme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sınırsız ürün ekleme ve ürünler sayfası.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Gelişmiş her sayfada SATIN AL , KOLAY İADE ve SİPARİŞ TAKİP butonları.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Kolay iade modülü ile müşterilerinize güven sağlayacaksınız.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Dinamik iade nedenlerini adminden istediğiniz nedeni ekleyebilir silebilir ve düzenleyebilirsiniz.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- SEPET MODÜLÜ ile müşterileriniz artık siparişte tek ürün değil istediği tüm ürünleri ve istediği adette satın alabilirler.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">ve daha bir çok özellik için demoyu inceleyiniz.</span>', '749', '449', '', 1, 'Tek Ürün Satış Scripti V2', 'Tek Ürün Satış Scripti V2', 'Tek Ürün Satış Scripti V2', 'https://tekurunscripti.com/demo/tekurunv2/', 'https://tekurunscripti.com/demo/tekurunv2/trex', 'admin', 'admin', 9, 0, 1, 1, 1, NULL),
(111, 'Spor Salonu Body Fitness Scripti', '<span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Gelişmiş dinamik YENİ STİL her slayt yazı rengini panelden farklı yapma özelliği ile müşterilerinizin başını döndürün.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sınırsız üst ve alt menü ekleme özelliği.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Yeni tasarım gelişmiş iletişim sayfası.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- 39 Adet birbirinden güzel renk seçenekleri (Admin panel kontrollü)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tüm dinamik ve sabit sayfalar için admin panel kontrollü belirtme. (Title, Description, Keywords)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Header menüleri admin panelinden ekleme silme ve düzenleme alanı.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tüm admin paneli SweetAlert ile uyarı pencereleri. (Dinamik aktif uyarı penceresi)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfada tüm alanlar aktif pasif edebilme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfa tüm başlık ve yazı alanları admin panelden düzenleme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tam içerik yönetimi.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sınırsız Antrenör Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sınırsız Hizmet Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sınırsız RESİM GALERİSİ Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sınırsız VİDEO GALERİSİ Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sınırsız Salon tanısım resmi ekleme düzenleme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Anasayfa html alan düzenleme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- SMS bildirimi admin aktif pasif yapma. (İletişim ve Randevu için admin bildirimi.)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- MAİL bildirimi (İletişim admin bildirimi. – Randevu sonucunda admin bildirimi)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer menüleri adminden düzenleme, ekleme ve silme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sosyal medya yönetimi.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer link ekleme düzenleme silme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Full admin kontörlü ve basit kullanım.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Yeni Tasarım KOLAY ERİŞİM full iletişim kanalları yönetimi hepsi adminden ayrıca belirtilip aktif ve pasif edilerek kullanılabilir.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Daha sayamadığımız birçok özellik için demoları inceleyebilirsiniz.</span>', '749', '449', '', 1, 'Spor Salonu Body Fitness Scripti', 'Spor Salonu Body Fitness Scripti', 'Spor Salonu Body Fitness Scripti', 'https://sonyazilim.com/spor/', 'https://sonyazilim.com/spor/trex', 'admin', 'admin', 10, 0, 1, 1, 1, 'Deneme Özel bilgi alanı'),
(112, 'Sağlık | Güzellik | Poliklinik Scripti', '<span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Dinamik slayt ekleme. (Başlık, açıklama ve buton ekleme) + (Boş bırakıldığında buton ve yazı alanları çıkmayacaktır.) + (Eklenen yazılara ayrı ayrı renk girme)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- BELGELERİMİZDE/RESİM GALERİSİNDE TOPLU RESİM YÜKLEME ÖZELLİĞİ</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Video ve resim galeri özelliği.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sınırsız üst ve alt menü ekleme özelliği.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Yeni tasarım gelişmiş iletişim sayfası.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- 39 Adet birbirinden güzel renk seçenekleri (Admin panel kontrollü)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tüm dinamik ve sabit sayfalar için admin panel kontrollü belirtme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Header menüleri admin panelinden ekleme silme ve düzenleme alanı.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tüm admin paneli SweetAlert ile uyarı pencereleri. (Dinamik aktif uyarı penceresi)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfada tüm alanlar aktif pasif edebilme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfa tüm başlık ve yazı alanları admin panelden düzenleme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tam içerik yönetimi.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Belgelerimiz Modülü.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sınırsız Hizmet Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sınırsız Doktor Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- SMS bildirimi admin aktif pasif yapma. (İletişim ve Randevu için admin bildirimi.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- MAİL bildirimi (İletişim admin bildirimi. – Randevu sonucunda admin bildirimi)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer menüleri adminden düzenleme, ekleme ve silme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sosyal medya yönetimi.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer link ekleme düzenleme silme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Full admin kontörlü ve basit kullanım.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Yeni Tasarım Tıkla Ara, Randevu Al, Whatsapp Destek Modülü (Aktif, pasif özelliği.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Yeni Tasarım üst menüde online randevu modülü (Aktif, pasif özelliği.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Daha sayamadığımız birçok özellik için demoları inceleyebilirsiniz.</span>', '749', '449', '', 1, 'Sağlık | Güzellik | Poliklinik Scripti', 'Sağlık | Güzellik | Poliklinik Scripti', 'Sağlık | Güzellik | Poliklinik Scripti', 'https://sonyazilim.com/hastane/', 'https://sonyazilim.com/hastane/trex', 'admin', 'admin', 11, 0, 1, 1, 1, NULL),
(113, 'Restaurant | Cafe | Bar Scripti', '<span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Dinamik slayt ekleme. (Başlık, açıklama ve buton ekleme) + (Boş bırakıldığında buton ve yazı alanları çıkmayacaktır.) + (Eklenen yazılara ayrı ayrı renk girme)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- BELGELERİMİZDE/RESİM GALERİSİNDE TOPLU RESİM YÜKLEME ÖZELLİĞİ</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Ürünlerde fiyat göster gizle.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Video ve resim galeri özelliği.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Sınırsı üst ve alt menü ekleme özelliği.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Footer ve sidebarda admin kontrolü son tweetler özelliği</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Yeni tasarım gelişmiş iletişim sayfası.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- 39 Adet birbirinden güzel renk seçenekleri (Admin panel kontrollü)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Tüm dinamik ve sabit sayfalar için admin panel kontrollü belirtme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Header menüleri admin panelinden ekleme silme ve düzenleme alanı.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Tüm admin paneli SweetAlert ile uyarı pencereleri. (Dinamik aktif uyarı penceresi)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Ana sayfada tüm alanlar aktif pasif edebilme.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Ana sayfa tüm başlık ve yazı alanları admin panelden düzenleme.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Tam içerik yönetimi.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Belgelerimiz Modülü. </span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Sınırsız Menü/Ürün Ekleme </span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- SMS bildirimi admin aktif pasif yapma. (İletişim ve rezervasyon için admin bildirimi.)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- MAİL bildirimi (İletişim admin bildirimi. – Rezervasyon sonucunda admin bildirimi)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Footer menüleri adminden düzenleme, ekleme ve silme.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Sosyal medya yönetimi.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Footer link ekleme düzenleme silme.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Full admin kontörlü ve basit kullanım.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Whastapp Destek Modülü. (Aktif, pasif özelliği.)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Tıkla ara kolay erişim butonu. (Aktif, pasif özelliği.)- Tıkla rezervasyon yap erişim butonu. </span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Daha sayamadığımız birçok özellik için demoları inceleyebilirsiniz.</span>', '749', '449', '', 1, 'Restaurant | Cafe | Bar Scripti', 'Restaurant | Cafe | Bar Scripti', 'Restaurant | Cafe | Bar Scripti', 'https://sonyazilim.com/restaurant/', 'https://sonyazilim.com/restaurant/trex/', 'admin', 'admin', 12, 0, 1, 1, 1, '<p>Başarılı Ödeme Sonrası Onaylı Siparişlerde Görünecek Alan (İndirme Linki gibi bilgileri ürün detaydan ekleyebilirsiniz. Her ürün için ayrıdır.)</p>'),
(115, 'Deneme Paket 9', 'Açıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz\r\nAçıklama giriniz', '', '499', '', 1, '', '', '', '', '', '', '', 4, 1, 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uye`
--

CREATE TABLE `uye` (
  `uye_id` int(11) NOT NULL,
  `uye_tarih` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `uye_ad` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_soyad` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_adres` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_tc` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_sifre` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_kod` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_resim` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT '0',
  `uye_onaymail` int(11) DEFAULT '0',
  `uye_onaytel` int(11) DEFAULT '0',
  `uye_kodmail` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_kodtel` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_smssure` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_mailsure` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `uye`
--

INSERT INTO `uye` (`uye_id`, `uye_tarih`, `uye_ad`, `uye_soyad`, `uye_tel`, `uye_mail`, `uye_adres`, `uye_tc`, `uye_sifre`, `uye_kod`, `uye_resim`, `uye_onaymail`, `uye_onaytel`, `uye_kodmail`, `uye_kodtel`, `uye_smssure`, `uye_mailsure`) VALUES
(19, '2020-10-24 05:49:40', 'Ozan', 'Öz', '08508407870', 'bilgi@sonyazilim.net', '', '', '21232f297a57a5a743894a0e4a801fc3', '730e96707e9068fdbd451fb716835daa', 'admin/assets/img/genel/23847.jpg', 1, 1, '27820', '20033', '', '2020-11-09 21:53:07');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `videogaleri`
--

CREATE TABLE `videogaleri` (
  `video_id` int(11) NOT NULL,
  `video_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `video_resim` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `videogaleri`
--

INSERT INTO `videogaleri` (`video_id`, `video_link`, `video_resim`) VALUES
(1, 'Gg9X8oNumCg', 'assets/img/galeri/2059728313.jpg'),
(2, 'Gg9X8oNumCg', 'assets/img/galeri/2059728313.jpg'),
(3, 'Gg9X8oNumCg', 'assets/img/galeri/2059728313.jpg'),
(4, 'Gg9X8oNumCg', 'assets/img/galeri/2059728313.jpg'),
(10, 'Gg9X8oNumCg', 'assets/img/galeri/2059728313.jpg'),
(11, 'Gg9X8oNumCg', 'assets/img/galeri/2059728313.jpg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `whatsapp`
--

CREATE TABLE `whatsapp` (
  `whats_id` int(11) NOT NULL,
  `whats_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `whats_durum` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `whats_cdestek` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `whats_cdestekdurum` int(11) NOT NULL,
  `whats_tiklaara` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `whats_tiklaaradurum` int(11) NOT NULL,
  `whats_skype` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `whats_skypedurum` int(11) NOT NULL,
  `whats_mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `whats_maildurum` int(11) NOT NULL,
  `whats_sssdurum` int(11) NOT NULL,
  `whats_iletisimdurum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `whatsapp`
--

INSERT INTO `whatsapp` (`whats_id`, `whats_tel`, `whats_durum`, `whats_cdestek`, `whats_cdestekdurum`, `whats_tiklaara`, `whats_tiklaaradurum`, `whats_skype`, `whats_skypedurum`, `whats_mail`, `whats_maildurum`, `whats_sssdurum`, `whats_iletisimdurum`) VALUES
(0, '1234567889', '1', '0', 0, '1234567889', 1, '0', 0, '0', 0, 0, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `widget`
--

CREATE TABLE `widget` (
  `widget_id` int(11) NOT NULL,
  `widget_hizmet` int(11) DEFAULT NULL,
  `widget_proje` int(11) DEFAULT NULL,
  `widget_yorum` int(11) DEFAULT NULL,
  `widget_galeri` int(11) DEFAULT NULL,
  `widget_urun` int(11) DEFAULT NULL,
  `widget_counter` int(11) DEFAULT NULL,
  `widget_referans` int(11) DEFAULT NULL,
  `widget_blog` int(11) DEFAULT NULL,
  `widget_bwelcome` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_breferans` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_bwelcome1` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_welcome` int(11) DEFAULT NULL,
  `widget_welcome1` int(11) DEFAULT NULL,
  `widget_bhizmet` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_bproje` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_byorum` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_bblog` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_burun` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_html` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci,
  `widget_bbilgi` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_bilgi` int(11) DEFAULT NULL,
  `widget_ara` int(11) DEFAULT NULL,
  `widget_bara` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_ufiyat` int(11) DEFAULT NULL,
  `widget_usatinal` int(11) DEFAULT NULL,
  `widget_bdiger` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_diger` int(11) DEFAULT NULL,
  `widget_bgaleri` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_twitter` int(255) DEFAULT NULL,
  `widget_btwitter` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_pyazi` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci,
  `widget_pbuton` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_plink` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_onaymail` int(11) DEFAULT NULL,
  `widget_onaytel` int(11) DEFAULT NULL,
  `widget_satissozlesme` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci,
  `widget_uyesozlesme` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci,
  `widget_html2` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `widget`
--

INSERT INTO `widget` (`widget_id`, `widget_hizmet`, `widget_proje`, `widget_yorum`, `widget_galeri`, `widget_urun`, `widget_counter`, `widget_referans`, `widget_blog`, `widget_bwelcome`, `widget_breferans`, `widget_bwelcome1`, `widget_welcome`, `widget_welcome1`, `widget_bhizmet`, `widget_bproje`, `widget_byorum`, `widget_bblog`, `widget_burun`, `widget_html`, `widget_bbilgi`, `widget_bilgi`, `widget_ara`, `widget_bara`, `widget_ufiyat`, `widget_usatinal`, `widget_bdiger`, `widget_diger`, `widget_bgaleri`, `widget_twitter`, `widget_btwitter`, `widget_pyazi`, `widget_pbuton`, `widget_plink`, `widget_onaymail`, `widget_onaytel`, `widget_satissozlesme`, `widget_uyesozlesme`, `widget_html2`) VALUES
(1, 1, NULL, 1, 1, 1, 1, 1, 1, '© 2020 <a href=\"#\">AJANS V6PLUS</a>  Tüm hakkı saklıdır.', 'REFERANSLARIMIZ', 'PAKETLERİMİZ', 1, 1, 'ÖNE ÇIKAN SCRİPTLER', 'Müşterimizden Gelen Yorumlar', 'MÜŞTERİ YORUMLARI', 'BLOG / DUYURU', 'Counter', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h2><b style=\"color: inherit; font-family: inherit; font-size: 2rem; text-align: justify;\">Görsel Tasarım</b><br></h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Fusce felis enim, ultricies sed congue vitae, tempor eget nulla. Nunc eleifend imperdiet ex in dapibus. Donec quis ornare velit, a tincidunt nibh. Proin in efficitur erat, ac pharetra ex. Aliquam erat volutpat. Fusce quis est mauris. Quisque tempor tincidunt dui vel facilisis. </p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Suspendisse potenti. Ut tincidunt id sem ac ultrices. Nam quis varius enim. In eget auctor elit. Suspendisse bibendum pulvinar erat vel dignissim. Pellentesque egestas vestibulum justo, ac fringilla felis semper at. Maecenas vitae ex in neque fermentum ullamcorper. Praesent eget laoreet leo, at luctus mauris.</p>', NULL, 1, NULL, ' Welcome to the largest broadband and Internet services provider where you can choose the best plan ever. We guarantee customer support service with high-speed satellite connection.', 0, 1, 'Hakkımızda', 1, 'Html Alan', 0, 'Html Alan', '<p style=\"box-sizing: border-box; margin-right: 0px; margin-bottom: 1.85714em; margin-left: 0px; font-family: \" open=\"\" sans\";=\"\" line-height:=\"\" 28px;=\"\" color:=\"\" rgb(123,=\"\" 123,=\"\" 123);\"=\"\">Sistemlerimizin en son yazılım teknolojileri olan PHP MYSQL PDO HTML5 BOOTSTRAP yapısı kullanılarak arama motorlarının istediği özellikleri standart olarak sunan kendi alt yapımız ile kodladık.</p>', 'TÜM PROJELER', 'projeler', 1, 1, '<h3 style=\"font-family: Rubik, sans-serif; color: rgb(69, 90, 100);\">Satış Sözleşmesi</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis vitae erat vel ornare. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed in turpis nec eros tincidunt sollicitudin sit amet a ipsum. Phasellus lacinia id turpis quis efficitur. Integer finibus, diam in pharetra sagittis, dolor tortor tincidunt dui, a vestibulum nisl quam vestibulum est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam erat volutpat. Nunc convallis lacus eget dignissim consectetur. Curabitur sit amet rutrum velit. Pellentesque a magna enim. Vivamus bibendum pulvinar odio non imperdiet. In nulla ipsum, varius eget ultricies in, vulputate nec enim. Nullam hendrerit nisl ut convallis ultrices. In vitae massa quis nunc placerat faucibus in a nibh. Suspendisse suscipit, nulla id vulputate convallis, diam lorem volutpat lacus, vel condimentum tortor ligula ac ante. Integer auctor sagittis ex in finibus.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Curabitur in dignissim sapien, non ultrices lorem. Suspendisse auctor iaculis turpis, gravida tempor ex suscipit id. Nunc fermentum id est auctor accumsan. Phasellus in est non augue consectetur sagittis et in orci. Donec tempus bibendum ex eget sagittis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec quis diam tincidunt, pulvinar leo in, pretium erat. Sed nec ex rutrum, pretium mauris et, consequat massa. Cras commodo sapien ut nibh semper aliquam. Sed tincidunt tincidunt consequat. Phasellus semper sem egestas bibendum vehicula. Nullam tempus, ligula euismod volutpat efficitur, sem velit laoreet sapien, in venenatis quam dolor eleifend lacus. Etiam finibus quam elementum est bibendum, vitae bibendum ante pretium. Ut at sapien dignissim, pulvinar metus sit amet, auctor lectus. Morbi ullamcorper lorem a ligula fringilla, a finibus tellus volutpat.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Etiam semper, odio in dictum tempus, dui sem fringilla ante, a iaculis augue lorem in risus. Nulla vitae tincidunt eros, mollis dapibus magna. Nulla eu velit a elit malesuada ullamcorper. Maecenas bibendum tincidunt justo non tempor. Phasellus blandit, erat in semper egestas, mi ex varius felis, eu egestas urna ex quis mi. Sed mollis urna quis est convallis placerat. Vestibulum lacus arcu, condimentum ut imperdiet nec, tristique sed lorem. Proin eu consequat magna. Nam sed placerat libero, eget tincidunt nibh. Nam sed leo dapibus urna consectetur commodo at eget arcu. Fusce sagittis consequat elementum. Nunc viverra sed leo at porttitor.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Nulla tempor nulla at nunc malesuada, non faucibus sem vulputate. Nunc turpis tortor, aliquet et orci id, finibus sollicitudin est. Etiam at faucibus libero, et finibus sapien. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras pulvinar nisi id nisl elementum interdum. In eget magna ut nisi rutrum venenatis. Morbi pretium condimentum imperdiet. Quisque sed felis sed ante accumsan malesuada nec molestie mi. Nullam a maximus dui, nec tristique sapien. Ut porttitor quam eget orci suscipit maximus. Vivamus eu ipsum tincidunt, pharetra eros in, sodales dolor. Praesent posuere massa purus, sit amet consectetur est commodo et. Proin et erat fringilla, sodales ante quis, semper arcu.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Integer risus nibh, suscipit eget diam quis, dignissim molestie urna. Quisque dictum, nulla id ornare facilisis, purus eros varius augue, et vulputate ligula odio vitae augue. Donec pharetra non ex sit amet vulputate. Morbi scelerisque tellus nec enim maximus, sed auctor turpis vulputate. Donec vulputate sem varius dui dapibus auctor. Ut aliquam efficitur risus id pretium. Vestibulum ultricies ex ut tellus pharetra, at viverra augue convallis. Vivamus consectetur orci nec eros luctus imperdiet. Quisque pretium neque in quam viverra vestibulum.</p>', '<h3 style=\"font-family: Rubik, sans-serif; color: rgb(69, 90, 100);\">Üyelik Sözleşmesi</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis vitae erat vel ornare. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed in turpis nec eros tincidunt sollicitudin sit amet a ipsum. Phasellus lacinia id turpis quis efficitur. Integer finibus, diam in pharetra sagittis, dolor tortor tincidunt dui, a vestibulum nisl quam vestibulum est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam erat volutpat. Nunc convallis lacus eget dignissim consectetur. Curabitur sit amet rutrum velit. Pellentesque a magna enim. Vivamus bibendum pulvinar odio non imperdiet. In nulla ipsum, varius eget ultricies in, vulputate nec enim. Nullam hendrerit nisl ut convallis ultrices. In vitae massa quis nunc placerat faucibus in a nibh. Suspendisse suscipit, nulla id vulputate convallis, diam lorem volutpat lacus, vel condimentum tortor ligula ac ante. Integer auctor sagittis ex in finibus.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Curabitur in dignissim sapien, non ultrices lorem. Suspendisse auctor iaculis turpis, gravida tempor ex suscipit id. Nunc fermentum id est auctor accumsan. Phasellus in est non augue consectetur sagittis et in orci. Donec tempus bibendum ex eget sagittis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec quis diam tincidunt, pulvinar leo in, pretium erat. Sed nec ex rutrum, pretium mauris et, consequat massa. Cras commodo sapien ut nibh semper aliquam. Sed tincidunt tincidunt consequat. Phasellus semper sem egestas bibendum vehicula. Nullam tempus, ligula euismod volutpat efficitur, sem velit laoreet sapien, in venenatis quam dolor eleifend lacus. Etiam finibus quam elementum est bibendum, vitae bibendum ante pretium. Ut at sapien dignissim, pulvinar metus sit amet, auctor lectus. Morbi ullamcorper lorem a ligula fringilla, a finibus tellus volutpat.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Etiam semper, odio in dictum tempus, dui sem fringilla ante, a iaculis augue lorem in risus. Nulla vitae tincidunt eros, mollis dapibus magna. Nulla eu velit a elit malesuada ullamcorper. Maecenas bibendum tincidunt justo non tempor. Phasellus blandit, erat in semper egestas, mi ex varius felis, eu egestas urna ex quis mi. Sed mollis urna quis est convallis placerat. Vestibulum lacus arcu, condimentum ut imperdiet nec, tristique sed lorem. Proin eu consequat magna. Nam sed placerat libero, eget tincidunt nibh. Nam sed leo dapibus urna consectetur commodo at eget arcu. Fusce sagittis consequat elementum. Nunc viverra sed leo at porttitor.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Nulla tempor nulla at nunc malesuada, non faucibus sem vulputate. Nunc turpis tortor, aliquet et orci id, finibus sollicitudin est. Etiam at faucibus libero, et finibus sapien. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras pulvinar nisi id nisl elementum interdum. In eget magna ut nisi rutrum venenatis. Morbi pretium condimentum imperdiet. Quisque sed felis sed ante accumsan malesuada nec molestie mi. Nullam a maximus dui, nec tristique sapien. Ut porttitor quam eget orci suscipit maximus. Vivamus eu ipsum tincidunt, pharetra eros in, sodales dolor. Praesent posuere massa purus, sit amet consectetur est commodo et. Proin et erat fringilla, sodales ante quis, semper arcu.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Integer risus nibh, suscipit eget diam quis, dignissim molestie urna. Quisque dictum, nulla id ornare facilisis, purus eros varius augue, et vulputate ligula odio vitae augue. Donec pharetra non ex sit amet vulputate. Morbi scelerisque tellus nec enim maximus, sed auctor turpis vulputate. Donec vulputate sem varius dui dapibus auctor. Ut aliquam efficitur risus id pretium. Vestibulum ultricies ex ut tellus pharetra, at viverra augue convallis. Vivamus consectetur orci nec eros luctus imperdiet. Quisque pretium neque in quam viverra vestibulum.</p>', '<p><span style=\"box-sizing: border-box; font-weight: bolder; color: rgb(102, 102, 102); font-family: \" open=\"\" sans\",=\"\" sans-serif;\"=\"\">Bilişim TİC. LTD. ŞTİ. </span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: \" open=\"\" sans\",=\"\" sans-serif;\"=\"\"><span style=\"color: rgb(102, 102, 102); font-family: \" open=\"\" sans\",=\"\" sans-serif;\"=\"\">Gelişen web teknolojilerine yön veren ve ileri düzey sunduğu çözümleri ile tanışmak için hemen bizimle iletişime geçebilirsiniz.</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: \" open=\"\" sans\",=\"\" sans-serif;\"=\"\"><br></p>');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yorumlar`
--

CREATE TABLE `yorumlar` (
  `yorum_id` int(11) NOT NULL,
  `yorum_icerik` longtext CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `yorum_isim` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `yorum_resim` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `yorum_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yorumlar`
--

INSERT INTO `yorumlar` (`yorum_id`, `yorum_icerik`, `yorum_isim`, `yorum_resim`, `yorum_link`) VALUES
(1, ' Ut nec arcu ut tortor volutpat posuere non eu justo. \r\nPellentesque elementum ultricies enim a elementum. Integer feugiat sagittis diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Betül Bayer', 'assets/img/yorumlar/2679829691.jpg', ''),
(2, ' consectetur adipiscing elit. Ut nec arcu ut tortor volutpat posuere non eu justo.\r\nLorem ipsum dolor sit amet, Pellentesque elementum ultricies enim a elementum. Integer feugiat sagittis diam. ', 'Yıldız Ceren', 'assets/img/yorumlar/2496031920.jpg', ''),
(3, 'Pellentesque elementum ultricies enim a elementum. Integer feugiat sagittis diam.\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nec arcu ut tortor volutpat posuere non eu justo.  ', 'Fatma Nagihan', 'assets/img/yorumlar/2273220786.jpg', '');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `ayar`
--
ALTER TABLE `ayar`
  ADD PRIMARY KEY (`ayar_id`);

--
-- Tablo için indeksler `ayar_kredi_karti`
--
ALTER TABLE `ayar_kredi_karti`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `bilgi`
--
ALTER TABLE `bilgi`
  ADD PRIMARY KEY (`bilgi_id`);

--
-- Tablo için indeksler `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`blog_id`);

--
-- Tablo için indeksler `counter`
--
ALTER TABLE `counter`
  ADD PRIMARY KEY (`counter_id`);

--
-- Tablo için indeksler `demo`
--
ALTER TABLE `demo`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `destek`
--
ALTER TABLE `destek`
  ADD PRIMARY KEY (`destek_id`);

--
-- Tablo için indeksler `destekmesaj`
--
ALTER TABLE `destekmesaj`
  ADD PRIMARY KEY (`destekmesaj_id`);

--
-- Tablo için indeksler `duyuru`
--
ALTER TABLE `duyuru`
  ADD PRIMARY KEY (`duyuru_id`);

--
-- Tablo için indeksler `eklenti`
--
ALTER TABLE `eklenti`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `flink`
--
ALTER TABLE `flink`
  ADD PRIMARY KEY (`flink_id`);

--
-- Tablo için indeksler `fmenu`
--
ALTER TABLE `fmenu`
  ADD PRIMARY KEY (`fmenu_id`);

--
-- Tablo için indeksler `hesap`
--
ALTER TABLE `hesap`
  ADD PRIMARY KEY (`hesap_id`);

--
-- Tablo için indeksler `hit`
--
ALTER TABLE `hit`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `hizmetler`
--
ALTER TABLE `hizmetler`
  ADD PRIMARY KEY (`hizmet_id`);

--
-- Tablo için indeksler `il`
--
ALTER TABLE `il`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `iletisim`
--
ALTER TABLE `iletisim`
  ADD PRIMARY KEY (`iletisim_id`);

--
-- Tablo için indeksler `kategoriler`
--
ALTER TABLE `kategoriler`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Tablo için indeksler `kategorilerb`
--
ALTER TABLE `kategorilerb`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Tablo için indeksler `kategoripaket`
--
ALTER TABLE `kategoripaket`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Tablo için indeksler `kategoriproje`
--
ALTER TABLE `kategoriproje`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Tablo için indeksler `kredi_karti_odemesi`
--
ALTER TABLE `kredi_karti_odemesi`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kullanici`
--
ALTER TABLE `kullanici`
  ADD PRIMARY KEY (`kullanici_id`);

--
-- Tablo için indeksler `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`mail_id`);

--
-- Tablo için indeksler `markalar`
--
ALTER TABLE `markalar`
  ADD PRIMARY KEY (`hizmet_id`);

--
-- Tablo için indeksler `mesajlar`
--
ALTER TABLE `mesajlar`
  ADD PRIMARY KEY (`mesaj_id`);

--
-- Tablo için indeksler `meta`
--
ALTER TABLE `meta`
  ADD PRIMARY KEY (`meta_id`);

--
-- Tablo için indeksler `motor`
--
ALTER TABLE `motor`
  ADD PRIMARY KEY (`motor_id`);

--
-- Tablo için indeksler `odeme`
--
ALTER TABLE `odeme`
  ADD PRIMARY KEY (`odeme_id`);

--
-- Tablo için indeksler `odemebildirim`
--
ALTER TABLE `odemebildirim`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `omenu`
--
ALTER TABLE `omenu`
  ADD PRIMARY KEY (`omenu_id`);

--
-- Tablo için indeksler `paytr`
--
ALTER TABLE `paytr`
  ADD PRIMARY KEY (`paytr_id`);

--
-- Tablo için indeksler `projeler`
--
ALTER TABLE `projeler`
  ADD PRIMARY KEY (`proje_id`);

--
-- Tablo için indeksler `randevu`
--
ALTER TABLE `randevu`
  ADD PRIMARY KEY (`randevu_id`);

--
-- Tablo için indeksler `referanslar`
--
ALTER TABLE `referanslar`
  ADD PRIMARY KEY (`referans_id`);

--
-- Tablo için indeksler `resim`
--
ALTER TABLE `resim`
  ADD PRIMARY KEY (`resim_id`);

--
-- Tablo için indeksler `resimgaleri`
--
ALTER TABLE `resimgaleri`
  ADD PRIMARY KEY (`resim_id`);

--
-- Tablo için indeksler `sayfalar`
--
ALTER TABLE `sayfalar`
  ADD PRIMARY KEY (`sayfa_id`);

--
-- Tablo için indeksler `shopier`
--
ALTER TABLE `shopier`
  ADD PRIMARY KEY (`shopier_id`);

--
-- Tablo için indeksler `siparis`
--
ALTER TABLE `siparis`
  ADD PRIMARY KEY (`siparis_id`);

--
-- Tablo için indeksler `slayt`
--
ALTER TABLE `slayt`
  ADD PRIMARY KEY (`slayt_id`);

--
-- Tablo için indeksler `smenu`
--
ALTER TABLE `smenu`
  ADD PRIMARY KEY (`smenu_id`);

--
-- Tablo için indeksler `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`sms_id`);

--
-- Tablo için indeksler `sosyal`
--
ALTER TABLE `sosyal`
  ADD PRIMARY KEY (`sosyal_id`);

--
-- Tablo için indeksler `sss`
--
ALTER TABLE `sss`
  ADD PRIMARY KEY (`sss_id`);

--
-- Tablo için indeksler `surun`
--
ALTER TABLE `surun`
  ADD PRIMARY KEY (`surun_id`);

--
-- Tablo için indeksler `urunler`
--
ALTER TABLE `urunler`
  ADD PRIMARY KEY (`urun_id`);

--
-- Tablo için indeksler `uye`
--
ALTER TABLE `uye`
  ADD PRIMARY KEY (`uye_id`);

--
-- Tablo için indeksler `videogaleri`
--
ALTER TABLE `videogaleri`
  ADD PRIMARY KEY (`video_id`);

--
-- Tablo için indeksler `whatsapp`
--
ALTER TABLE `whatsapp`
  ADD PRIMARY KEY (`whats_id`);

--
-- Tablo için indeksler `widget`
--
ALTER TABLE `widget`
  ADD PRIMARY KEY (`widget_id`);

--
-- Tablo için indeksler `yorumlar`
--
ALTER TABLE `yorumlar`
  ADD PRIMARY KEY (`yorum_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `ayar`
--
ALTER TABLE `ayar`
  MODIFY `ayar_id` int(1) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `ayar_kredi_karti`
--
ALTER TABLE `ayar_kredi_karti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `bilgi`
--
ALTER TABLE `bilgi`
  MODIFY `bilgi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `blog`
--
ALTER TABLE `blog`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Tablo için AUTO_INCREMENT değeri `counter`
--
ALTER TABLE `counter`
  MODIFY `counter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `demo`
--
ALTER TABLE `demo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `destek`
--
ALTER TABLE `destek`
  MODIFY `destek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `destekmesaj`
--
ALTER TABLE `destekmesaj`
  MODIFY `destekmesaj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `duyuru`
--
ALTER TABLE `duyuru`
  MODIFY `duyuru_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `eklenti`
--
ALTER TABLE `eklenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `flink`
--
ALTER TABLE `flink`
  MODIFY `flink_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Tablo için AUTO_INCREMENT değeri `fmenu`
--
ALTER TABLE `fmenu`
  MODIFY `fmenu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `hesap`
--
ALTER TABLE `hesap`
  MODIFY `hesap_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `hit`
--
ALTER TABLE `hit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Tablo için AUTO_INCREMENT değeri `hizmetler`
--
ALTER TABLE `hizmetler`
  MODIFY `hizmet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `il`
--
ALTER TABLE `il`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- Tablo için AUTO_INCREMENT değeri `iletisim`
--
ALTER TABLE `iletisim`
  MODIFY `iletisim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `kategoriler`
--
ALTER TABLE `kategoriler`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `kategorilerb`
--
ALTER TABLE `kategorilerb`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `kategoripaket`
--
ALTER TABLE `kategoripaket`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `kategoriproje`
--
ALTER TABLE `kategoriproje`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `kredi_karti_odemesi`
--
ALTER TABLE `kredi_karti_odemesi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `kullanici`
--
ALTER TABLE `kullanici`
  MODIFY `kullanici_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `mail`
--
ALTER TABLE `mail`
  MODIFY `mail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `markalar`
--
ALTER TABLE `markalar`
  MODIFY `hizmet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Tablo için AUTO_INCREMENT değeri `mesajlar`
--
ALTER TABLE `mesajlar`
  MODIFY `mesaj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Tablo için AUTO_INCREMENT değeri `meta`
--
ALTER TABLE `meta`
  MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `motor`
--
ALTER TABLE `motor`
  MODIFY `motor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `odeme`
--
ALTER TABLE `odeme`
  MODIFY `odeme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `odemebildirim`
--
ALTER TABLE `odemebildirim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `omenu`
--
ALTER TABLE `omenu`
  MODIFY `omenu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- Tablo için AUTO_INCREMENT değeri `paytr`
--
ALTER TABLE `paytr`
  MODIFY `paytr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `projeler`
--
ALTER TABLE `projeler`
  MODIFY `proje_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- Tablo için AUTO_INCREMENT değeri `randevu`
--
ALTER TABLE `randevu`
  MODIFY `randevu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `referanslar`
--
ALTER TABLE `referanslar`
  MODIFY `referans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Tablo için AUTO_INCREMENT değeri `resim`
--
ALTER TABLE `resim`
  MODIFY `resim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- Tablo için AUTO_INCREMENT değeri `resimgaleri`
--
ALTER TABLE `resimgaleri`
  MODIFY `resim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Tablo için AUTO_INCREMENT değeri `sayfalar`
--
ALTER TABLE `sayfalar`
  MODIFY `sayfa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `shopier`
--
ALTER TABLE `shopier`
  MODIFY `shopier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `siparis`
--
ALTER TABLE `siparis`
  MODIFY `siparis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- Tablo için AUTO_INCREMENT değeri `slayt`
--
ALTER TABLE `slayt`
  MODIFY `slayt_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Tablo için AUTO_INCREMENT değeri `smenu`
--
ALTER TABLE `smenu`
  MODIFY `smenu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Tablo için AUTO_INCREMENT değeri `sms`
--
ALTER TABLE `sms`
  MODIFY `sms_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `sosyal`
--
ALTER TABLE `sosyal`
  MODIFY `sosyal_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `sss`
--
ALTER TABLE `sss`
  MODIFY `sss_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `surun`
--
ALTER TABLE `surun`
  MODIFY `surun_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- Tablo için AUTO_INCREMENT değeri `urunler`
--
ALTER TABLE `urunler`
  MODIFY `urun_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- Tablo için AUTO_INCREMENT değeri `uye`
--
ALTER TABLE `uye`
  MODIFY `uye_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Tablo için AUTO_INCREMENT değeri `videogaleri`
--
ALTER TABLE `videogaleri`
  MODIFY `video_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `whatsapp`
--
ALTER TABLE `whatsapp`
  MODIFY `whats_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `widget`
--
ALTER TABLE `widget`
  MODIFY `widget_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `yorumlar`
--
ALTER TABLE `yorumlar`
  MODIFY `yorum_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
