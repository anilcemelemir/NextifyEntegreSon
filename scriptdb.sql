-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Nov 18, 2025 at 06:50 PM
-- Server version: 5.7.44
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scriptdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `abonelikler`
--

CREATE TABLE `abonelikler` (
  `abone_id` int(11) NOT NULL,
  `abone_uye` int(11) NOT NULL,
  `abone_urun` int(11) NOT NULL,
  `abone_tur` enum('aylik','yillik') COLLATE utf8_turkish_ci NOT NULL,
  `abone_baslangic_tarih` datetime NOT NULL,
  `abone_bitis_tarih` datetime NOT NULL,
  `abone_son_odeme_tarih` datetime DEFAULT NULL,
  `abone_sonraki_odeme_tarih` datetime NOT NULL,
  `abone_durum` enum('aktif','iptal','bekleme') COLLATE utf8_turkish_ci NOT NULL DEFAULT 'aktif',
  `abone_yil_sayisi` int(11) DEFAULT '1',
  `abone_tarih` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `abonelikler`
--

INSERT INTO `abonelikler` (`abone_id`, `abone_uye`, `abone_urun`, `abone_tur`, `abone_baslangic_tarih`, `abone_bitis_tarih`, `abone_son_odeme_tarih`, `abone_sonraki_odeme_tarih`, `abone_durum`, `abone_yil_sayisi`, `abone_tarih`) VALUES
(1, 21, 97, 'aylik', '2025-11-18 15:42:10', '2025-12-18 15:42:10', NULL, '2025-12-18 15:42:10', 'bekleme', 1, '2025-11-18 12:42:10'),
(2, 21, 96, 'aylik', '2025-11-18 15:42:22', '2025-12-18 15:42:22', NULL, '2025-12-18 15:42:22', 'bekleme', 1, '2025-11-18 12:42:22'),
(3, 21, 97, 'aylik', '2025-11-18 15:44:25', '2025-12-18 15:44:25', NULL, '2025-12-18 15:44:25', 'bekleme', 1, '2025-11-18 12:44:25');

-- --------------------------------------------------------

--
-- Table structure for table `abonelik_odemeler`
--

CREATE TABLE `abonelik_odemeler` (
  `odeme_id` int(11) NOT NULL,
  `odeme_abone` int(11) NOT NULL,
  `odeme_uye` int(11) NOT NULL,
  `odeme_tutar` decimal(10,2) NOT NULL,
  `odeme_tur` enum('aylik','yillik') COLLATE utf8_turkish_ci NOT NULL,
  `odeme_durum` enum('basarili','basarisiz','bekleme') COLLATE utf8_turkish_ci NOT NULL DEFAULT 'bekleme',
  `odeme_tarih` datetime DEFAULT NULL,
  `odeme_basarisiz_neden` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `odeme_referans` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `odeme_olusturma_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `abonelik_odemeler`
--

INSERT INTO `abonelik_odemeler` (`odeme_id`, `odeme_abone`, `odeme_uye`, `odeme_tutar`, `odeme_tur`, `odeme_durum`, `odeme_tarih`, `odeme_basarisiz_neden`, `odeme_referans`, `odeme_olusturma_tarihi`) VALUES
(1, 1, 21, 0.00, 'aylik', 'bekleme', NULL, NULL, NULL, '2025-11-18 12:42:10'),
(2, 2, 21, 0.00, 'aylik', 'bekleme', NULL, NULL, NULL, '2025-11-18 12:42:22'),
(3, 3, 21, 0.00, 'aylik', 'bekleme', NULL, NULL, NULL, '2025-11-18 12:44:25');

-- --------------------------------------------------------

--
-- Table structure for table `ayar`
--

CREATE TABLE `ayar` (
  `ayar_id` int(1) NOT NULL,
  `ayar_logo` varchar(250) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_fav` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_renk` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_siteurl` varchar(250) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_firmaadi` varchar(250) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_title` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_description` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_keywords` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_adres` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_ilce` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_il` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_tel` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_fax` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_mail` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_kod` longtext COLLATE utf8_turkish_ci,
  `ayar_harita` longtext COLLATE utf8_turkish_ci,
  `ayar_ara` int(11) DEFAULT NULL,
  `ayar_resimparalax` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `resim_footer` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `resim_title` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_resimcounter` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_mobil` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_leoder` int(11) DEFAULT NULL,
  `ayar_imza` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_ark` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_pos` int(11) DEFAULT NULL,
  `ayar_renk2` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_renk3` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_renk4` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ranahtar` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `rgizlianahtar` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ayar_whatsapp` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `ayar`
--

INSERT INTO `ayar` (`ayar_id`, `ayar_logo`, `ayar_fav`, `ayar_renk`, `ayar_siteurl`, `ayar_firmaadi`, `ayar_title`, `ayar_description`, `ayar_keywords`, `ayar_adres`, `ayar_ilce`, `ayar_il`, `ayar_tel`, `ayar_fax`, `ayar_mail`, `ayar_kod`, `ayar_harita`, `ayar_ara`, `ayar_resimparalax`, `resim_footer`, `resim_title`, `ayar_resimcounter`, `ayar_mobil`, `ayar_leoder`, `ayar_imza`, `ayar_ark`, `ayar_pos`, `ayar_renk2`, `ayar_renk3`, `ayar_renk4`, `ranahtar`, `rgizlianahtar`, `ayar_whatsapp`) VALUES
(0, 'assets/img/genel/25592.jpg', 'assets/img/genel/26086.jpg', '#1E1E1E', 'http://localhost:9090/', 'Nextify', 'Nextify!', 'Dijital Geleceğinizi Sadece KODLAMIYORUZ, İNŞA EDİYORUZ • Nextify, her ölçekten işletmenin dijital potansiyelini maksimuma çıkarmayı misyon edindi. ', 'Nextify, tek ??r??n yaz??l??m??, tek ??r??n sistemi, tek ??r??n script sat???? sitesi, tek ??r??n sat???? yaz??l??mı.', 'Pınar Mahallesi 74229 Sokak Safirlife Sitesi A blok Bina No:16 Zemin Kat Daire No:1 Nextify Ofis Seyhan/ADANA', 'Seyhan', 'ADANA', '05416715507', '05416715507', 'info@nextify.tr', '', '<iframe \r\n  src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2944.170299856745!2d35.288802!3d37.014899!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x152888c79f63307d%3A0x2b93fb2cd9a1e43!2sSafir%20Life%20Sitesi!5e0!3m2!1str!2str!4v1730131600000\" \r\n  width=\"100%\" \r\n  height=\"400\" \r\n  frameborder=\"0\" \r\n  style=\"border:0\" \r\n  allowfullscreen>\r\n</iframe>\r\n', 1, 'assets/img/genel/29503.jpg', 'assets/img/genel/27580.jpg', 'assets/img/genel/22732.jpg', 'assets/img/genel/25802.jpg', '1', 0, '<p><b>Saygılarımızla,</b><br><b>Nextify</b></p><p><b>E-posta</b>: info@nextify.tr<br><b>Telefon</b>: +90 5416715507 (09.00 - 18.00)</p>', 'assets/img/genel/24053.jpg', 1, '#CCE63C', '#CE3636', '#DADADA', '6LfPYPAUAAAAAEFnhWjNJZ3LdBltELGNWwLGClTq', '6LfPYPAUAAAAAHO2G9ORBV0rvp3Pl9An_kG4grn4', '05416715507');

-- --------------------------------------------------------

--
-- Table structure for table `ayar_kredi_karti`
--

CREATE TABLE `ayar_kredi_karti` (
  `id` int(11) NOT NULL,
  `iyzico_durum` varchar(255) NOT NULL,
  `iyzico_apiKey` varchar(255) NOT NULL,
  `iyzico_secretKey` varchar(255) NOT NULL,
  `iyzico_uri` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ayar_kredi_karti`
--

INSERT INTO `ayar_kredi_karti` (`id`, `iyzico_durum`, `iyzico_apiKey`, `iyzico_secretKey`, `iyzico_uri`) VALUES
(1, 'aktif', 'sandbox-8akXq90Vc70BwQJ4RjdGdACeWflcvoVz', 'sandbox-aFKZYrpI3PSz56kJeIXuA1VGXp1465Rq', 'https://sandbox-api.iyzipay.com');

-- --------------------------------------------------------

--
-- Table structure for table `bilgi`
--

CREATE TABLE `bilgi` (
  `bilgi_id` int(11) NOT NULL,
  `bilgi_baslik` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `bilgi_aciklama` text COLLATE utf8_turkish_ci NOT NULL,
  `resim` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `bilgi`
--

INSERT INTO `bilgi` (`bilgi_id`, `bilgi_baslik`, `bilgi_aciklama`, `resim`) VALUES
(1, 'Kolay & H??zl?? Sipari??', 'En basit ve h??zl?? i??lem men??leri\r\n', 'assets/img/genel/2946520385.jpg'),
(2, 'G??venli ??deme', 'Online 3D g??venli ??deme ??zelli??i', 'assets/img/genel/3073420510.jpg'),
(3, 'Mutlu M????teriler', 'Her m????terimiz ko??ulsuz referans??m??zd??r.', 'assets/img/genel/2579029586.jpg'),
(4, 'Ger??ek Temsilci', 'Uzman ekibimiz her zaman yan??n??zda', 'assets/img/genel/2451925994.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `blog_id` int(11) NOT NULL,
  `blog_resim` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `blog_tarih` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `blog_baslik` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `blog_kategori` int(11) NOT NULL,
  `blog_detay` longtext COLLATE utf8_turkish_ci NOT NULL,
  `blog_title` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `blog_descr` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `blog_keyword` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`blog_id`, `blog_resim`, `blog_tarih`, `blog_baslik`, `blog_kategori`, `blog_detay`, `blog_title`, `blog_descr`, `blog_keyword`) VALUES
(1, 'assets/img/blog/2229722880.jpg', '2017-09-29 06:54:21', 'Samsung Galaxy Watch Active ??ncelemesi', 3, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam est nibh, bibendum ut erat a, molestie pretium leo. Nunc accumsan, purus id tempor vestibulum, ante lorem porta elit, a venenatis velit justo ut ipsum.</p>\r\n\r\n<p>Donec semper dictum posuere. Cras congue eros fringilla neque condimentum malesuada. Vivamus hendrerit, justo vitae vehicula consectetur, dui ligula tincidunt turpis, sit amet pulvinar tortor risus ac tortor. In id hendrerit tortor, vel fermentum nunc. Nullam sed venenatis leo, quis porta neque. Quisque sodales quam sit amet placerat malesuada. Praesent quis ultricies nibh. Duis sit amet leo convallis, imperdiet urna sed, varius justo. Aliquam erat volutpat. Nam nisl magna, tristique nec sodales eget, feugiat sit amet dui.</p>\r\n\r\n<p>Pellentesque pellentesque fringilla diam, vitae vehicula orci vulputate ut. Cras nec sagittis neque. In in pharetra arcu, at vulputate urna. Aenean porta mauris nec elit venenatis vehicula. Integer accumsan, est sed tempus ultrices, eros mi iaculis dolor, at laoreet ligula ex non ipsum. Sed vitae nisl dictum, porttitor urna id, porttitor ex. Donec dignissim velit neque, et laoreet mauris luctus non. Etiam egestas pretium euismod. Cras non mauris sapien. In hac habitasse platea dictumst. Donec tortor ligula, fringilla et justo a, mattis mollis sem. Nullam gravida odio erat, vitae ornare urna pretium vel. Duis aliquet vel neque pulvinar faucibus. Ut at sapien in turpis finibus varius vel a magna. Praesent lacinia urna eros, quis cursus diam aliquet a. Ut velit nisl, tempor ut mi non, euismod pellentesque erat. Nulla facilisi.</p>\r\n\r\n<p>Aliquam rutrum elit vel varius feugiat. Mauris mauris elit, ornare a auctor sit amet, vehicula et nulla. Pellentesque vitae justo tristique urna rhoncus pretium non ac ante. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent a lacus a turpis pharetra viverra. Nunc in lobortis elit. Maecenas sed felis sapien. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas at finibus nibh. Cras faucibus risus sit amet augue ornare, quis euismod velit tincidunt. Morbi quis neque vel nulla varius porta volutpat at libero. Sed convallis ante eget neque iaculis, et ullamcorper sem mattis. Phasellus at lorem ipsum. In hac habitasse platea dictumst. Nam accumsan, dui non pharetra rhoncus, mi nulla volutpat sapien, eu hendrerit massa diam ac odio. Mauris sollicitudin purus diam, et viverra justo volutpat vehicula. Quisque sed est et dui pharetra interdum. Donec et elementum augue. Ut dapibus semper mattis. Mauris arcu nibh, scelerisque et risus eget, bibendum tempus ligula.</p>\r\n\r\n<p>Vivamus venenatis turpis at ex ullamcorper, nec suscipit mi ultrices. Nullam ac pellentesque leo, at aliquet turpis. Curabitur lobortis efficitur tempor. Cras aliquam erat a tellus efficitur ultricies. Vestibulum tempus arcu mi, dignissim faucibus tortor luctus vel. Integer aliquet imperdiet tellus, id mollis augue feugiat quis. Donec consectetur sed sapien laoreet ultrices. In eleifend tortor at cursus sollicitudin. Suspendisse id accumsan lorem. Maecenas et enim nec augue dictum pharetra. Morbi sapien quam, convallis vitae sem id, elementum tempor enim. Nunc eget neque consectetur, vulputate quam eget, volutpat nibh. Nullam mi lorem, molestie sit amet turpis a, imperdiet cursus quam. Sed rhoncus urna nec arcu convallis, et euismod eros congue. Aliquam sed magna enim. Quisque semper pellentesque euismod. Aliquam posuere ipsum quis purus gravida vehicula. Nullam facilisis erat in velit convallis, vitae egestas eros tempus.</p>\r\n', 'Samsung Galaxy Watch Active ??ncelemesi', 'Samsung Galaxy Watch Active ??ncelemesi', 'Samsung Galaxy Watch Active ??ncelemesi'),
(11, 'assets/img/blog/2878427595.jpg', '2017-10-05 09:50:39', 'E-Kitap Okuyucu Almak ????in 11 Neden', 3, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam auctor dignissim arcu, eu scelerisque orci finibus vel. Suspendisse eget consectetur justo, non efficitur quam. Pellentesque lacinia id est eget lacinia. Phasellus ut sem et mi consectetur maximus. Etiam pharetra quam in nibh faucibus, at venenatis mi elementum. Nullam bibendum ultrices leo ut vehicula. Phasellus id turpis turpis. Integer scelerisque ac massa a vulputate.</p>\r\n\r\n<p>Fusce hendrerit eros nec justo maximus gravida. Vivamus sed consequat lorem. In hac habitasse platea dictumst. Duis ut eros vitae purus porttitor tristique. Donec eu dapibus ante, non porta erat. Integer nulla elit, egestas non enim vehicula, tempus vestibulum sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n\r\n<p>Nunc ex dolor, tincidunt ac feugiat non, faucibus eu sem. Fusce id odio quis elit pellentesque malesuada. Maecenas tincidunt porta imperdiet. Vivamus in arcu arcu. Quisque ut risus eu purus placerat porttitor vel non lacus. Nam et iaculis ex. Ut in malesuada leo. Phasellus ut condimentum odio. Nunc ac urna dignissim, egestas diam sit amet, molestie enim. Curabitur in porta libero, id volutpat magna.</p>\r\n\r\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer in scelerisque mauris. Nunc scelerisque hendrerit urna, quis pellentesque velit dictum a. Sed ipsum nisi, viverra tincidunt consequat bibendum, vulputate feugiat justo. Vivamus eget rutrum ante. Nullam semper diam vitae lacus malesuada, nec porttitor turpis tincidunt. Donec placerat urna quis arcu blandit, eget aliquet dui tincidunt. Sed viverra ex nec est consectetur aliquet. Nunc efficitur molestie turpis, ac faucibus nunc viverra ut. Aenean a magna ac nulla ultrices condimentum eu sed mi. Duis sit amet ligula rutrum nulla vehicula vulputate. Donec vehicula imperdiet sagittis. Donec ut pulvinar justo, non rhoncus felis. Curabitur bibendum nunc at dui iaculis, vitae ultricies purus luctus. Nullam efficitur, tellus mollis dignissim condimentum, nisl lacus accumsan orci, id maximus sapien odio nec quam. Praesent tincidunt urna tortor, tempor feugiat libero aliquam vitae.</p>\r\n\r\n<p>Vivamus ut sem vel velit molestie dapibus id vitae quam. Nulla vitae urna semper felis scelerisque tincidunt eu ut lacus. Donec at sapien et sem dapibus vehicula. Nulla facilisi. Ut eget blandit justo. Suspendisse metus ante, laoreet quis ex ac, convallis ullamcorper lorem. Phasellus tempor mi sem, sed pretium massa luctus vestibulum. Mauris in tristique risus.</p>\r\n', 'E-Kitap Okuyucu Almak ????in 11 Neden', 'E-Kitap Okuyucu Almak ????in 11 Neden', 'E-Kitap Okuyucu Almak ????in 11 Neden'),
(12, 'assets/img/blog/2799329727.jpg', '2017-09-29 06:54:21', 'En ??ok Okunan Kitaplar', 3, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam est nibh, bibendum ut erat a, molestie pretium leo. Nunc accumsan, purus id tempor vestibulum, ante lorem porta elit, a venenatis velit justo ut ipsum.</p>\r\n\r\n<p>Donec semper dictum posuere. Cras congue eros fringilla neque condimentum malesuada. Vivamus hendrerit, justo vitae vehicula consectetur, dui ligula tincidunt turpis, sit amet pulvinar tortor risus ac tortor. In id hendrerit tortor, vel fermentum nunc. Nullam sed venenatis leo, quis porta neque. Quisque sodales quam sit amet placerat malesuada. Praesent quis ultricies nibh. Duis sit amet leo convallis, imperdiet urna sed, varius justo. Aliquam erat volutpat. Nam nisl magna, tristique nec sodales eget, feugiat sit amet dui.</p>\r\n\r\n<p>Pellentesque pellentesque fringilla diam, vitae vehicula orci vulputate ut. Cras nec sagittis neque. In in pharetra arcu, at vulputate urna. Aenean porta mauris nec elit venenatis vehicula. Integer accumsan, est sed tempus ultrices, eros mi iaculis dolor, at laoreet ligula ex non ipsum. Sed vitae nisl dictum, porttitor urna id, porttitor ex. Donec dignissim velit neque, et laoreet mauris luctus non. Etiam egestas pretium euismod. Cras non mauris sapien. In hac habitasse platea dictumst. Donec tortor ligula, fringilla et justo a, mattis mollis sem. Nullam gravida odio erat, vitae ornare urna pretium vel. Duis aliquet vel neque pulvinar faucibus. Ut at sapien in turpis finibus varius vel a magna. Praesent lacinia urna eros, quis cursus diam aliquet a. Ut velit nisl, tempor ut mi non, euismod pellentesque erat. Nulla facilisi.</p>\r\n\r\n<p>Aliquam rutrum elit vel varius feugiat. Mauris mauris elit, ornare a auctor sit amet, vehicula et nulla. Pellentesque vitae justo tristique urna rhoncus pretium non ac ante. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent a lacus a turpis pharetra viverra. Nunc in lobortis elit. Maecenas sed felis sapien. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas at finibus nibh. Cras faucibus risus sit amet augue ornare, quis euismod velit tincidunt. Morbi quis neque vel nulla varius porta volutpat at libero. Sed convallis ante eget neque iaculis, et ullamcorper sem mattis. Phasellus at lorem ipsum. In hac habitasse platea dictumst. Nam accumsan, dui non pharetra rhoncus, mi nulla volutpat sapien, eu hendrerit massa diam ac odio. Mauris sollicitudin purus diam, et viverra justo volutpat vehicula. Quisque sed est et dui pharetra interdum. Donec et elementum augue. Ut dapibus semper mattis. Mauris arcu nibh, scelerisque et risus eget, bibendum tempus ligula.</p>\r\n\r\n<p>Vivamus venenatis turpis at ex ullamcorper, nec suscipit mi ultrices. Nullam ac pellentesque leo, at aliquet turpis. Curabitur lobortis efficitur tempor. Cras aliquam erat a tellus efficitur ultricies. Vestibulum tempus arcu mi, dignissim faucibus tortor luctus vel. Integer aliquet imperdiet tellus, id mollis augue feugiat quis. Donec consectetur sed sapien laoreet ultrices. In eleifend tortor at cursus sollicitudin. Suspendisse id accumsan lorem. Maecenas et enim nec augue dictum pharetra. Morbi sapien quam, convallis vitae sem id, elementum tempor enim. Nunc eget neque consectetur, vulputate quam eget, volutpat nibh. Nullam mi lorem, molestie sit amet turpis a, imperdiet cursus quam. Sed rhoncus urna nec arcu convallis, et euismod eros congue. Aliquam sed magna enim. Quisque semper pellentesque euismod. Aliquam posuere ipsum quis purus gravida vehicula. Nullam facilisis erat in velit convallis, vitae egestas eros tempus.</p>\r\n', 'En ??ok Okunan Kitaplar', 'En ??ok Okunan Kitaplar', 'En ??ok Okunan Kitaplar'),
(13, 'assets/img/blog/2881227026.jpg', '2017-09-29 06:54:22', 'Dondurma Nas??l Yap??l??r?', 3, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam auctor dignissim arcu, eu scelerisque orci finibus vel. Suspendisse eget consectetur justo, non efficitur quam. Pellentesque lacinia id est eget lacinia. Phasellus ut sem et mi consectetur maximus. Etiam pharetra quam in nibh faucibus, at venenatis mi elementum. Nullam bibendum ultrices leo ut vehicula. Phasellus id turpis turpis. Integer scelerisque ac massa a vulputate.</p>\r\n\r\n<p>Fusce hendrerit eros nec justo maximus gravida. Vivamus sed consequat lorem. In hac habitasse platea dictumst. Duis ut eros vitae purus porttitor tristique. Donec eu dapibus ante, non porta erat. Integer nulla elit, egestas non enim vehicula, tempus vestibulum sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n\r\n<p>Nunc ex dolor, tincidunt ac feugiat non, faucibus eu sem. Fusce id odio quis elit pellentesque malesuada. Maecenas tincidunt porta imperdiet. Vivamus in arcu arcu. Quisque ut risus eu purus placerat porttitor vel non lacus. Nam et iaculis ex. Ut in malesuada leo. Phasellus ut condimentum odio. Nunc ac urna dignissim, egestas diam sit amet, molestie enim. Curabitur in porta libero, id volutpat magna.</p>\r\n\r\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer in scelerisque mauris. Nunc scelerisque hendrerit urna, quis pellentesque velit dictum a. Sed ipsum nisi, viverra tincidunt consequat bibendum, vulputate feugiat justo. Vivamus eget rutrum ante. Nullam semper diam vitae lacus malesuada, nec porttitor turpis tincidunt. Donec placerat urna quis arcu blandit, eget aliquet dui tincidunt. Sed viverra ex nec est consectetur aliquet. Nunc efficitur molestie turpis, ac faucibus nunc viverra ut. Aenean a magna ac nulla ultrices condimentum eu sed mi. Duis sit amet ligula rutrum nulla vehicula vulputate. Donec vehicula imperdiet sagittis. Donec ut pulvinar justo, non rhoncus felis. Curabitur bibendum nunc at dui iaculis, vitae ultricies purus luctus. Nullam efficitur, tellus mollis dignissim condimentum, nisl lacus accumsan orci, id maximus sapien odio nec quam. Praesent tincidunt urna tortor, tempor feugiat libero aliquam vitae.</p>\r\n\r\n<p>Vivamus ut sem vel velit molestie dapibus id vitae quam. Nulla vitae urna semper felis scelerisque tincidunt eu ut lacus. Donec at sapien et sem dapibus vehicula. Nulla facilisi. Ut eget blandit justo. Suspendisse metus ante, laoreet quis ex ac, convallis ullamcorper lorem. Phasellus tempor mi sem, sed pretium massa luctus vestibulum. Mauris in tristique risus.</p>\r\n', 'Dondurma Nas??l Yap??l??r?', 'Dondurma Nas??l Yap??l??r?', 'Dondurma Nas??l Yap??l??r?'),
(14, 'assets/img/blog/2291320350.jpg', '2017-09-29 06:54:22', 'Porselen Makyaj Nas??l Yap??l??r?', 2, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam auctor dignissim arcu, eu scelerisque orci finibus vel. Suspendisse eget consectetur justo, non efficitur quam. Pellentesque lacinia id est eget lacinia. Phasellus ut sem et mi consectetur maximus. Etiam pharetra quam in nibh faucibus, at venenatis mi elementum. Nullam bibendum ultrices leo ut vehicula. Phasellus id turpis turpis. Integer scelerisque ac massa a vulputate.</p>\r\n\r\n<p>Fusce hendrerit eros nec justo maximus gravida. Vivamus sed consequat lorem. In hac habitasse platea dictumst. Duis ut eros vitae purus porttitor tristique. Donec eu dapibus ante, non porta erat. Integer nulla elit, egestas non enim vehicula, tempus vestibulum sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n\r\n<p>Nunc ex dolor, tincidunt ac feugiat non, faucibus eu sem. Fusce id odio quis elit pellentesque malesuada. Maecenas tincidunt porta imperdiet. Vivamus in arcu arcu. Quisque ut risus eu purus placerat porttitor vel non lacus. Nam et iaculis ex. Ut in malesuada leo. Phasellus ut condimentum odio. Nunc ac urna dignissim, egestas diam sit amet, molestie enim. Curabitur in porta libero, id volutpat magna.</p>\r\n\r\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer in scelerisque mauris. Nunc scelerisque hendrerit urna, quis pellentesque velit dictum a. Sed ipsum nisi, viverra tincidunt consequat bibendum, vulputate feugiat justo. Vivamus eget rutrum ante. Nullam semper diam vitae lacus malesuada, nec porttitor turpis tincidunt. Donec placerat urna quis arcu blandit, eget aliquet dui tincidunt. Sed viverra ex nec est consectetur aliquet. Nunc efficitur molestie turpis, ac faucibus nunc viverra ut. Aenean a magna ac nulla ultrices condimentum eu sed mi. Duis sit amet ligula rutrum nulla vehicula vulputate. Donec vehicula imperdiet sagittis. Donec ut pulvinar justo, non rhoncus felis. Curabitur bibendum nunc at dui iaculis, vitae ultricies purus luctus. Nullam efficitur, tellus mollis dignissim condimentum, nisl lacus accumsan orci, id maximus sapien odio nec quam. Praesent tincidunt urna tortor, tempor feugiat libero aliquam vitae.</p>\r\n\r\n<p>Vivamus ut sem vel velit molestie dapibus id vitae quam. Nulla vitae urna semper felis scelerisque tincidunt eu ut lacus. Donec at sapien et sem dapibus vehicula. Nulla facilisi. Ut eget blandit justo. Suspendisse metus ante, laoreet quis ex ac, convallis ullamcorper lorem. Phasellus tempor mi sem, sed pretium massa luctus vestibulum. Mauris in tristique risus.</p>\r\n', 'Porselen Makyaj Nas??l Yap??l??r?', 'Porselen Makyaj Nas??l Yap??l??r?', 'Porselen Makyaj Nas??l Yap??l??r?'),
(15, 'assets/img/blog/2599330178.jpg', '2017-09-29 06:54:21', 'Bula????k Makinesi Temizli??i Nas??l Yap??l??r?', 2, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam auctor dignissim arcu, eu scelerisque orci finibus vel. Suspendisse eget consectetur justo, non efficitur quam. Pellentesque lacinia id est eget lacinia. Phasellus ut sem et mi consectetur maximus. Etiam pharetra quam in nibh faucibus, at venenatis mi elementum. Nullam bibendum ultrices leo ut vehicula. Phasellus id turpis turpis. Integer scelerisque ac massa a vulputate.</p>\r\n\r\n<p>Fusce hendrerit eros nec justo maximus gravida. Vivamus sed consequat lorem. In hac habitasse platea dictumst. Duis ut eros vitae purus porttitor tristique. Donec eu dapibus ante, non porta erat. Integer nulla elit, egestas non enim vehicula, tempus vestibulum sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n\r\n<p>Nunc ex dolor, tincidunt ac feugiat non, faucibus eu sem. Fusce id odio quis elit pellentesque malesuada. Maecenas tincidunt porta imperdiet. Vivamus in arcu arcu. Quisque ut risus eu purus placerat porttitor vel non lacus. Nam et iaculis ex. Ut in malesuada leo. Phasellus ut condimentum odio. Nunc ac urna dignissim, egestas diam sit amet, molestie enim. Curabitur in porta libero, id volutpat magna.</p>\r\n\r\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer in scelerisque mauris. Nunc scelerisque hendrerit urna, quis pellentesque velit dictum a. Sed ipsum nisi, viverra tincidunt consequat bibendum, vulputate feugiat justo. Vivamus eget rutrum ante. Nullam semper diam vitae lacus malesuada, nec porttitor turpis tincidunt. Donec placerat urna quis arcu blandit, eget aliquet dui tincidunt. Sed viverra ex nec est consectetur aliquet. Nunc efficitur molestie turpis, ac faucibus nunc viverra ut. Aenean a magna ac nulla ultrices condimentum eu sed mi. Duis sit amet ligula rutrum nulla vehicula vulputate. Donec vehicula imperdiet sagittis. Donec ut pulvinar justo, non rhoncus felis. Curabitur bibendum nunc at dui iaculis, vitae ultricies purus luctus. Nullam efficitur, tellus mollis dignissim condimentum, nisl lacus accumsan orci, id maximus sapien odio nec quam. Praesent tincidunt urna tortor, tempor feugiat libero aliquam vitae.</p>\r\n\r\n<p>Vivamus ut sem vel velit molestie dapibus id vitae quam. Nulla vitae urna semper felis scelerisque tincidunt eu ut lacus. Donec at sapien et sem dapibus vehicula. Nulla facilisi. Ut eget blandit justo. Suspendisse metus ante, laoreet quis ex ac, convallis ullamcorper lorem. Phasellus tempor mi sem, sed pretium massa luctus vestibulum. Mauris in tristique risus.</p>\r\n', 'Bula????k Makinesi Temizli??i Nas??l Yap??l??r?', 'Bula????k Makinesi Temizli??i Nas??l Yap??l??r?', 'Bula????k Makinesi Temizli??i Nas??l Yap??l??r?'),
(16, 'assets/img/blog/2749428382.jpg', '2017-10-05 09:50:39', 'Foto??raf Makinesi ??e??itleri Nelerdir?', 2, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam auctor dignissim arcu, eu scelerisque orci finibus vel. Suspendisse eget consectetur justo, non efficitur quam. Pellentesque lacinia id est eget lacinia. Phasellus ut sem et mi consectetur maximus. Etiam pharetra quam in nibh faucibus, at venenatis mi elementum. Nullam bibendum ultrices leo ut vehicula. Phasellus id turpis turpis. Integer scelerisque ac massa a vulputate.</p>\r\n\r\n<p>Fusce hendrerit eros nec justo maximus gravida. Vivamus sed consequat lorem. In hac habitasse platea dictumst. Duis ut eros vitae purus porttitor tristique. Donec eu dapibus ante, non porta erat. Integer nulla elit, egestas non enim vehicula, tempus vestibulum sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n\r\n<p>Nunc ex dolor, tincidunt ac feugiat non, faucibus eu sem. Fusce id odio quis elit pellentesque malesuada. Maecenas tincidunt porta imperdiet. Vivamus in arcu arcu. Quisque ut risus eu purus placerat porttitor vel non lacus. Nam et iaculis ex. Ut in malesuada leo. Phasellus ut condimentum odio. Nunc ac urna dignissim, egestas diam sit amet, molestie enim. Curabitur in porta libero, id volutpat magna.</p>\r\n\r\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer in scelerisque mauris. Nunc scelerisque hendrerit urna, quis pellentesque velit dictum a. Sed ipsum nisi, viverra tincidunt consequat bibendum, vulputate feugiat justo. Vivamus eget rutrum ante. Nullam semper diam vitae lacus malesuada, nec porttitor turpis tincidunt. Donec placerat urna quis arcu blandit, eget aliquet dui tincidunt. Sed viverra ex nec est consectetur aliquet. Nunc efficitur molestie turpis, ac faucibus nunc viverra ut. Aenean a magna ac nulla ultrices condimentum eu sed mi. Duis sit amet ligula rutrum nulla vehicula vulputate. Donec vehicula imperdiet sagittis. Donec ut pulvinar justo, non rhoncus felis. Curabitur bibendum nunc at dui iaculis, vitae ultricies purus luctus. Nullam efficitur, tellus mollis dignissim condimentum, nisl lacus accumsan orci, id maximus sapien odio nec quam. Praesent tincidunt urna tortor, tempor feugiat libero aliquam vitae.</p>\r\n\r\n<p>Vivamus ut sem vel velit molestie dapibus id vitae quam. Nulla vitae urna semper felis scelerisque tincidunt eu ut lacus. Donec at sapien et sem dapibus vehicula. Nulla facilisi. Ut eget blandit justo. Suspendisse metus ante, laoreet quis ex ac, convallis ullamcorper lorem. Phasellus tempor mi sem, sed pretium massa luctus vestibulum. Mauris in tristique risus.</p>\r\n', 'Foto??raf Makinesi ??e??itleri Nelerdir?', 'Foto??raf Makinesi ??e??itleri Nelerdir?', 'Foto??raf Makinesi ??e??itleri Nelerdir?'),
(17, 'assets/img/blog/2052931469.jpg', '2017-09-29 06:54:21', 'Aksiyon Kamera Nedir?', 5, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam auctor dignissim arcu, eu scelerisque orci finibus vel. Suspendisse eget consectetur justo, non efficitur quam. Pellentesque lacinia id est eget lacinia. Phasellus ut sem et mi consectetur maximus. Etiam pharetra quam in nibh faucibus, at venenatis mi elementum. Nullam bibendum ultrices leo ut vehicula. Phasellus id turpis turpis. Integer scelerisque ac massa a vulputate.</p>\r\n\r\n<p>Fusce hendrerit eros nec justo maximus gravida. Vivamus sed consequat lorem. In hac habitasse platea dictumst. Duis ut eros vitae purus porttitor tristique. Donec eu dapibus ante, non porta erat. Integer nulla elit, egestas non enim vehicula, tempus vestibulum sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n\r\n<p>Nunc ex dolor, tincidunt ac feugiat non, faucibus eu sem. Fusce id odio quis elit pellentesque malesuada. Maecenas tincidunt porta imperdiet. Vivamus in arcu arcu. Quisque ut risus eu purus placerat porttitor vel non lacus. Nam et iaculis ex. Ut in malesuada leo. Phasellus ut condimentum odio. Nunc ac urna dignissim, egestas diam sit amet, molestie enim. Curabitur in porta libero, id volutpat magna.</p>\r\n\r\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer in scelerisque mauris. Nunc scelerisque hendrerit urna, quis pellentesque velit dictum a. Sed ipsum nisi, viverra tincidunt consequat bibendum, vulputate feugiat justo. Vivamus eget rutrum ante. Nullam semper diam vitae lacus malesuada, nec porttitor turpis tincidunt. Donec placerat urna quis arcu blandit, eget aliquet dui tincidunt. Sed viverra ex nec est consectetur aliquet. Nunc efficitur molestie turpis, ac faucibus nunc viverra ut. Aenean a magna ac nulla ultrices condimentum eu sed mi. Duis sit amet ligula rutrum nulla vehicula vulputate. Donec vehicula imperdiet sagittis. Donec ut pulvinar justo, non rhoncus felis. Curabitur bibendum nunc at dui iaculis, vitae ultricies purus luctus. Nullam efficitur, tellus mollis dignissim condimentum, nisl lacus accumsan orci, id maximus sapien odio nec quam. Praesent tincidunt urna tortor, tempor feugiat libero aliquam vitae.</p>\r\n\r\n<p>Vivamus ut sem vel velit molestie dapibus id vitae quam. Nulla vitae urna semper felis scelerisque tincidunt eu ut lacus. Donec at sapien et sem dapibus vehicula. Nulla facilisi. Ut eget blandit justo. Suspendisse metus ante, laoreet quis ex ac, convallis ullamcorper lorem. Phasellus tempor mi sem, sed pretium massa luctus vestibulum. Mauris in tristique risus.</p>\r\n', 'Aksiyon Kamera Nedir?', 'Aksiyon Kamera Nedir?', 'Aksiyon Kamera Nedir?'),
(18, 'assets/img/blog/2109020018.jpg', '2017-09-29 06:54:22', 'En ??yi Kulakl??k Markalar??', 3, '<p style=\"text-align: justify; \">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam auctor dignissim arcu, eu scelerisque orci finibus vel. Suspendisse eget consectetur justo, non efficitur quam. Pellentesque lacinia id est eget lacinia. Phasellus ut sem et mi consectetur maximus. Etiam pharetra quam in nibh faucibus, at venenatis mi elementum. Nullam bibendum ultrices leo ut vehicula. Phasellus id turpis turpis. Integer scelerisque ac massa a vulputate.</p>\r\n\r\n<p style=\"text-align: justify; \">Fusce hendrerit eros nec justo maximus gravida. Vivamus sed consequat lorem. In hac habitasse platea dictumst. Duis ut eros vitae purus porttitor tristique. Donec eu dapibus ante, non porta erat. Integer nulla elit, egestas non enim vehicula, tempus vestibulum sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n\r\n<p style=\"text-align: justify;\">Nunc ex dolor, tincidunt ac feugiat non, faucibus eu sem. Fusce id odio quis elit pellentesque malesuada. Maecenas tincidunt porta imperdiet. Vivamus in arcu arcu. Quisque ut risus eu purus placerat porttitor vel non lacus. Nam et iaculis ex. Ut in malesuada leo. Phasellus ut condimentum odio. Nunc ac urna dignissim, egestas diam sit amet, molestie enim. Curabitur in porta libero, id volutpat magna.</p>\r\n\r\n<p style=\"text-align: justify;\">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer in scelerisque mauris. Nunc scelerisque hendrerit urna, quis pellentesque velit dictum a. Sed ipsum nisi, viverra tincidunt consequat bibendum, vulputate feugiat justo. Vivamus eget rutrum ante. Nullam semper diam vitae lacus malesuada, nec porttitor turpis tincidunt. Donec placerat urna quis arcu blandit, eget aliquet dui tincidunt. Sed viverra ex nec est consectetur aliquet. Nunc efficitur molestie turpis, ac faucibus nunc viverra ut. Aenean a magna ac nulla ultrices condimentum eu sed mi. Duis sit amet ligula rutrum nulla vehicula vulputate. Donec vehicula imperdiet sagittis. Donec ut pulvinar justo, non rhoncus felis. Curabitur bibendum nunc at dui iaculis, vitae ultricies purus luctus. Nullam efficitur, tellus mollis dignissim condimentum, nisl lacus accumsan orci, id maximus sapien odio nec quam. Praesent tincidunt urna tortor, tempor feugiat libero aliquam vitae.</p>\r\n\r\n<p style=\"text-align: justify;\">Vivamus ut sem vel velit molestie dapibus id vitae quam. Nulla vitae urna semper felis scelerisque tincidunt eu ut lacus. Donec at sapien et sem dapibus vehicula. Nulla facilisi. Ut eget blandit justo. Suspendisse metus ante, laoreet quis ex ac, convallis ullamcorper lorem. Phasellus tempor mi sem, sed pretium massa luctus vestibulum. Mauris in tristique risus.</p>\r\n', 'En ??yi Kulakl??k Markalar??', 'En ??yi Kulakl??k Markalar??', 'En ??yi Kulakl??k Markalar??'),
(20, 'assets/img/blog/2397728417.jpg', '2017-10-05 09:50:39', 'S??rt ??antas?? Al??rken Bunlara Dikkat!', 3, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam auctor dignissim arcu, eu scelerisque orci finibus vel. Suspendisse eget consectetur justo, non efficitur quam. Pellentesque lacinia id est eget lacinia. Phasellus ut sem et mi consectetur maximus. Etiam pharetra quam in nibh faucibus, at venenatis mi elementum. Nullam bibendum ultrices leo ut vehicula. Phasellus id turpis turpis. Integer scelerisque ac massa a vulputate.</p>\r\n\r\n<p>Fusce hendrerit eros nec justo maximus gravida. Vivamus sed consequat lorem. In hac habitasse platea dictumst. Duis ut eros vitae purus porttitor tristique. Donec eu dapibus ante, non porta erat. Integer nulla elit, egestas non enim vehicula, tempus vestibulum sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n\r\n<p>Nunc ex dolor, tincidunt ac feugiat non, faucibus eu sem. Fusce id odio quis elit pellentesque malesuada. Maecenas tincidunt porta imperdiet. Vivamus in arcu arcu. Quisque ut risus eu purus placerat porttitor vel non lacus. Nam et iaculis ex. Ut in malesuada leo. Phasellus ut condimentum odio. Nunc ac urna dignissim, egestas diam sit amet, molestie enim. Curabitur in porta libero, id volutpat magna.</p>\r\n\r\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer in scelerisque mauris. Nunc scelerisque hendrerit urna, quis pellentesque velit dictum a. Sed ipsum nisi, viverra tincidunt consequat bibendum, vulputate feugiat justo. Vivamus eget rutrum ante. Nullam semper diam vitae lacus malesuada, nec porttitor turpis tincidunt. Donec placerat urna quis arcu blandit, eget aliquet dui tincidunt. Sed viverra ex nec est consectetur aliquet. Nunc efficitur molestie turpis, ac faucibus nunc viverra ut. Aenean a magna ac nulla ultrices condimentum eu sed mi. Duis sit amet ligula rutrum nulla vehicula vulputate. Donec vehicula imperdiet sagittis. Donec ut pulvinar justo, non rhoncus felis. Curabitur bibendum nunc at dui iaculis, vitae ultricies purus luctus. Nullam efficitur, tellus mollis dignissim condimentum, nisl lacus accumsan orci, id maximus sapien odio nec quam. Praesent tincidunt urna tortor, tempor feugiat libero aliquam vitae.</p>\r\n\r\n<p>Vivamus ut sem vel velit molestie dapibus id vitae quam. Nulla vitae urna semper felis scelerisque tincidunt eu ut lacus. Donec at sapien et sem dapibus vehicula. Nulla facilisi. Ut eget blandit justo. Suspendisse metus ante, laoreet quis ex ac, convallis ullamcorper lorem. Phasellus tempor mi sem, sed pretium massa luctus vestibulum. Mauris in tristique risus.</p>\r\n', 'S??rt ??antas?? Al??rken Bunlara Dikkat!', 'S??rt ??antas?? Al??rken Bunlara Dikkat!', 'S??rt ??antas?? Al??rken Bunlara Dikkat!');

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE `counter` (
  `counter_id` int(11) NOT NULL,
  `counter_icon` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `counter_rakam` int(155) NOT NULL,
  `counter_isim` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`counter_id`, `counter_icon`, `counter_rakam`, `counter_isim`) VALUES
(1, 'fa', 90, 'Müşteri Memnuniyeti'),
(2, 'fa', 75, 'Javascript'),
(3, 'fa', 500, 'Java'),
(4, 'fa', 80, 'Asp Net');

-- --------------------------------------------------------

--
-- Table structure for table `demo`
--

CREATE TABLE `demo` (
  `id` int(11) NOT NULL,
  `durum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `demo`
--

INSERT INTO `demo` (`id`, `durum`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `destek`
--

CREATE TABLE `destek` (
  `destek_id` int(11) NOT NULL,
  `destek_tarih` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `destek_uye` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `destek_baslik` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `destek_uyeoku` int(11) NOT NULL DEFAULT '0',
  `destek_adminoku` int(11) NOT NULL DEFAULT '0',
  `destek_durum` int(11) NOT NULL DEFAULT '0',
  `destek_onem` int(11) NOT NULL DEFAULT '1',
  `destek_departman` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `destek`
--

INSERT INTO `destek` (`destek_id`, `destek_tarih`, `destek_uye`, `destek_baslik`, `destek_uyeoku`, `destek_adminoku`, `destek_durum`, `destek_onem`, `destek_departman`) VALUES
(1, '2020-11-11 13:55:25', '19', 'Ya??anan Sorun ??le ??lgili', 1, 1, 1, 1, 'Teknik Destek'),
(2, '2020-11-11 13:59:10', '19', 'Fatura ??deme Hk.', 1, 1, 0, 1, 'Muhasebe');

-- --------------------------------------------------------

--
-- Table structure for table `destekmesaj`
--

CREATE TABLE `destekmesaj` (
  `destekmesaj_id` int(11) NOT NULL,
  `destekmesaj_tarih` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `destekmesaj_destek` int(11) NOT NULL,
  `destekmesaj_aciklama` longtext COLLATE utf8_turkish_ci NOT NULL,
  `destekmesaj_kim` int(11) NOT NULL,
  `destekmesaj_resim` varchar(255) COLLATE utf8_turkish_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `destekmesaj`
--

INSERT INTO `destekmesaj` (`destekmesaj_id`, `destekmesaj_tarih`, `destekmesaj_destek`, `destekmesaj_aciklama`, `destekmesaj_kim`, `destekmesaj_resim`) VALUES
(1, '2020-11-11 13:55:25', 1, 'Merhaba ya??ad??????m??z sorun ile ilgili buradan ????z??m bulabilir miyiz?', 2, '0'),
(2, '2020-11-11 13:57:43', 1, 'Merhabalar, elbette sorunu iletirseniz yard??mc?? olabiliriz.', 1, '0'),
(3, '2020-11-11 13:59:10', 2, 'Merhabalar fatura ??dedim.', 2, '0'),
(4, '2020-11-11 13:59:38', 2, 'Merhabalar, \r\n??demeniz i??in te??ekk??r ederiz.', 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `duyuru`
--

CREATE TABLE `duyuru` (
  `duyuru_id` int(11) NOT NULL,
  `duyuru_baslik` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `duyuru_detay` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `duyuru_tarih` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `duyuru_durum` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `duyuru`
--

INSERT INTO `duyuru` (`duyuru_id`, `duyuru_baslik`, `duyuru_detay`, `duyuru_tarih`, `duyuru_durum`) VALUES
(1, 'Deneme Duyuru', 'Tam anlam?? ile y??netim paneli kontroll?? geli??mi?? PHP, PDO, HTML5, BOOTSTRAP teknolojisi ile yaz??l??mlar ile site y??netiminin zorlu??unu ya??amay??n keyfini s??r??n. T??m yaz??l??mlar??m??z da standart olarak sunulan sipari?? takip, kolay iade ve ka', '2018-08-14 09:09:54', 1),
(2, 'Deneme Duyuru 2', 'Deneme Duyuru 2 A????klamas??', '2018-08-14 09:09:54', 1),
(3, 'Deneme Ba??l??k Adminden', '<p>Deneme i??erik&nbsp;Adminden</p>', '2018-09-03 10:10:17', 1),
(4, 'Selamlar', '<p>Hoşgeldiniz</p>', '2025-11-07 11:56:37', 1);

-- --------------------------------------------------------

--
-- Table structure for table `eklenti`
--

CREATE TABLE `eklenti` (
  `id` int(11) NOT NULL,
  `ad` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `cinsi` int(11) NOT NULL DEFAULT '0',
  `fiyat` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `aciklama` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `sira` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `eklenti`
--

INSERT INTO `eklenti` (`id`, `ad`, `cinsi`, `fiyat`, `aciklama`, `sira`) VALUES
(6, ' Seo Ayarlar??', 1, '100', 'T??m sayfalar??n meta etiketleri ??zenle haz??rlan??r g??rseller s??k????t??r??l??r. ???? seo tamamlan??r.', 3),
(7, '??zg??n ????erik 5 Adet ', 1, '125', 'Hakk??m??zda, Hizmetler ve Blog vb. gibi ??zg??n i??erik', 4),
(8, 'Banner Tasar??m?? 2 Adet', 1, '125', 'Sekt??r??n??ze uygun banner g??rselleri', 1),
(9, 'Logo Tasar??m??', 1, '75', '??zg??n ve Marka Tesciline Uygun Tasar??m', 2),
(10, '??zg??n ????erik 10 Adet ', 1, '225', 'Hakk??m??zda, Hizmetler ve Blog vb. gibi ??zg??n i??erik', 5),
(11, '??zg??n ????erik 20 Adet ', 1, '400', 'Hakk??m??zda, Hizmetler ve Blog vb. gibi ??zg??n i??erik', 6),
(12, 'SSD 1 Paket', 0, '50', '', 1),
(13, 'SSD 2 Paket', 0, '60', '', 2),
(14, 'SSD 3 Paket', 0, '70', '', 3),
(15, 'SSD 4 Paket', 0, '80', '', 4);

-- --------------------------------------------------------

--
-- Table structure for table `flink`
--

CREATE TABLE `flink` (
  `flink_id` int(11) NOT NULL,
  `flink_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `flink_link` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `flink`
--

INSERT INTO `flink` (`flink_id`, `flink_ad`, `flink_link`) VALUES
(1, 'Dekorasyon ', '#'),
(2, '???? Mimarl??k', '#'),
(3, 'Mobilya Tak??mlar??', '#'),
(4, 'Koltuk Tak??mlar??', '#'),
(5, 'K????e Koltuklar??', '#'),
(6, 'Yemek Odas?? Tak??m??', '#'),
(7, 'Yatak Odas?? Tak??m??', '#'),
(8, 'Salon Tak??m??', '#'),
(9, 'Mutfak Dolaplar??', '#'),
(10, 'Banyo Modelleri', '#'),
(11, 'Salon Dekoru', '#'),
(12, 'Dekoratif Perde', '#'),
(13, 'Yatak Odas?? Modelleri', '#'),
(14, 'Amerikan Mutfak', '#'),
(15, 'Dekoratif Kap?? ', '#'),
(16, 'Gen?? Odas??', '#'),
(17, '??ocuk Odas??', '#'),
(18, 'Mimarl??k', '#');

-- --------------------------------------------------------

--
-- Table structure for table `fmenu`
--

CREATE TABLE `fmenu` (
  `fmenu_id` int(11) NOT NULL,
  `fmenu_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `fmenu_link` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `fmenu_sira` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `fmenu`
--

INSERT INTO `fmenu` (`fmenu_id`, `fmenu_ad`, `fmenu_link`, `fmenu_sira`) VALUES
(2, 'Referanslar', 'referanslar', '2'),
(5, 'Blog', 'blog', '5'),
(6, '??letisim', 'iletisim', '7'),
(7, 'SSS', 'sss', '6'),
(8, '??r??nler', 'urunler', '4');

-- --------------------------------------------------------

--
-- Table structure for table `hesap`
--

CREATE TABLE `hesap` (
  `hesap_id` int(11) NOT NULL,
  `hesap_banka` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `hesap_isim` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `hesap_sube` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `hesap_no` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `hesap_iban` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `hesap`
--

INSERT INTO `hesap` (`hesap_id`, `hesap_banka`, `hesap_isim`, `hesap_sube`, `hesap_no`, `hesap_iban`) VALUES
(1, 'ENPARA (F??NANSBANK)', 'En ??irket ad?? Tic. Ltd.??ti', 'Alt??ntepe/209', '6296911', 'TR38 0006 2000 2090 0006 2969 11 '),
(2, '???? BANKASI', '???? ??irket ad?? Tic. Ltd.??ti', 'Alt??ntepe/209', '6296911', 'TR38 0006 2000 2090 0006 2969 11 ');

-- --------------------------------------------------------

--
-- Table structure for table `hit`
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
-- Dumping data for table `hit`
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
(24, 12, 2021, 1640328798, 5, '::1', 23),
(28, 10, 2025, 1761659008, 15, '172.18.0.1', 24),
(30, 10, 2025, 1761817731, 4, '172.18.0.1', 25),
(2, 11, 2025, 1762114493, 3, '172.18.0.1', 26),
(3, 11, 2025, 1762160547, 9, '172.19.0.1', 27),
(7, 11, 2025, 1762515445, 3, '172.19.0.1', 28),
(12, 11, 2025, 1762945487, 4, '172.19.0.1', 29),
(18, 11, 2025, 1763470191, 6, '172.18.0.1', 30);

-- --------------------------------------------------------

--
-- Table structure for table `hizmetler`
--

CREATE TABLE `hizmetler` (
  `hizmet_id` int(11) NOT NULL,
  `hizmet_baslik` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `hizmet_icerik` longtext COLLATE utf8_turkish_ci,
  `hizmet_resim` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `hizmet_icon` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `hizmet_title` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `hizmet_descr` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `hizmet_keyword` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `hizmet_vitrin` varchar(255) COLLATE utf8_turkish_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `hizmetler`
--

INSERT INTO `hizmetler` (`hizmet_id`, `hizmet_baslik`, `hizmet_icerik`, `hizmet_resim`, `hizmet_icon`, `hizmet_title`, `hizmet_descr`, `hizmet_keyword`, `hizmet_vitrin`) VALUES
(1, 'WEB TASARIM', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p><p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p><p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p><p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p><p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2968724967.jpg', NULL, 'Web Tasar??m Hizmetimiz | Son Yaz??l??m', 'Geli??mi?? kodlama alt yap??s?? ile en g??ncel teknoloji kullanarak rakiplerimizden s??yr??l??p uygun ve modern tasar??mlar sunuyoruz.', 'web tasar??m hizmeti, web site tasar??m??, kurumsal web tasar??m', '1'),
(2, 'SEO ??ALI??MASI', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2636126854.jpg', NULL, 'SEO ??ALI??MASI H??ZMET?? |Son Yaz??l??m', 'G??n??m??z y??ntemlerinde arama motorlar??nda ya??anan g??ncellemeler sonucu seo ??al????malar?? daha profesyonel ad??mlar gerektirmektedir. Profesyonel Seo i??in Elvin Soft\'u tercih edin.', 'Seo ??al????mas??, Arama motorlar??nda y??kselme, seo hizmeti, kurumsal seo', '1'),
(3, 'E T??CARET', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2064924794.jpg', NULL, 'E T??CARET H??ZMETLER?? ', 'T??rkiye\'nin en b??y??k firmalar??n??n kulland?????? alt yap?? ile g??venli kaliteli ve h??zl?? e ticaret sistemleri sadece Elvin Soft\'ta', 'E ticaret, e ticaret sitesi a??, e ticaret sitesi kur', '1'),
(4, 'SOSYAL MEDYA Y??NET??M??', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2574526986.jpg', NULL, 'SOSYAL MEDYA Y??NET??M?? ', 'Sanal platformda en ??ok ki??iye veya m????teriye ula??mak i??in en etkili reklam y??ntemi olan sosyal medyan??z?? profesyonel ekibimize devredebilirsiniz.', 'Sosyal medya y??netimi, sosyal medya pazarlama, sosyal medya e ticaret', '1'),
(5, ' MOB??L UYGULAMA ', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2598425770.jpg', NULL, ' MOB??L UYGULAMA YAZILIM GEL????T??RME ', 'G??n??m??z ??a????nda mobil uygulamalar en kullan????l?? ve ki??ilere ula??man??n en kolay yoludur. Bu mobil uygulamalar??n??z?? Elvin Soft olarak projelendirmek ve yay??na almak isteriz.', 'Mobil uygulama yapma, mobil uygulama yaz??l??m??, mobil uygulama', '1'),
(6, 'ADWORDS ??ALI??MASI', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2399928939.jpg', NULL, 'ADWORDS ??ALI??MA H??ZMET?? ', 'Adwords reklam ??al????malar?? ??zen, dikkat ve profesyonelli??in yan?? s??ra uzun ve kaliteli bir tecr??be ister t??m bu ??zelliklere sahip olan Elvin Soft ile e??siz Adwords ??al????mas?? i??in bizi aray??n.', 'Adwords ??al????mas??, adwords reklam', '1'),
(7, 'REKLAM Y??NET??M??', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2176926316.jpg', NULL, 'D??J??TAL REKLAM Y??NET??M?? ', 'Dijital reklam y??netimi olarak bilinen en ??ok kitleye ula??abilen reklam ??e??idi olan reklam y??netiminizi alan??nda uzman ekibimize b??rakman??z sat????lar??n??z?? olumlu etkileyecektir.', 'reklam y??netimi, dijital reklam y??netimi, reklam', '1'),
(8, 'KURUMSAL K??ML??K', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/3142722828.jpg', NULL, 'KURUMSAL K??ML??K H??ZMET?? ', 'Kurumsal firmalar??n en b??y??k elden reklam ve kaliteyi ??n plana ????kartabilmek i??in mutlaka kurumsal kimlik ??al????mas?? yapt??rmas?? gerekir. Kurumsal Kimlik Elvin Soft ayr??cal?????? ile.', 'kurumsal kimlik, e??antiyon, kurumsal kimlik ??al????mas??', '1'),
(9, 'PROJE GEL????T??RME', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/3054327046.jpg', NULL, 'PROJE GEL????T??RME H??ZMET?? ', 'Hali haz??rda yada akl??n??zda olan her t??rl?? projeyi yeniden yap??land??rma veya geli??tirmeye y??nelik profesyonel ve y??n verici ??al????man??z?? Elvin Soft ayr??cal?????? ya??ay??n.', 'proje geli??tirme, yaz??l??m g??ncelleme, yaz??l??m geli??tirme', '1');

-- --------------------------------------------------------

--
-- Table structure for table `il`
--

CREATE TABLE `il` (
  `id` int(2) NOT NULL,
  `il_adi` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `il_plaka` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `il`
--

INSERT INTO `il` (`id`, `il_adi`, `il_plaka`) VALUES
(1, '??STANBUL', 34),
(2, 'ANKARA', 6),
(3, '??ZM??R', 35),
(4, 'BURSA', 16),
(5, 'ADANA', 1),
(6, 'ADIYAMAN', 2),
(7, 'AFYONKARAH??SAR', 3),
(8, 'A??RI', 4),
(9, 'AKSARAY', 68),
(10, 'AMASYA', 5),
(11, 'ANTALYA', 7),
(12, 'ARDAHAN', 75),
(13, 'ARTV??N', 8),
(14, 'AYDIN', 9),
(15, 'BALIKES??R', 10),
(16, 'BARTIN', 74),
(17, 'BATMAN', 72),
(18, 'BAYBURT', 69),
(19, 'B??LEC??K', 11),
(20, 'B??NG??L', 12),
(21, 'B??TL??S', 13),
(22, 'BOLU', 14),
(23, 'BURDUR', 15),
(24, '??ANAKKALE', 17),
(25, '??ANKIRI', 18),
(26, '??ORUM', 19),
(27, 'DEN??ZL??', 20),
(28, 'D??YARBAKIR', 21),
(29, 'KOCAEL??', 41),
(30, 'KONYA', 42),
(31, 'K??TAHYA', 43),
(32, 'MALATYA', 44),
(33, 'MAN??SA', 45),
(34, 'MARD??N', 47),
(35, 'MERS??N', 33),
(36, 'MU??LA', 48),
(37, 'MU??', 49),
(38, 'NEV??EH??R', 50),
(39, 'N????DE', 51),
(40, 'ORDU', 52),
(41, 'OSMAN??YE', 80),
(42, 'R??ZE', 53),
(43, 'SAKARYA', 54),
(44, 'SAMSUN', 55),
(45, 'S????RT', 56),
(46, 'S??NOP', 57),
(47, '??IRNAK', 73),
(48, 'S??VAS', 58),
(49, 'TEK??RDA??', 59),
(50, 'TOKAT', 60),
(51, 'TRABZON', 61),
(52, 'TUNCEL??', 62),
(53, '??ANLIURFA', 63),
(54, 'U??AK', 64),
(55, 'VAN', 65),
(56, 'YALOVA', 77),
(57, 'YOZGAT', 66),
(58, 'ZONGULDAK', 67),
(59, 'D??ZCE', 81),
(60, 'ED??RNE', 22),
(61, 'ELAZI??', 23),
(62, 'ERZ??NCAN', 24),
(63, 'ERZURUM', 25),
(64, 'ESK????EH??R', 26),
(65, 'GAZ??ANTEP', 27),
(66, 'G??RESUN', 28),
(67, 'G??M????HANE', 29),
(68, 'HAKKAR??', 30),
(69, 'HATAY', 31),
(70, 'I??DIR', 76),
(71, 'ISPARTA', 32),
(72, 'KAHRAMANMARA??', 46),
(73, 'KARAB??K', 78),
(74, 'KARAMAN', 70),
(75, 'KARS', 36),
(76, 'KASTAMONU', 37),
(77, 'KAYSER??', 38),
(78, 'K??L??S', 79),
(79, 'KIRIKKALE', 71),
(80, 'KIRKLAREL??', 39),
(81, 'KIR??EH??R', 40);

-- --------------------------------------------------------

--
-- Table structure for table `iletisim`
--

CREATE TABLE `iletisim` (
  `iletisim_id` int(11) NOT NULL,
  `iletisim_tarih` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `iletisim_isim` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `iletisim_mail` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `iletisim_mesaj` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `iletisim`
--

INSERT INTO `iletisim` (`iletisim_id`, `iletisim_tarih`, `iletisim_isim`, `iletisim_mail`, `iletisim_mesaj`) VALUES
(1, '2018-01-25 10:59:37', 'Ahmet Aksu', 'ahmet@hotmail.com', 'Merhaba web sitesi yaz??l??m?? istiyorum.'),
(2, '2018-01-25 10:59:39', 'Kemal Demir', 'ahmet@hotmail.com', 'Merhaba web sitesi yaz??l??m?? istiyorum.');

-- --------------------------------------------------------

--
-- Table structure for table `kategoriler`
--

CREATE TABLE `kategoriler` (
  `kategori_id` int(11) NOT NULL,
  `kategori_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_sira` int(11) NOT NULL,
  `kategori_title` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_descr` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_keyword` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `kategoriler`
--

INSERT INTO `kategoriler` (`kategori_id`, `kategori_ad`, `kategori_sira`, `kategori_title`, `kategori_descr`, `kategori_keyword`) VALUES
(1, 'Kurumsal', 1, 'Kurumsal', 'Kurumsal', 'Kurumsal'),
(3, '??ilingir', 3, '??ilingir', '??ilingir', '??ilingir'),
(4, 'Nakliyat', 4, 'Nakliyat', 'Nakliyat', 'Nakliyat'),
(5, 'Avukat / Hukuk B??rosu', 2, 'Avukat / Hukuk B??rosu', 'Avukat / Hukuk B??rosu', 'Avukat / Hukuk B??rosu'),
(6, '??n??aat / M??teahhit', 8, '??n??aat / M??teahhit', '??n??aat / M??teahhit', '??n??aat / M??teahhit'),
(7, '??la??lama Firmas??', 6, '??la??lama Firmas??', '??la??lama Firmas??', '??la??lama Firmas??'),
(8, 'Temizlik Firmas??', 7, 'Temizlik Firmas??', 'Temizlik Firmas??', 'Temizlik Firmas??'),
(9, 'Tek ??r??n', 9, 'Tek ??r??n', 'Tek ??r??n', 'Tek ??r??n'),
(10, 'Spor Salonu', 10, 'Spor Salonu', 'Spor Salonu', 'Spor Salonu'),
(11, 'Sa??l??k / Hastane', 11, 'Sa??l??k / Hastane', 'Sa??l??k / Hastane', 'Sa??l??k / Hastane'),
(12, 'Restaurant / Cafe', 0, 'Restaurant / Cafe', 'Restaurant / Cafe', 'Restaurant / Cafe');

-- --------------------------------------------------------

--
-- Table structure for table `kategorilerb`
--

CREATE TABLE `kategorilerb` (
  `kategori_id` int(11) NOT NULL,
  `kategori_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_sira` int(11) NOT NULL,
  `kategori_title` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_descr` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_keyword` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `kategorilerb`
--

INSERT INTO `kategorilerb` (`kategori_id`, `kategori_ad`, `kategori_sira`, `kategori_title`, `kategori_descr`, `kategori_keyword`) VALUES
(2, 'S??n??rs??z Blog Kategorisi 2', 2, 'S??n??rs??z Blog Kategorisi 2', 'S??n??rs??z Blog Kategorisi 2', 'S??n??rs??z Blog Kategorisi 2'),
(3, 'S??n??rs??z Blog Kategorisi 3', 3, 'S??n??rs??z Blog Kategorisi 3', 'S??n??rs??z Blog Kategorisi 3', 'S??n??rs??z Blog Kategorisi 3'),
(5, 'S??n??rs??z Blog Kategorisi 1', 1, 'S??n??rs??z Blog Kategorisi 1', 'S??n??rs??z Blog Kategorisi 1', 'S??n??rs??z Blog Kategorisi 1');

-- --------------------------------------------------------

--
-- Table structure for table `kategoripaket`
--

CREATE TABLE `kategoripaket` (
  `kategori_id` int(11) NOT NULL,
  `kategori_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_sira` int(11) NOT NULL,
  `kategori_title` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_descr` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_keyword` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `vitrin` int(11) DEFAULT '0',
  `resim` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `kategoripaket`
--

INSERT INTO `kategoripaket` (`kategori_id`, `kategori_ad`, `kategori_sira`, `kategori_title`, `kategori_descr`, `kategori_keyword`, `vitrin`, `resim`) VALUES
(1, 'E-Ticaret ', 1, 'Seo Hizmeti', 'Seo Hizmeti', 'Seo Hizmeti', 1, 'assets/img/genel/26170.jpg'),
(3, 'Kurumsal', 2, '????erik Hizmeti', '????erik Hizmeti', '????erik Hizmeti', 1, 'assets/img/genel/22745.jpg'),
(4, 'Kişisel Portföy', 3, 'Tasar??m Hizmeti', 'Tasar??m Hizmeti', 'Tasar??m Hizmeti', 1, 'assets/img/genel/24766.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kategoriproje`
--

CREATE TABLE `kategoriproje` (
  `kategori_id` int(11) NOT NULL,
  `kategori_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_sira` int(11) NOT NULL,
  `kategori_title` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_descr` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_keyword` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `vitrin` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `kategoriproje`
--

INSERT INTO `kategoriproje` (`kategori_id`, `kategori_ad`, `kategori_sira`, `kategori_title`, `kategori_descr`, `kategori_keyword`, `vitrin`) VALUES
(1, 'Kurumsal Projeler', 1, 'Kurumsal Projeler', 'Kurumsal Projeler', 'Kurumsal Projeler', 1),
(3, 'Tamamlanan Projeler', 2, 'Tamamlanan Projeler', 'Tamamlanan Projeler', 'Tamamlanan Projeler', 1),
(4, 'Devam Eden Projeler', 3, '1', '1', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kredi_karti_odemesi`
--

CREATE TABLE `kredi_karti_odemesi` (
  `id` int(11) NOT NULL,
  `siparis_id` int(11) NOT NULL,
  `odeme_kodu` varchar(255) NOT NULL,
  `odeme_tarih` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kredi_karti_odemesi`
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
-- Table structure for table `kullanici`
--

CREATE TABLE `kullanici` (
  `kullanici_id` int(11) NOT NULL,
  `kullanici_adi` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_pass` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_adsoyad` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_resim` varchar(500) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `kullanici`
--

INSERT INTO `kullanici` (`kullanici_id`, `kullanici_adi`, `kullanici_pass`, `kullanici_adsoyad`, `kullanici_resim`) VALUES
(0, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Velihan Özge', 'assets/img/genel/22817.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `mail`
--

CREATE TABLE `mail` (
  `mail_id` int(11) NOT NULL,
  `mail_user` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `mail_host` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `mail_port` int(250) NOT NULL,
  `mail_pass` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `mail_secure` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `mail_sender` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `mail_name` longtext COLLATE utf8_turkish_ci NOT NULL,
  `mail_bildirim` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `mail`
--

INSERT INTO `mail` (`mail_id`, `mail_user`, `mail_host`, `mail_port`, `mail_pass`, `mail_secure`, `mail_sender`, `mail_name`, `mail_bildirim`) VALUES
(0, 'info@nextify.tr', 'smtp.yandex.com.tr', 465, 'xxxx', 'ssl', 'bilgi@example.com', 'Nextify.tr', '');

-- --------------------------------------------------------

--
-- Table structure for table `markalar`
--

CREATE TABLE `markalar` (
  `hizmet_id` int(11) NOT NULL,
  `hizmet_baslik` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `hizmet_icerik` longtext COLLATE utf8_turkish_ci NOT NULL,
  `hizmet_resim` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `hizmet_icon` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `hizmet_title` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `hizmet_descr` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `hizmet_keyword` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `hizmet_vitrin` varchar(255) COLLATE utf8_turkish_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `markalar`
--

INSERT INTO `markalar` (`hizmet_id`, `hizmet_baslik`, `hizmet_icerik`, `hizmet_resim`, `hizmet_icon`, `hizmet_title`, `hizmet_descr`, `hizmet_keyword`, `hizmet_vitrin`) VALUES
(1, 'Maktek Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/3037931371.jpg', '', 'Maktek Kombi Servisi', 'Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa', 'Maktek Kombi Servisi', ''),
(11, 'Baykan Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2906928423.jpg', '', 'Baykan Kombi Servisi', 'Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus.', 'Baykan Kombi Servisi', ''),
(12, 'Alarko Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2611229008.jpg', '', 'Alarko Kombi Servisi', 'Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus.', 'Alarko Kombi Servisi', ''),
(37, '??mmergas Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/3037931371.jpg', '', '??mmergas Kombi Servisi', 'Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa', 'Maktek Kombi Servisi', ''),
(38, 'Ferroli Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2906928423.jpg', '', 'Ferroli Kombi Servisi', 'Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus.', 'Ferroli Kombi Servisi', ''),
(39, 'Eca Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2611229008.jpg', '', 'Eca Kombi Servisi', 'Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus.', 'Eca Kombi Servisi', ''),
(40, 'Beko Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/3037931371.jpg', '', 'Beko Kombi Servisi', 'Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa', 'Beko Kombi Servisi', ''),
(41, 'Protherm Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2906928423.jpg', '', 'Protherm Kombi Servisi', 'Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus.', 'Protherm Kombi Servisi', ''),
(42, 'Demird??k??m Kombi Servisi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum sem ut tellus accumsan, eget ornare urna rutrum. Aenean mattis, tellus et sodales faucibus, diam mi imperdiet nulla, sit amet elementum dui dui facilisis nisi. Duis elementum, eros ac vestibulum tempus, velit justo ultricies leo, sed sagittis nunc diam eu urna. Donec luctus velit arcu, vel tempor nibh consectetur non. Sed fringilla lectus vitae ipsum varius rhoncus. Ut accumsan congue hendrerit. Sed venenatis pulvinar ex at tincidunt.</p>\r\n\r\n<p>Aliquam elementum libero quis mauris vulputate, ac dapibus sem accumsan. Vivamus in porttitor enim. Aliquam eu sapien in felis cursus condimentum. Fusce non malesuada enim. Integer rutrum, leo et blandit iaculis, justo nibh eleifend massa, eu aliquet mi libero in velit. Aenean vestibulum metus nec diam iaculis, vel egestas orci vestibulum. Pellentesque massa leo, maximus id aliquet luctus, tempor ac tellus. Quisque in commodo tortor. Vivamus aliquet mi placerat mattis sagittis. Ut semper augue a lectus dapibus, eget ultrices orci gravida. Mauris nibh ante, iaculis vitae orci eu, suscipit pretium nisl. Vivamus nulla leo, imperdiet nec arcu sit amet, placerat fringilla sem. Phasellus id metus non felis lacinia luctus in vitae ipsum. Cras non velit vel risus bibendum mollis nec eget quam. Aenean cursus elit nec mi luctus molestie.</p>\r\n\r\n<p>Nunc eget accumsan tellus. Phasellus in libero in ante viverra malesuada. Proin a commodo quam, vitae tincidunt sapien. Fusce id mi a dui varius convallis eu sed enim. In tempus est sit amet sapien pellentesque dapibus. Vestibulum sem neque, viverra sed vestibulum vel, tincidunt dignissim dolor. In eu bibendum mi. Aenean scelerisque libero sit amet iaculis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur tincidunt vehicula enim, quis pretium ante egestas ut. Donec nec vulputate tortor. Donec felis leo, tincidunt et tellus rutrum, fermentum consectetur nisl. Nunc sodales dolor eu massa condimentum hendrerit. Suspendisse interdum pretium odio id laoreet.</p>\r\n\r\n<p>Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus. Mauris posuere lectus eu lectus porttitor luctus. Nulla magna diam, commodo nec sagittis a, mollis non dolor. Nunc eleifend, nunc vitae fermentum sollicitudin, mi ante facilisis leo, in varius lectus eros lacinia urna. Morbi lobortis facilisis tellus. Nulla sollicitudin massa vitae libero faucibus sollicitudin. Vestibulum varius sit amet libero in vestibulum.</p>\r\n\r\n<p>Mauris lobortis non magna sed finibus. Mauris facilisis, leo quis cursus dignissim, arcu velit egestas massa, sit amet molestie sapien mi a odio. Vivamus nulla ipsum, fermentum ut ullamcorper non, tristique eu est. Suspendisse suscipit tellus lacus, sed laoreet tortor luctus eu. Phasellus ultricies arcu at viverra lobortis. Suspendisse potenti. Maecenas et consequat ex. Vivamus mollis nulla in lorem accumsan, aliquam congue urna vestibulum. Vestibulum pellentesque turpis tempus orci gravida semper. Fusce pretium molestie vulputate. Nam sit amet dolor et est dapibus molestie. Fusce fringilla porttitor orci sed volutpat. Pellentesque semper arcu eget felis gravida blandit. Sed nec porttitor arcu.</p>\r\n', 'assets/img/hizmetler/2611229008.jpg', '', 'Demird??k??m Kombi Servisi', 'Vivamus iaculis dignissim massa, a scelerisque urna tristique in. Nunc ut diam non lectus feugiat efficitur vel eget lacus.', 'Demird??k??m Kombi Servisi', ''),
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
-- Table structure for table `mesajlar`
--

CREATE TABLE `mesajlar` (
  `mesaj_id` int(11) NOT NULL,
  `mesaj_tarih` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `mesaj_ad` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `mesaj_tel` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `mesaj_mail` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `mesaj_icerik` longtext COLLATE utf8_turkish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `mesajlar`
--

INSERT INTO `mesajlar` (`mesaj_id`, `mesaj_tarih`, `mesaj_ad`, `mesaj_tel`, `mesaj_mail`, `mesaj_icerik`) VALUES
(14, '2020-11-11 14:44:50', 'Ozan ??z', NULL, 'webkozik@gmail.com', 'Deneme ??leti??im formu mesaj??d??r.'),
(15, '2020-12-04 10:12:49', 'Ozan ??z', NULL, 'webkozik@gmail.com', 'dsagag'),
(16, '2020-12-04 12:32:00', 'Ozan ??z', NULL, 'webkozik@gmail.com', 'adsgdag'),
(17, '2020-12-04 12:32:45', 'Ozan ??z', NULL, 'webkozik@gmail.com', 'asdgdag'),
(18, '2020-12-04 12:37:44', 'Ozan ??z', NULL, 'webkozik@gmail.com', 'zgsdgsdg'),
(19, '2020-12-04 12:38:45', 'Ozan ??z', NULL, 'webkozik@gmail.com', 'safadsg'),
(20, '2020-12-04 12:40:24', 'Ozan ??z', NULL, 'webkozik@gmail.com', 'adgdag'),
(21, '2020-12-04 12:41:23', 'Ozan ??z', NULL, 'webkozik@gmail.com', 'adsgdag');

-- --------------------------------------------------------

--
-- Table structure for table `meta`
--

CREATE TABLE `meta` (
  `meta_id` int(11) NOT NULL,
  `meta_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `meta_descr` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `meta`
--

INSERT INTO `meta` (`meta_id`, `meta_ad`, `meta_title`, `meta_descr`, `meta_keyword`) VALUES
(1, '??r??nler', '??r??nler | Nextify', 'Geli??mi?? Nextify scriptleri ile full admin kontroll?? PHP PDO HTML 5 yaz??l??mlar?? buradan inceleyebilir ve sat??n alabilirsiniz.', 'Nextify'),
(2, 'Hizmetler', 'Hizmetler | Nextify', 'Geli??mi?? PHP PDO geli??mi?? admin panelli Nextify i??in Hemen hizmetlerimizi inceleyiniz.', 'Nextify'),
(3, 'Projeler', 'Projeler | Nextify', 'Nextify i??in geli??tirdi??imiz t??m projeleri inceleyebilirsiniz.', 'Nextify yaz??l??m?? projeleri'),
(4, 'Blog', 'Blog | Nextify', 'Nextify ile ilgili blog, haber ve duyuru payla????m?? sayfas??nda size uygun kampanya g??ncel duyurular?? takip edin.', 'Nextify blog sayfas??,'),
(5, 'S??k Sorulan Sorular', 'S??k Sorulan Sorular | Nextify', 'S??k Sorulan Sorular Nextify sat??n al??rken ve almadan ??nce akl??n??za tak??lan sorular?? yan??tl??yoruz.', 'S??k Sorulan Sorular , Nextify  s??k sorulan sorular'),
(8, '??leti??im', '??LET??????M | Nextify', 'T??rkiye\'de ilk ve tek en kapsaml?? ve geli??mi?? son sitem Nextify i??in hemen ileti??ime ge??in.', 'Nextify sipari?? sayfas??'),
(9, '??ye Ol', '??ye Ol | Nextify', '??ye Ol Nextify yaz??l??m?? sat??n almak i??in ??ye Ol.', '??ye Ol'),
(10, '??ye Giri??i', '??ye Giri??i | Nextify', '??ye Giri??i Nextify yaz??l??m?? sat??n almak i??in ??ye Giri??i yap.', '??ye Giri??i'),
(11, 'Hesab??m', 'Hesab??m | Nextify', 'Hesab??m TNextify sat??n almak i??in sat??n al.', 'Hesab??m'),
(12, 'Paketler', 'Paketler | Nextify', 'Geli??mi?? Nextify ile full admin kontroll?? PHP PDO HTML 5 yaz??l??mlar?? buradan inceleyebilir ve sat??n alabilirsiniz.', 'tek ??r??n scripti, tek ??r??n yaz??l??m??, single product'),
(13, '??ifremi Unuttum', '??ifremi Unuttum | Nextify', '??ifremi Unuttum TNextify sat??n almak i??in sat??n al.', '??ifremi Unuttum'),
(14, 'Sepetim', 'Sepetim | Nextify', 'Sepetim TNextify sat??n almak i??in sat??n al.', 'Sepetim'),
(15, 'Referanslar', 'Referanslar | Nextify', 'Referanslar Nextify sat??n almak i??in sat??n al.', 'Referanslar ');

-- --------------------------------------------------------

--
-- Table structure for table `motor`
--

CREATE TABLE `motor` (
  `motor_id` int(11) NOT NULL,
  `motor_analitik` longtext COLLATE utf8_turkish_ci NOT NULL,
  `motor_metrika` longtext COLLATE utf8_turkish_ci NOT NULL,
  `motor_gonay` longtext COLLATE utf8_turkish_ci NOT NULL,
  `motor_yonay` longtext COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `motor`
--

INSERT INTO `motor` (`motor_id`, `motor_analitik`, `motor_metrika`, `motor_gonay`, `motor_yonay`) VALUES
(1, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `odeme`
--

CREATE TABLE `odeme` (
  `odeme_id` int(11) NOT NULL,
  `odeme_adi` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `odeme_durum` int(11) NOT NULL,
  `odeme_not` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `odeme`
--

INSERT INTO `odeme` (`odeme_id`, `odeme_adi`, `odeme_durum`, `odeme_not`) VALUES
(1, 'Havale ile ??de', 1, '??deme i??lemi s??ras??nda l??tfen sipari?? numaran??z?? belirtiniz.'),
(2, 'Kap??da ??de', 1, 'Kap??da ??ster Kredi kart?? ister nakit ??deyebilirsiniz.'),
(3, 'Kredi Kart??', 1, 'Kredi kart?? ile online ??deme');

-- --------------------------------------------------------

--
-- Table structure for table `odemebildirim`
--

CREATE TABLE `odemebildirim` (
  `id` int(11) NOT NULL,
  `tarih` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `siparis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `omenu`
--

CREATE TABLE `omenu` (
  `omenu_id` int(11) NOT NULL,
  `omenu_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `omenu_ust` int(11) NOT NULL DEFAULT '0',
  `omenu_link` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `omenu_sira` int(11) NOT NULL,
  `omenu_durum` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `omenu`
--

INSERT INTO `omenu` (`omenu_id`, `omenu_ad`, `omenu_ust`, `omenu_link`, `omenu_sira`, `omenu_durum`) VALUES
(71, 'H??ZMETLER', 0, 'hizmetler', 2, 71),
(73, 'SAYFALAR', 0, '#', 1, 73),
(74, 'PAKETLER', 0, '#', 4, 74),
(76, '??ptal ve ??ade ??artlar??', 73, 'sayfa-iptal-ve-iade-sartlari-4', 3, 73),
(79, 'WEB TASARIM', 71, 'hizmet-web-tasarim-1', 1, 71),
(80, 'SEO ??ALI??MASI', 71, 'hizmet-seo-calismasi-2', 2, 71),
(81, 'E T??CARET', 71, 'hizmet-e-ticaret-3', 3, 71),
(82, 'SOSYAL MEDYA Y??NET??M??', 71, 'hizmet-sosyal-medya-yonetimi-4', 4, 71),
(83, 'MOB??L UYGULAMA', 71, 'hizmet-mobil-uygulama-5', 5, 71),
(84, 'ADWORDS ??ALI??MASI', 71, 'hizmet-adwords-calismasi-6', 6, 71),
(85, 'REKLAM Y??NET??M??', 71, 'hizmet-reklam-yonetimi-7', 8, 71),
(86, 'KURUMSAL K??ML??K', 71, 'hizmet-kurumsal-kimlik-8', 9, 71),
(87, 'PROJE GEL????T??RME', 71, 'hizmet-proje-gelistirme-9', 9, 71),
(98, 'Mesafeli Sat???? S??zle??mesi', 73, 'sayfa-mesafeli-satis-sozlesmesi-6', 3, 73),
(99, '????erik Hizmeti', 74, 'paket-icerik-hizmeti-3', 3, 74),
(100, 'Seo Hizmeti', 74, 'paket-seo-hizmeti-1', 1, 74),
(101, 'Tasar??m Hizmeti', 74, 'paket-tasarim-hizmeti-4', 2, 74),
(103, 'Hakk??m??zda', 73, 'sayfa-hakkimizda-1', 1, 73),
(104, 'T??m Hizmetlerimiz', 71, 'hizmetler', 25, 71),
(105, 'Banka Hesaplarimiz', 73, 'banka-hesaplarimiz', 3, 73),
(106, 'BLOG', 0, 'blog', 6, 0),
(107, '??LET??????M', 0, 'iletisim', 7, 0),
(108, 'SSS', 0, 'sss', 5, 0),
(109, 'T??M ??R??NLER', 0, 'urunler', 1, 0),
(110, 'T??m Paketler', 74, 'paketler', 4, 74);

-- --------------------------------------------------------

--
-- Table structure for table `paytr`
--

CREATE TABLE `paytr` (
  `paytr_id` int(11) NOT NULL,
  `paytr_magaza` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `paytr_key` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `paytr_salt` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `paytr`
--

INSERT INTO `paytr` (`paytr_id`, `paytr_magaza`, `paytr_key`, `paytr_salt`) VALUES
(1, '144319', 'z5U6rbsYeoeUG4sq', 'UKwD99QjWaXH5pn2');

-- --------------------------------------------------------

--
-- Table structure for table `projeler`
--

CREATE TABLE `projeler` (
  `proje_id` int(11) NOT NULL,
  `proje_baslik` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `proje_resim` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `proje_icerik` varchar(2999) COLLATE utf8_turkish_ci DEFAULT NULL,
  `proje_title` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `proje_descr` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `proje_keyword` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `proje_vitrin` int(11) DEFAULT '0',
  `kategori` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `projeler`
--

INSERT INTO `projeler` (`proje_id`, `proje_baslik`, `proje_resim`, `proje_icerik`, `proje_title`, `proje_descr`, `proje_keyword`, `proje_vitrin`, `kategori`) VALUES
(113, 'Tamirci Firma Sitesi', 'assets/img/projeler/2393422889.jpg', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\"><span open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Fusce congue rhoncus lectus, ultricies suscipit diam gravida non. Etiam consectetur consequat pulvinar.<font color=\"#0000ff\">??Phasellus nisl arcu</font>, blandit varius ultrices id, interdum a ante. Nulla facilisi. Integer faucibus mauris magna, sit amet fermentum risus feugiat quis. Phasellus sed mauris at??<u>nulla varius consectetur</u>. Integer non tortor quis sapien accumsan tristique. Nunc pharetra nunc non metus porta, non mollis mi suscipit. Sed sagittis quis dui sit amet imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec et enim in ex sagittis lacinia sed sed ante. Integer quis tortor eu sem facilisis sagittis sit amet at massa.??</span><font face=\"Arial Black\">Sed congue ut mi vitae</font><font face=\"Open Sans, Arial, sans-serif\">??consequat.</font></p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Aliquam imperdiet, dui a semper ultrices, odio odio semper est, sed lobortis velit mauris sit amet est. Morbi elementum ligula et urna vulputate finibus. Morbi dapibus lorem id quam iaculis, eget iaculis urna pharetra. Vivamus sodales mi diam, quis faucibus diam luctus id.??<font color=\"#ff0000\">Pellentesque habitant</font>??morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur non nisi eu velit aliquet pellentesque. Duis facilisis tortor in sagittis consectetur. Quisque dolor ante, ullamcorper a blandit elementum, consectetur scelerisque ante. Morbi posuere ligula non auctor molestie. Fusce non metus elementum, finibus magna sed, sagittis ex. Curabitur fermentum nunc mattis consequat faucibus. Donec dignissim eros erat, eu accumsan felis finibus id. Nulla posuere, nibh in efficitur tempus, neque ante placerat turpis, id dictum augue arcu a enim.</p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Integer leo turpis, aliquam sed pretium lacinia,??elementum non??augue. Phasellus lobortis risus facilisis mi vestibulum congue. Suspendisse quis lorem eget sapien tincidunt lacinia posuere ut nunc. Integer hendrerit libero lorem, et lobortis quam pellentesque eu. Aenean dapibus efficitur tellus, sit amet elementum tellus. Curabitur scelerisque felis quis ultricies interdum. Praesent lacus nunc, dignissim id nisi sit amet, interdum gravida neque. Integer eu lacus leo. Morbi mattis leo??<font color=\"#104a5a\">a leo luctus</font>,??ullamcorper??tempus ex porta. Aenean auctor massa eget vulputate convallis. Suspendisse pellentesque sem in neque consequat, vel lobortis libero aliquam. Vivamus nibh nisi, laoreet nec ornare nec, ultricies id lectus.<u>??</u></p>', 'Tamirci Firma Sitesi', 'Tamirci Firma Sitesi', 'Tamirci Firma Sitesi', 1, 4),
(120, 'Hastane Proje Tasar??m??', 'assets/img/projeler/2393422889.jpg', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\"><span open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Fusce congue rhoncus lectus, ultricies suscipit diam gravida non. Etiam consectetur consequat pulvinar.<font color=\"#0000ff\">??Phasellus nisl arcu</font>, blandit varius ultrices id, interdum a ante. Nulla facilisi. Integer faucibus mauris magna, sit amet fermentum risus feugiat quis. Phasellus sed mauris at??<u>nulla varius consectetur</u>. Integer non tortor quis sapien accumsan tristique. Nunc pharetra nunc non metus porta, non mollis mi suscipit. Sed sagittis quis dui sit amet imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec et enim in ex sagittis lacinia sed sed ante. Integer quis tortor eu sem facilisis sagittis sit amet at massa.??</span><font face=\"Arial Black\">Sed congue ut mi vitae</font><font face=\"Open Sans, Arial, sans-serif\">??consequat.</font></p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Aliquam imperdiet, dui a semper ultrices, odio odio semper est, sed lobortis velit mauris sit amet est. Morbi elementum ligula et urna vulputate finibus. Morbi dapibus lorem id quam iaculis, eget iaculis urna pharetra. Vivamus sodales mi diam, quis faucibus diam luctus id.??<font color=\"#ff0000\">Pellentesque habitant</font>??morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur non nisi eu velit aliquet pellentesque. Duis facilisis tortor in sagittis consectetur. Quisque dolor ante, ullamcorper a blandit elementum, consectetur scelerisque ante. Morbi posuere ligula non auctor molestie. Fusce non metus elementum, finibus magna sed, sagittis ex. Curabitur fermentum nunc mattis consequat faucibus. Donec dignissim eros erat, eu accumsan felis finibus id. Nulla posuere, nibh in efficitur tempus, neque ante placerat turpis, id dictum augue arcu a enim.</p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Integer leo turpis, aliquam sed pretium lacinia,??elementum non??augue. Phasellus lobortis risus facilisis mi vestibulum congue. Suspendisse quis lorem eget sapien tincidunt lacinia posuere ut nunc. Integer hendrerit libero lorem, et lobortis quam pellentesque eu. Aenean dapibus efficitur tellus, sit amet elementum tellus. Curabitur scelerisque felis quis ultricies interdum. Praesent lacus nunc, dignissim id nisi sit amet, interdum gravida neque. Integer eu lacus leo. Morbi mattis leo??<font color=\"#104a5a\">a leo luctus</font>,??ullamcorper??tempus ex porta. Aenean auctor massa eget vulputate convallis. Suspendisse pellentesque sem in neque consequat, vel lobortis libero aliquam. Vivamus nibh nisi, laoreet nec ornare nec, ultricies id lectus.<u>??</u></p>', 'Hastane Proje Tasar??m??', 'Hastane Proje Tasar??m??', 'Hastane Proje Tasar??m??', 1, 4),
(121, 'Vak??f Web Site Yaz??l??m Projesi', 'assets/img/projeler/2393422889.jpg', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\"><span style=\"font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Fusce congue rhoncus lectus, ultricies suscipit diam gravida non. Etiam consectetur consequat pulvinar.<font color=\"#0000ff\"> Phasellus nisl arcu</font>, blandit varius ultrices id, interdum a ante. Nulla facilisi. Integer faucibus mauris magna, sit amet fermentum risus feugiat quis. Phasellus sed mauris at <u>nulla varius consectetur</u>. Integer non tortor quis sapien accumsan tristique. Nunc pharetra nunc non metus porta, non mollis mi suscipit. Sed sagittis quis dui sit amet imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec et enim in ex sagittis lacinia sed sed ante. Integer quis tortor eu sem facilisis sagittis sit amet at massa. </span><font face=\"Arial Black\">Sed congue ut mi vitae</font><font face=\"Open Sans, Arial, sans-serif\"> consequat.</font></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Aliquam imperdiet, dui a semper ultrices, odio odio semper est, sed lobortis velit mauris sit amet est. Morbi elementum ligula et urna vulputate finibus. Morbi dapibus lorem id quam iaculis, eget iaculis urna pharetra. Vivamus sodales mi diam, quis faucibus diam luctus id. <font color=\"#ff0000\">Pellentesque habitant</font> morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur non nisi eu velit aliquet pellentesque. Duis facilisis tortor in sagittis consectetur. Quisque dolor ante, ullamcorper a blandit elementum, consectetur scelerisque ante. Morbi posuere ligula non auctor molestie. Fusce non metus elementum, finibus magna sed, sagittis ex. Curabitur fermentum nunc mattis consequat faucibus. Donec dignissim eros erat, eu accumsan felis finibus id. Nulla posuere, nibh in efficitur tempus, neque ante placerat turpis, id dictum augue arcu a enim.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Integer leo turpis, aliquam sed pretium lacinia, <b>elementum non</b> augue. Phasellus lobortis risus facilisis mi vestibulum congue. Suspendisse quis lorem eget sapien tincidunt lacinia posuere ut nunc. Integer hendrerit libero lorem, et lobortis quam pellentesque eu. Aenean dapibus efficitur tellus, sit amet elementum tellus. Curabitur scelerisque felis quis ultricies interdum. Praesent lacus nunc, dignissim id nisi sit amet, interdum gravida neque. Integer eu lacus leo. Morbi mattis leo <font color=\"#104a5a\">a leo luctus</font>, <b>ullamcorper</b> tempus ex porta. Aenean auctor massa eget vulputate convallis. Suspendisse pellentesque sem in neque consequat, vel lobortis libero aliquam. Vivamus nibh nisi, laoreet nec ornare nec, ultricies id lectus.<u><b>??</b></u></p>', 'Vak??f Web Site Yaz??l??m Projesi', 'Vak??f Web Site Yaz??l??m Projesi', 'Vak??f Web Site Yaz??l??m Projesi', 0, 4),
(122, '??ilingir Firma Yaz??l??m Projesi', 'assets/img/projeler/2393422889.jpg', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\"><span open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Fusce congue rhoncus lectus, ultricies suscipit diam gravida non. Etiam consectetur consequat pulvinar.<font color=\"#0000ff\">??Phasellus nisl arcu</font>, blandit varius ultrices id, interdum a ante. Nulla facilisi. Integer faucibus mauris magna, sit amet fermentum risus feugiat quis. Phasellus sed mauris at??<u>nulla varius consectetur</u>. Integer non tortor quis sapien accumsan tristique. Nunc pharetra nunc non metus porta, non mollis mi suscipit. Sed sagittis quis dui sit amet imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec et enim in ex sagittis lacinia sed sed ante. Integer quis tortor eu sem facilisis sagittis sit amet at massa.??</span><font face=\"Arial Black\">Sed congue ut mi vitae</font><font face=\"Open Sans, Arial, sans-serif\">??consequat.</font></p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Aliquam imperdiet, dui a semper ultrices, odio odio semper est, sed lobortis velit mauris sit amet est. Morbi elementum ligula et urna vulputate finibus. Morbi dapibus lorem id quam iaculis, eget iaculis urna pharetra. Vivamus sodales mi diam, quis faucibus diam luctus id.??<font color=\"#ff0000\">Pellentesque habitant</font>??morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur non nisi eu velit aliquet pellentesque. Duis facilisis tortor in sagittis consectetur. Quisque dolor ante, ullamcorper a blandit elementum, consectetur scelerisque ante. Morbi posuere ligula non auctor molestie. Fusce non metus elementum, finibus magna sed, sagittis ex. Curabitur fermentum nunc mattis consequat faucibus. Donec dignissim eros erat, eu accumsan felis finibus id. Nulla posuere, nibh in efficitur tempus, neque ante placerat turpis, id dictum augue arcu a enim.</p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Integer leo turpis, aliquam sed pretium lacinia,??elementum non??augue. Phasellus lobortis risus facilisis mi vestibulum congue. Suspendisse quis lorem eget sapien tincidunt lacinia posuere ut nunc. Integer hendrerit libero lorem, et lobortis quam pellentesque eu. Aenean dapibus efficitur tellus, sit amet elementum tellus. Curabitur scelerisque felis quis ultricies interdum. Praesent lacus nunc, dignissim id nisi sit amet, interdum gravida neque. Integer eu lacus leo. Morbi mattis leo??<font color=\"#104a5a\">a leo luctus</font>,??ullamcorper??tempus ex porta. Aenean auctor massa eget vulputate convallis. Suspendisse pellentesque sem in neque consequat, vel lobortis libero aliquam. Vivamus nibh nisi, laoreet nec ornare nec, ultricies id lectus.<u>??</u></p>', '??ilingir Firma Yaz??l??m Projesi', '??ilingir Firma Yaz??l??m Projesi', '??ilingir Firma Yaz??l??m Projesi', 1, 1),
(123, 'Nakliyat firma web site yaz??l??m??', 'assets/img/projeler/2393422889.jpg', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\"><span open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Fusce congue rhoncus lectus, ultricies suscipit diam gravida non. Etiam consectetur consequat pulvinar.<font color=\"#0000ff\">??Phasellus nisl arcu</font>, blandit varius ultrices id, interdum a ante. Nulla facilisi. Integer faucibus mauris magna, sit amet fermentum risus feugiat quis. Phasellus sed mauris at??<u>nulla varius consectetur</u>. Integer non tortor quis sapien accumsan tristique. Nunc pharetra nunc non metus porta, non mollis mi suscipit. Sed sagittis quis dui sit amet imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec et enim in ex sagittis lacinia sed sed ante. Integer quis tortor eu sem facilisis sagittis sit amet at massa.??</span><font face=\"Arial Black\">Sed congue ut mi vitae</font><font face=\"Open Sans, Arial, sans-serif\">??consequat.</font></p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Aliquam imperdiet, dui a semper ultrices, odio odio semper est, sed lobortis velit mauris sit amet est. Morbi elementum ligula et urna vulputate finibus. Morbi dapibus lorem id quam iaculis, eget iaculis urna pharetra. Vivamus sodales mi diam, quis faucibus diam luctus id.??<font color=\"#ff0000\">Pellentesque habitant</font>??morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur non nisi eu velit aliquet pellentesque. Duis facilisis tortor in sagittis consectetur. Quisque dolor ante, ullamcorper a blandit elementum, consectetur scelerisque ante. Morbi posuere ligula non auctor molestie. Fusce non metus elementum, finibus magna sed, sagittis ex. Curabitur fermentum nunc mattis consequat faucibus. Donec dignissim eros erat, eu accumsan felis finibus id. Nulla posuere, nibh in efficitur tempus, neque ante placerat turpis, id dictum augue arcu a enim.</p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Integer leo turpis, aliquam sed pretium lacinia,??elementum non??augue. Phasellus lobortis risus facilisis mi vestibulum congue. Suspendisse quis lorem eget sapien tincidunt lacinia posuere ut nunc. Integer hendrerit libero lorem, et lobortis quam pellentesque eu. Aenean dapibus efficitur tellus, sit amet elementum tellus. Curabitur scelerisque felis quis ultricies interdum. Praesent lacus nunc, dignissim id nisi sit amet, interdum gravida neque. Integer eu lacus leo. Morbi mattis leo??<font color=\"#104a5a\">a leo luctus</font>,??ullamcorper??tempus ex porta. Aenean auctor massa eget vulputate convallis. Suspendisse pellentesque sem in neque consequat, vel lobortis libero aliquam. Vivamus nibh nisi, laoreet nec ornare nec, ultricies id lectus.<u>??</u></p>', 'Nakliyat firma web site yaz??l??m??', 'Nakliyat firma web site yaz??l??m??', 'Nakliyat firma web site yaz??l??m??', 1, 1),
(124, 'Emlak Firma Web Site Yaz??l??m??', 'assets/img/projeler/2393422889.jpg', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\"><span open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Fusce congue rhoncus lectus, ultricies suscipit diam gravida non. Etiam consectetur consequat pulvinar.<font color=\"#0000ff\">??Phasellus nisl arcu</font>, blandit varius ultrices id, interdum a ante. Nulla facilisi. Integer faucibus mauris magna, sit amet fermentum risus feugiat quis. Phasellus sed mauris at??<u>nulla varius consectetur</u>. Integer non tortor quis sapien accumsan tristique. Nunc pharetra nunc non metus porta, non mollis mi suscipit. Sed sagittis quis dui sit amet imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec et enim in ex sagittis lacinia sed sed ante. Integer quis tortor eu sem facilisis sagittis sit amet at massa.??</span><font face=\"Arial Black\">Sed congue ut mi vitae</font><font face=\"Open Sans, Arial, sans-serif\">??consequat.</font></p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Aliquam imperdiet, dui a semper ultrices, odio odio semper est, sed lobortis velit mauris sit amet est. Morbi elementum ligula et urna vulputate finibus. Morbi dapibus lorem id quam iaculis, eget iaculis urna pharetra. Vivamus sodales mi diam, quis faucibus diam luctus id.??<font color=\"#ff0000\">Pellentesque habitant</font>??morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur non nisi eu velit aliquet pellentesque. Duis facilisis tortor in sagittis consectetur. Quisque dolor ante, ullamcorper a blandit elementum, consectetur scelerisque ante. Morbi posuere ligula non auctor molestie. Fusce non metus elementum, finibus magna sed, sagittis ex. Curabitur fermentum nunc mattis consequat faucibus. Donec dignissim eros erat, eu accumsan felis finibus id. Nulla posuere, nibh in efficitur tempus, neque ante placerat turpis, id dictum augue arcu a enim.</p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Integer leo turpis, aliquam sed pretium lacinia,??elementum non??augue. Phasellus lobortis risus facilisis mi vestibulum congue. Suspendisse quis lorem eget sapien tincidunt lacinia posuere ut nunc. Integer hendrerit libero lorem, et lobortis quam pellentesque eu. Aenean dapibus efficitur tellus, sit amet elementum tellus. Curabitur scelerisque felis quis ultricies interdum. Praesent lacus nunc, dignissim id nisi sit amet, interdum gravida neque. Integer eu lacus leo. Morbi mattis leo??<font color=\"#104a5a\">a leo luctus</font>,??ullamcorper??tempus ex porta. Aenean auctor massa eget vulputate convallis. Suspendisse pellentesque sem in neque consequat, vel lobortis libero aliquam. Vivamus nibh nisi, laoreet nec ornare nec, ultricies id lectus.<u>??</u></p>', 'Emlak Firma Web Site Yaz??l??m??', 'Emlak Firma Web Site Yaz??l??m??', 'Emlak Firma Web Site Yaz??l??m??', 0, 3),
(125, 'Geli??mi?? ??lan Site Yaz??l??m??', 'assets/img/projeler/2393422889.jpg', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\"><span open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Fusce congue rhoncus lectus, ultricies suscipit diam gravida non. Etiam consectetur consequat pulvinar.<font color=\"#0000ff\">??Phasellus nisl arcu</font>, blandit varius ultrices id, interdum a ante. Nulla facilisi. Integer faucibus mauris magna, sit amet fermentum risus feugiat quis. Phasellus sed mauris at??<u>nulla varius consectetur</u>. Integer non tortor quis sapien accumsan tristique. Nunc pharetra nunc non metus porta, non mollis mi suscipit. Sed sagittis quis dui sit amet imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec et enim in ex sagittis lacinia sed sed ante. Integer quis tortor eu sem facilisis sagittis sit amet at massa.??</span><font face=\"Arial Black\">Sed congue ut mi vitae</font><font face=\"Open Sans, Arial, sans-serif\">??consequat.</font></p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Aliquam imperdiet, dui a semper ultrices, odio odio semper est, sed lobortis velit mauris sit amet est. Morbi elementum ligula et urna vulputate finibus. Morbi dapibus lorem id quam iaculis, eget iaculis urna pharetra. Vivamus sodales mi diam, quis faucibus diam luctus id.??<font color=\"#ff0000\">Pellentesque habitant</font>??morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur non nisi eu velit aliquet pellentesque. Duis facilisis tortor in sagittis consectetur. Quisque dolor ante, ullamcorper a blandit elementum, consectetur scelerisque ante. Morbi posuere ligula non auctor molestie. Fusce non metus elementum, finibus magna sed, sagittis ex. Curabitur fermentum nunc mattis consequat faucibus. Donec dignissim eros erat, eu accumsan felis finibus id. Nulla posuere, nibh in efficitur tempus, neque ante placerat turpis, id dictum augue arcu a enim.</p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Integer leo turpis, aliquam sed pretium lacinia,??elementum non??augue. Phasellus lobortis risus facilisis mi vestibulum congue. Suspendisse quis lorem eget sapien tincidunt lacinia posuere ut nunc. Integer hendrerit libero lorem, et lobortis quam pellentesque eu. Aenean dapibus efficitur tellus, sit amet elementum tellus. Curabitur scelerisque felis quis ultricies interdum. Praesent lacus nunc, dignissim id nisi sit amet, interdum gravida neque. Integer eu lacus leo. Morbi mattis leo??<font color=\"#104a5a\">a leo luctus</font>,??ullamcorper??tempus ex porta. Aenean auctor massa eget vulputate convallis. Suspendisse pellentesque sem in neque consequat, vel lobortis libero aliquam. Vivamus nibh nisi, laoreet nec ornare nec, ultricies id lectus.<u>??</u></p>', 'Geli??mi?? ??lan Site Yaz??l??m??', 'Geli??mi?? ??lan Site Yaz??l??m??', 'Geli??mi?? ??lan Site Yaz??l??m??', 0, 3),
(126, 'Belediye Web Site Projesi', 'assets/img/projeler/2393422889.jpg', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\"><span open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Fusce congue rhoncus lectus, ultricies suscipit diam gravida non. Etiam consectetur consequat pulvinar.<font color=\"#0000ff\">??Phasellus nisl arcu</font>, blandit varius ultrices id, interdum a ante. Nulla facilisi. Integer faucibus mauris magna, sit amet fermentum risus feugiat quis. Phasellus sed mauris at??<u>nulla varius consectetur</u>. Integer non tortor quis sapien accumsan tristique. Nunc pharetra nunc non metus porta, non mollis mi suscipit. Sed sagittis quis dui sit amet imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec et enim in ex sagittis lacinia sed sed ante. Integer quis tortor eu sem facilisis sagittis sit amet at massa.??</span><font face=\"Arial Black\">Sed congue ut mi vitae</font><font face=\"Open Sans, Arial, sans-serif\">??consequat.</font></p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Aliquam imperdiet, dui a semper ultrices, odio odio semper est, sed lobortis velit mauris sit amet est. Morbi elementum ligula et urna vulputate finibus. Morbi dapibus lorem id quam iaculis, eget iaculis urna pharetra. Vivamus sodales mi diam, quis faucibus diam luctus id.??<font color=\"#ff0000\">Pellentesque habitant</font>??morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur non nisi eu velit aliquet pellentesque. Duis facilisis tortor in sagittis consectetur. Quisque dolor ante, ullamcorper a blandit elementum, consectetur scelerisque ante. Morbi posuere ligula non auctor molestie. Fusce non metus elementum, finibus magna sed, sagittis ex. Curabitur fermentum nunc mattis consequat faucibus. Donec dignissim eros erat, eu accumsan felis finibus id. Nulla posuere, nibh in efficitur tempus, neque ante placerat turpis, id dictum augue arcu a enim.</p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;\">Integer leo turpis, aliquam sed pretium lacinia,??elementum non??augue. Phasellus lobortis risus facilisis mi vestibulum congue. Suspendisse quis lorem eget sapien tincidunt lacinia posuere ut nunc. Integer hendrerit libero lorem, et lobortis quam pellentesque eu. Aenean dapibus efficitur tellus, sit amet elementum tellus. Curabitur scelerisque felis quis ultricies interdum. Praesent lacus nunc, dignissim id nisi sit amet, interdum gravida neque. Integer eu lacus leo. Morbi mattis leo??<font color=\"#104a5a\">a leo luctus</font>,??ullamcorper??tempus ex porta. Aenean auctor massa eget vulputate convallis. Suspendisse pellentesque sem in neque consequat, vel lobortis libero aliquam. Vivamus nibh nisi, laoreet nec ornare nec, ultricies id lectus.<u>??</u></p>', 'Belediye Web Site Projesi', 'Belediye Web Site Projesi', 'Belediye Web Site Projesi', 1, 1),
(159, 'Geli??mi?? Kurumsal Firma Yaz??l??m??', 'assets/img/projeler/2393422889.jpg', '<p style=\"box-sizing: border-box; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-family: \"Open Sans\"; font-size: 16px; line-height: 28px; color: rgb(123, 123, 123); padding: 0px; text-align: justify;\"><span open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"box-sizing: border-box;\">Fusce congue rhoncus lectus, ultricies suscipit diam gravida non. Etiam consectetur consequat pulvinar.<font color=\"#0000ff\" style=\"box-sizing: border-box;\">Phasellus nisl arcu</font>, blandit varius ultrices id, interdum a ante. Nulla facilisi. Integer faucibus mauris magna, sit amet fermentum risus feugiat quis. Phasellus sed mauris at??<u style=\"box-sizing: border-box;\">nulla varius consectetur</u>. Integer non tortor quis sapien accumsan tristique. Nunc pharetra nunc non metus porta, non mollis mi suscipit. Sed sagittis quis dui sit amet imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec et enim in ex sagittis lacinia sed sed ante. Integer quis tortor eu sem facilisis sagittis sit amet at massa.??</span><font face=\"Arial Black\" style=\"box-sizing: border-box;\">Sed congue ut mi vitae</font><font face=\"Open Sans, Arial, sans-serif\" style=\"box-sizing: border-box;\">??consequat.</font></p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"box-sizing: border-box; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-family: \"Open Sans\"; font-size: 16px; line-height: 28px; color: rgb(123, 123, 123); padding: 0px; text-align: justify;\">Aliquam imperdiet, dui a semper ultrices, odio odio semper est, sed lobortis velit mauris sit amet est. Morbi elementum ligula et urna vulputate finibus. Morbi dapibus lorem id quam iaculis, eget iaculis urna pharetra. Vivamus sodales mi diam, quis faucibus diam luctus id.??<font color=\"#ff0000\" style=\"box-sizing: border-box;\">Pellentesque habitant</font>??morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur non nisi eu velit aliquet pellentesque. Duis facilisis tortor in sagittis consectetur. Quisque dolor ante, ullamcorper a blandit elementum, consectetur scelerisque ante. Morbi posuere ligula non auctor molestie. Fusce non metus elementum, finibus magna sed, sagittis ex. Curabitur fermentum nunc mattis consequat faucibus. Donec dignissim eros erat, eu accumsan felis finibus id. Nulla posuere, nibh in efficitur tempus, neque ante placerat turpis, id dictum augue arcu a enim.</p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"box-sizing: border-box; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-family: \"Open Sans\"; font-size: 16px; line-height: 28px; color: rgb(123, 123, 123); padding: 0px; text-align: justify;\">Integer leo turpis, aliquam sed pretium lacinia,??<b style=\"box-sizing: border-box; font-weight: bold;\">elementum non</b>??augue. Phasellus lobortis risus facilisis mi vestibulum congue. Suspendisse quis lorem eget sapien tincidunt lacinia posu', 'Geli??mi?? Kurumsal Firma Yaz??l??m??', 'Geli??mi?? Kurumsal Firma Yaz??l??m??', 'Geli??mi?? Kurumsal Firma Yaz??l??m??', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `randevu`
--

CREATE TABLE `randevu` (
  `randevu_id` int(11) NOT NULL,
  `randevu_tarih` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `randevu_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `randevu_tel` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `randevu_hizmet` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `randevu_not` longtext COLLATE utf8_turkish_ci NOT NULL,
  `randevu_zaman` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `randevu_il` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `randevu_ilce` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `randevu_adres` longtext COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `randevu`
--

INSERT INTO `randevu` (`randevu_id`, `randevu_tarih`, `randevu_ad`, `randevu_tel`, `randevu_hizmet`, `randevu_not`, `randevu_zaman`, `randevu_il`, `randevu_ilce`, `randevu_adres`) VALUES
(1, '2018-02-23 15:41:08', 'OZAN ??Z', '0546 667 6703', 'DI?? CEPHE CAM TEM??ZL??????', 'TEM??ZL??K YAPILACAK', '222222-02-22 22:22', '??ZM??R', 'Ba??c??lar', 'zcgvbxbvxvb'),
(2, '2018-04-05 13:53:24', 'asdfadsf', 'adfadf', '??ZEL MOB??LYA TASARIMI', 'zdxgsxh', '', '', '', ''),
(3, '2018-04-24 07:44:30', 'asdfadsf', 'adfadf', 'WEB TASARIM', 'FDHGJ', '', '', '', ''),
(4, '2018-04-24 07:46:56', 'asdfadsf', 'adfadf', 'WEB TASARIM', 'FDHGJ', '', '', '', ''),
(5, '2018-09-05 12:44:14', 'asdfadsf', '05456676703', 'WEB TASARIM', 'dfhdgjhdgj', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `referanslar`
--

CREATE TABLE `referanslar` (
  `referans_id` int(11) NOT NULL,
  `referans_resim1` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `referans_adi` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `referans_kategori` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `referans_link` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `referanslar`
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
-- Table structure for table `resim`
--

CREATE TABLE `resim` (
  `resim_id` int(11) NOT NULL,
  `resim_urun` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `resim_link` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `resim`
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
-- Table structure for table `resimgaleri`
--

CREATE TABLE `resimgaleri` (
  `resim_id` int(11) NOT NULL,
  `resim_baslik` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `resim_link` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `resimgaleri`
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
-- Table structure for table `sayfalar`
--

CREATE TABLE `sayfalar` (
  `sayfa_id` int(11) NOT NULL,
  `sayfa_baslik` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `sayfa_icerik` longtext COLLATE utf8_turkish_ci NOT NULL,
  `sayfa_menu` int(11) NOT NULL,
  `sayfa_title` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `sayfa_descr` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `sayfa_keyword` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `sayfalar`
--

INSERT INTO `sayfalar` (`sayfa_id`, `sayfa_baslik`, `sayfa_icerik`, `sayfa_menu`, `sayfa_title`, `sayfa_descr`, `sayfa_keyword`) VALUES
(1, 'HAKKIMIZDA', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \"Open Sans\", Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nec arcu ut tortor volutpat posuere non eu justo. Pellentesque elementum ultricies enim a elementum. Integer feugiat sagittis diam. Praesent eget pellentesque turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc nec urna venenatis, bibendum lacus at, bibendum elit. Nunc eu neque et purus luctus volutpat. Curabitur ultrices dignissim metus, id sodales nulla aliquet ut. Aliquam viverra faucibus odio in scelerisque.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \"Open Sans\", Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ut rhoncus lectus, et varius nisl. Integer non eros eros. Quisque vel felis mollis, consectetur libero ut, congue turpis. Integer consectetur accumsan libero varius sollicitudin. Praesent eget posuere ex. Morbi vitae enim at elit scelerisque ornare nec ut tortor. Sed semper felis a ligula viverra, eleifend commodo libero laoreet. Vivamus quis sem risus. Proin dapibus tortor eu lectus scelerisque, sit amet semper odio dignissim. Nunc id est maximus, pellentesque odio ac, sodales diam. Phasellus efficitur dui id mauris cursus, a iaculis nisi accumsan. Cras tempus ante volutpat tellus iaculis molestie. Nam feugiat malesuada enim at imperdiet. Phasellus accumsan sodales lectus vitae cursus. In mattis velit non ex pellentesque, in fermentum eros tristique.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \"Open Sans\", Arial, sans-serif;\">Suspendisse potenti. Nullam id varius neque. Sed vel turpis eget ante pharetra semper. Proin pretium elit ac viverra lobortis. Aliquam convallis sapien et nunc consequat, sed iaculis arcu porttitor. Mauris interdum sit amet elit id luctus. Donec euismod massa cursus felis pellentesque eleifend.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \"Open Sans\", Arial, sans-serif;\">Sed a viverra justo. In hac habitasse platea dictumst. Pellentesque rhoncus ipsum vel scelerisque suscipit. Vivamus ut tortor luctus, interdum risus eget, luctus mi. Pellentesque sit amet nunc ac turpis tincidunt molestie at in lectus. Aenean hendrerit nunc ut nunc porttitor semper. Phasellus vestibulum, ligula quis cursus bibendum, sapien sapien efficitur odio, nec accumsan eros diam ut nibh. Sed sagittis mauris quis finibus cursus. Phasellus suscipit dolor ut mi tincidunt, eu porta massa ornare.</p>', 1, 'HAKKIMIZDA', 'HAKKIMIZDA Description', 'HAKKIMIZDA Keywords'),
(4, '??PTAL VE ??ADE ??ARTLARI', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nec arcu ut tortor volutpat posuere non eu justo. Pellentesque elementum ultricies enim a elementum. Integer feugiat sagittis diam. Praesent eget pellentesque turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p><p>Nunc nec urna venenatis, bibendum lacus at, bibendum elit. Nunc eu neque et purus luctus volutpat. Curabitur ultrices dignissim metus, id sodales nulla aliquet ut. Aliquam viverra faucibus odio in scelerisque.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ut rhoncus lectus, et varius nisl. Integer non eros eros. Quisque vel felis mollis, consectetur libero ut, congue turpis. Integer consectetur accumsan libero varius sollicitudin. Praesent eget posuere ex. Morbi vitae enim at elit scelerisque ornare nec ut tortor. Sed semper felis a ligula viverra, eleifend commodo libero laoreet. </p><p>Vivamus quis sem risus. Proin dapibus tortor eu lectus scelerisque, sit amet semper odio dignissim. Nunc id est maximus, pellentesque odio ac, sodales diam. Phasellus efficitur dui id mauris cursus, a iaculis nisi accumsan. Cras tempus ante volutpat tellus iaculis molestie. Nam feugiat malesuada enim at imperdiet. Phasellus accumsan sodales lectus vitae cursus. In mattis velit non ex pellentesque, in fermentum eros tristique.\r\n\r\nSuspendisse potenti. Nullam id varius neque. Sed vel turpis eget ante pharetra semper. Proin pretium elit ac viverra lobortis. </p><p>Aliquam convallis sapien et nunc consequat, sed iaculis arcu porttitor. Mauris interdum sit amet elit id luctus. Donec euismod massa cursus felis pellentesque eleifend.\r\n\r\nSed a viverra justo. In hac habitasse platea dictumst. Pellentesque rhoncus ipsum vel scelerisque suscipit. Vivamus ut tortor luctus, interdum risus eget, luctus mi. Pellentesque sit amet nunc ac turpis tincidunt molestie at in lectus. Aenean hendrerit nunc ut nunc porttitor semper. Phasellus vestibulum, ligula quis cursus bibendum, sapien sapien efficitur odio, nec accumsan eros diam ut nibh. Sed sagittis mauris quis finibus cursus. Phasellus suscipit dolor ut mi tincidunt, eu porta massa ornare.</p>', 1, '??PTAL VE ??ADE ??ARTLARI', 'Tekurunscripti.com ??PTAL VE ??ADE ??ARTLARI s??zle??mesi', '??PTAL VE ??ADE ??ARTLARI'),
(6, 'MESAFEL?? SATI?? S??ZLE??MES??', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nec arcu ut tortor volutpat posuere non eu justo. Pellentesque elementum ultricies enim a elementum. Integer feugiat sagittis diam. Praesent eget pellentesque turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc nec urna venenatis, bibendum lacus at, bibendum elit. Nunc eu neque et purus luctus volutpat. Curabitur ultrices dignissim metus, id sodales nulla aliquet ut. Aliquam viverra faucibus odio in scelerisque.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ut rhoncus lectus, et varius nisl. Integer non eros eros. Quisque vel felis mollis, consectetur libero ut, congue turpis. Integer consectetur accumsan libero varius sollicitudin. Praesent eget posuere ex. Morbi vitae enim at elit scelerisque ornare nec ut tortor. Sed semper felis a ligula viverra, eleifend commodo libero laoreet. Vivamus quis sem risus. Proin dapibus tortor eu lectus scelerisque, sit amet semper odio dignissim. Nunc id est maximus, pellentesque odio ac, sodales diam. Phasellus efficitur dui id mauris cursus, a iaculis nisi accumsan. Cras tempus ante volutpat tellus iaculis molestie. Nam feugiat malesuada enim at imperdiet. Phasellus accumsan sodales lectus vitae cursus. In mattis velit non ex pellentesque, in fermentum eros tristique.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Suspendisse potenti. Nullam id varius neque. Sed vel turpis eget ante pharetra semper. Proin pretium elit ac viverra lobortis. Aliquam convallis sapien et nunc consequat, sed iaculis arcu porttitor. Mauris interdum sit amet elit id luctus. Donec euismod massa cursus felis pellentesque eleifend.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Sed a viverra justo. In hac habitasse platea dictumst. Pellentesque rhoncus ipsum vel scelerisque suscipit. Vivamus ut tortor luctus, interdum risus eget, luctus mi. Pellentesque sit amet nunc ac turpis tincidunt molestie at in lectus. Aenean hendrerit nunc ut nunc porttitor semper. Phasellus vestibulum, ligula quis cursus bibendum, sapien sapien efficitur odio, nec accumsan eros diam ut nibh. Sed sagittis mauris quis finibus cursus. Phasellus suscipit dolor ut mi tincidunt, eu porta massa ornare.</p>', 1, 'MESAFEL?? SATI?? S??ZLE??MES?? ', 'mesafeli sat???? s??zle??mesi ', 'mesafeli sat???? s??zle??mesi ');

-- --------------------------------------------------------

--
-- Table structure for table `shopier`
--

CREATE TABLE `shopier` (
  `shopier_id` int(11) NOT NULL,
  `shopier_apikey` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `shopier_apisecret` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `shopier`
--

INSERT INTO `shopier` (`shopier_id`, `shopier_apikey`, `shopier_apisecret`) VALUES
(1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `siparis`
--

CREATE TABLE `siparis` (
  `siparis_id` int(11) NOT NULL,
  `siparis_tarih` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `siparis_ad` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `siparis_durum` int(11) DEFAULT '1',
  `siparis_odeme` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `siparis_not` longtext COLLATE utf8_turkish_ci,
  `siparis_fiyat` int(11) DEFAULT NULL,
  `siparis_fiyat_kdvsiz` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `iyzico_token` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `siparis`
--

INSERT INTO `siparis` (`siparis_id`, `siparis_tarih`, `siparis_ad`, `siparis_durum`, `siparis_odeme`, `siparis_not`, `siparis_fiyat`, `siparis_fiyat_kdvsiz`, `iyzico_token`) VALUES
(130, '2020-11-11 13:38:36', '19', 0, 'Kredi Kart??', NULL, 967, '819', NULL),
(131, '2020-11-11 13:42:13', '19', 1, 'Havale ile ??de', NULL, 1498, '1269', NULL),
(132, '2020-11-11 14:05:13', '19', 1, 'Havale ile ??de', NULL, 1132, '959', NULL),
(133, '2020-11-11 14:32:33', '19', 1, 'Havale ile ??de', NULL, 1350, '1144', NULL),
(134, '2020-12-04 10:04:29', '19', 1, 'Kredi Kart??', NULL, 601, '509', NULL),
(135, '2025-11-07 12:06:13', '20', 0, 'Kredi Kart??', NULL, 12000, '10000', NULL),
(136, '2025-11-07 13:34:30', '20', 1, 'Kredi Kart??', NULL, 539, '449', NULL),
(137, '2025-11-07 13:38:38', '20', 1, 'Kredi Kart??', NULL, 215, '179', NULL),
(138, '2025-11-07 13:39:53', '20', 1, 'Kredi Kart??', NULL, 215, '179', NULL),
(139, '2025-11-07 13:55:29', '20', 1, 'Kredi Kart??', NULL, 215, '179', NULL),
(140, '2025-11-07 14:02:19', '20', 1, 'Kredi Kart??', NULL, 215, '179', NULL),
(141, '2025-11-07 14:07:20', '20', 1, 'Kredi Kart??', NULL, 215, '179', NULL),
(143, '2025-11-07 14:17:34', '20', 1, 'Kredi Kart??', NULL, 430, '358', NULL),
(144, '2025-11-07 14:41:36', '20', 1, 'Kredi Kart??', NULL, 539, '449', NULL),
(145, '2025-11-07 14:43:07', '20', 1, 'Kredi Kart??', NULL, 215, '179', NULL),
(146, '2025-11-18 13:07:28', '21', 1, 'Kredi Kart??', NULL, 14, '11', NULL),
(147, '2025-11-18 18:37:33', '21', 1, 'Kredi Kart??', NULL, 2, '1', NULL),
(148, '2025-11-18 18:46:17', '21', 1, 'Kredi Kart??', NULL, 14, '11', NULL),
(149, '2025-11-18 18:48:10', '21', 1, 'Kredi Kart??', NULL, 1481, '1234', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slayt`
--

CREATE TABLE `slayt` (
  `slayt_id` int(1) NOT NULL,
  `slayt_baslik` varchar(150) COLLATE utf8_turkish_ci NOT NULL,
  `slayt_resim` varchar(355) COLLATE utf8_turkish_ci NOT NULL,
  `slayt_sira` int(11) NOT NULL,
  `slayt_aciklama` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `slayt_butonad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `slayt_butonlink` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `slayt_renk` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `slayt`
--

INSERT INTO `slayt` (`slayt_id`, `slayt_baslik`, `slayt_resim`, `slayt_sira`, `slayt_aciklama`, `slayt_butonad`, `slayt_butonlink`, `slayt_renk`) VALUES
(16, 'SEKTÖRE ??ZEL <br> E-TİCARET ve E-İHRACAT', 'assets/img/slayt/26834.jpg', 1, 'Ekibimizde yer alan uzman kod ve tasarım ekibimiz tarafından <br> sektörünüz ne olursa olsun size en uygun tasarım için ??al??????yor ', 'Hemen İletişime Geç', 'iletisim', 'CCE63C'),
(17, 'KİŞİYE ÖZEL<br> PORTFÖY', 'assets/img/slayt/21219.jpg', 2, 'Deneme a????klama alan?? ile daha ??ok bilgi payla????m??', '??LET??????ME GE??', 'iletisim', '#000'),
(18, 'KURUMSAL<br> WEB SİTENİZ', 'assets/img/slayt/23407.jpg', 3, 'KURUMSAL WEB SİTENİZ', 'Hemen İletişime Geç', '', '#000');

-- --------------------------------------------------------

--
-- Table structure for table `smenu`
--

CREATE TABLE `smenu` (
  `smenu_id` int(11) NOT NULL,
  `smenu_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `smenu_durum` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `smenu`
--

INSERT INTO `smenu` (`smenu_id`, `smenu_ad`, `smenu_durum`) VALUES
(10, 'Kurumsal', '1'),
(15, 'H??ZMETLER??M??Z', '1'),
(16, 'H??ZMET B??LGELER??', '1'),
(19, '??LET??????M', '1'),
(22, 'HESAP NUMARALARIMIZ', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE `sms` (
  `sms_id` int(11) NOT NULL,
  `sms_kullanici` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `sms_sifre` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `sms_baslik` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `sms_durum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `sms`
--

INSERT INTO `sms` (`sms_id`, `sms_kullanici`, `sms_sifre`, `sms_baslik`, `sms_durum`) VALUES
(0, '05368436122', 'Labirent4332426!', 'SON YAZILIM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sosyal`
--

CREATE TABLE `sosyal` (
  `sosyal_id` int(1) NOT NULL,
  `sosyal_link` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `sosyal_icon` varchar(50) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `sosyal`
--

INSERT INTO `sosyal` (`sosyal_id`, `sosyal_link`, `sosyal_icon`) VALUES
(1, 'https://www.facebook.com/', 'fa fa-facebook'),
(2, 'https://twitter.com/', 'fa fa-twitter'),
(3, 'https://www.instagram.com/nextify.tr/', 'fa fa-instagram'),
(4, 'https://youtube.com', 'fa fa-youtube');

-- --------------------------------------------------------

--
-- Table structure for table `sss`
--

CREATE TABLE `sss` (
  `sss_id` int(11) NOT NULL,
  `sss_soru` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `sss_cevap` varchar(755) COLLATE utf8_turkish_ci NOT NULL,
  `sss_sira` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `sss`
--

INSERT INTO `sss` (`sss_id`, `sss_soru`, `sss_cevap`, `sss_sira`) VALUES
(1, 'Sat??n alma i??lemi nas??l yap??l??r?', 'Almak istedi??iniz yaz??l??m?? hemen sat??n al butonu yard??m?? ile sat??n al formuna ula??abilir yada kolay ileti??im butonu ile bizimle ileti??ime ge??erek sat??n alma i??lemi ger??ekle??tirebilirsiniz.', 0),
(2, '??r??nlerin iade hakk?? var m??d??r?', 'Yaz??l??mlar??m?? a????k kaynak olmas?? sebebi ile herhangi bir iade s??z konusu de??ildir. Bu sebeple ??r??n?? sat??n almadan ??nce bir demo site kurulup t??m detaylar?? incelemeniz ve  t??m isteklerinize cevap verdi??ini anlad??????n??zda sat??n alman??z gerekir.', 4),
(3, 'Web site kurulduktan sonra i??erik nas??l girilir?', 'Web site kurulumu tamamland??ktan sonra genelde t??m m????terilerimizin i??eriklerini edit??rlerimiz taraf??ndan girmekteyiz. Bu sat??n alma a??amas??nda anla??maya ba??l?? olarak de??i??kenlik g??sterebilir. E??er siz giri?? yapmak isterseniz taraf??n??za verilen admin bilgilerinizi kullanarak geli??mi?? panel yard??m?? ile kolayca girebilirsiniz.', 6),
(4, 'Daha ??nce hi?? web site kullanmad??k e??itim veriyor musunuz?', 'T??m web site i??eri??inizi kolayca d??zenleyebilece??iniz kullan??m?? basit bir y??netim paneline sahip olacaks??n??z bu t??rk??e panel yard??m?? kolayca i??eriklerinizi teknik bilgiye ihtiya?? kalmadan kendiniz girebilirsiniz. Yinede sorun ya??ad??????n??z da destek ekibimizi aramaktan hi?? ??ekinmeyin.', 3),
(7, '??u anda web sitemiz var i??erikleri ayn?? ??ekilde ta????yabilir miyiz?', 'Eski web sitenizde bulunan t??m i??eriklerinizi dilerseniz alan??nda uzman edit??rlerimiz taraf??ndan eksiksiz olarak girilir. Siteniz bu a??amalarda yay??nda olmayacakt??r ve yar??m i??erikle m????teri ve ziyaret??i kayb?? ya??amazs??n??z web siteniz t??m bilgiler girildikten sonra yay??na al??nacakt??r.', 6),
(8, 'Sat??n ald??????m?? yaz??l??m?? birden fazla sitede kullanabilirmiyiz?', 'Sat??????n?? yapt??????m??z t??m scriptlerimiz full a????k kaynak olmas?? sebebi ile birden fazla siteye herhangi bir s??n??rlama olmadan kurulum ger??ekle??tirebilirsiniz.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `surun`
--

CREATE TABLE `surun` (
  `surun_id` int(11) NOT NULL,
  `surun_urun` longtext COLLATE utf8_turkish_ci NOT NULL,
  `surun_adet` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `surun_siparis` int(11) NOT NULL,
  `surun_fiyat` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `surun`
--

INSERT INTO `surun` (`surun_id`, `surun_urun`, `surun_adet`, `surun_siparis`, `surun_fiyat`) VALUES
(12, '65', '2', 47, '219'),
(13, '90', '1', 48, '119'),
(14, 'TEK ??R??N SCR??PT??  KOZMET??K V1', '1', 49, '219'),
(15, 'TEK ??R??N SCR??PT?? ELEKTRON??K V1', '3', 50, '119'),
(16, 'TEK ??R??N SCR??PT?? ELEKTRON??K V1', '1', 51, '119'),
(17, 'TEK ??R??N SCR??PT??  KOZMET??K V1', '1', 51, '219'),
(18, 'TEK ??R??N SCR??PT?? ELEKTRON??K V1', '1', 52, '119'),
(19, 'TEK ??R??N SCR??PT??  KOZMET??K V1', '5', 52, '219'),
(20, 'TEK ??R??N SCR??PT?? ELEKTRON??K V1', '1', 53, '119'),
(21, 'TEK ??R??N SCR??PT?? ELEKTRON??K V1', '1', 54, '119'),
(22, 'TEK ??R??N SCR??PT??  KOZMET??K V1', '2', 54, '219'),
(23, 'TEK ??R??N SCR??PT??  KOZMET??K V1', '1', 55, '219'),
(24, 'TEK ??R??N SCR??PT?? ELEKTRON??K V1', '1', 56, '119'),
(25, 'TEK ??R??N SCR??PT?? ELEKTRON??K V1', '1', 57, '119'),
(26, 'TEK ??R??N SCR??PT??  KOZMET??K V1', '1', 59, '219'),
(27, 'TEK ??R??N SCR??PT?? ELEKTRON??K V1', '1', 60, '119'),
(28, 'Deneme Paket 3', '1', 61, '179'),
(29, 'TEK ??R??N SCR??PT??  KOZMET??K V1', '1', 61, '219'),
(30, 'TEK ??R??N SCR??PT?? ELEKTRON??K V1', '3', 61, '119'),
(31, 'Geli??mi?? Web Tasar??m V1', '1', 62, '119'),
(32, 'Geli??mi?? Web Tasar??m V1', '1', 63, '219'),
(33, 'Geli??mi?? Web Tasar??m V1', '1', 64, '119'),
(34, 'Deneme Paket 4', '1', 65, '179'),
(35, 'Geli??mi?? Web Tasar??m V1', '1', 66, '119'),
(36, 'Deneme Paket 2', '1', 66, '134'),
(37, 'Geli??mi?? Web Tasar??m V1', '1', 67, '119'),
(38, 'Deneme Paket 3', '1', 68, '179'),
(39, 'Geli??mi?? Web Tasar??m V1', '1', 69, '219'),
(40, 'Deneme Paket 3', '1', 70, '179'),
(41, 'Geli??mi?? Web Tasar??m V1', '1', 71, '119'),
(42, 'Deneme Paket 2', '1', 72, '134'),
(43, 'Geli??mi?? Web Tasar??m V1', '1', 73, '219'),
(44, 'Deneme Paket 3', '1', 74, '179'),
(45, 'Geli??mi?? Web Tasar??m V1', '1', 75, '219'),
(46, 'Deneme Paket 2', '1', 76, '134'),
(47, 'Deneme Paket 2', '1', 77, '134'),
(48, 'Geli??mi?? Web Tasar??m V1', '1', 78, '219'),
(49, 'Geli??mi?? Web Tasar??m V1', '1', 79, '119'),
(50, 'Geli??mi?? Web Tasar??m V1', '1', 80, '119'),
(51, 'Deneme Paket 4', '1', 81, '179'),
(52, 'Deneme Paket 1', '1', 82, '124'),
(53, 'Geli??mi?? Web Tasar??m V1', '1', 82, '219'),
(54, 'Geli??mi?? Web Tasar??m V1', '1', 83, '219'),
(55, 'Geli??mi?? Web Tasar??m V1', '1', 84, '119'),
(56, 'Geli??mi?? Web Tasar??m V1', '1', 85, '219'),
(57, 'Restaurant | Cafe | Bar Scripti', '1', 86, '449'),
(58, 'Restaurant | Cafe | Bar Scripti', '1', 87, '449'),
(59, 'Restaurant | Cafe | Bar Scripti', '1', 88, '449'),
(60, 'Deneme Paket 1', '1', 89, '124'),
(61, 'Sa??l??k | G??zellik | Poliklinik Scripti', '1', 90, '449'),
(62, 'Deneme Paket 2', '1', 91, '134'),
(63, 'Restaurant | Cafe | Bar Scripti', '1', 92, '449'),
(64, 'Restaurant | Cafe | Bar Scripti', '2', 93, '449'),
(65, 'Restaurant | Cafe | Bar Scripti', '1', 94, '449'),
(66, 'Deneme Paket 3', '1', 95, '179'),
(67, 'Restaurant | Cafe | Bar Scripti', '1', 96, '449'),
(68, 'Restaurant | Cafe | Bar Scripti', '1', 97, '449'),
(69, 'Sa??l??k | G??zellik | Poliklinik Scripti', '1', 98, '449'),
(70, 'Tek ??r??n Sat???? Scripti V2', '1', 99, '449'),
(71, 'Sa??l??k | G??zellik | Poliklinik Scripti', '1', 100, '449'),
(72, 'Restaurant | Cafe | Bar Scripti', '1', 101, '449'),
(73, 'Deneme Paket 7', '1', 101, '179'),
(74, '<b>Spor Salonu Body Fitness Scripti-449TL</b><br><b>Alan Ad??: </b>erarhaliyikama.com', '1', 101, '449'),
(75, '<b>Sa??l??k | G??zellik | Poliklinik Scripti-449TL</b><br><b>Alan Ad??: </b>gaziantepanahtar.com.tr<br> -??zg??n ????erik 20 Adet  +400TL<br>', '1', 102, '449'),
(76, 'Deneme Paket 3', '1', 102, '179'),
(77, 'Deneme Paket 6', '1', 103, '179'),
(78, '<b>Sa??l??k | G??zellik | Poliklinik Scripti-449TL</b><br><b>Alan Ad??: </b>erarhaliyikama.com', '1', 104, '449'),
(79, 'Deneme Paket 4', '1', 104, '179'),
(80, 'Deneme Paket 6', '1', 105, '179'),
(81, '<b>Sa??l??k | G??zellik | Poliklinik Scripti-449TL</b><br><b>Alan Ad??: </b>http://asfadf.co<br><b>Hosting: </b>SSD 2 Paket +60TL<br> -Logo Tasar??m?? +75TL<br> -??zg??n ????erik 5 Adet  +125TL<br> -??zg??n ????erik 10 Adet  +225TL<br> -??zg??n ????erik 20 Adet  +400TL<br>', '1', 106, '449'),
(82, '<b>Sa??l??k | G??zellik | Poliklinik Scripti-449TL</b><br><b>Alan Ad??: </b>gaziantepanahtar.com.tr<br><b>Hosting: </b>SSD 4 Paket +80TL<br> -??zg??n ????erik 5 Adet  +125TL<br> -??zg??n ????erik 10 Adet  +225TL<br>', '1', 107, '449'),
(83, 'Deneme Paket 6', '1', 108, '179'),
(84, '<b>Spor Salonu Body Fitness Scripti-449TL</b><br><b>Alan Ad??: </b>gaziantepanahtar.com.tr<br><b>Hosting: </b>SSD 3 Paket +70TL<br> -Logo Tasar??m?? +75TL<br> -??zg??n ????erik 20 Adet  +400TL<br>', '0', 109, '449'),
(85, '<b>Spor Salonu Body Fitness Scripti-449TL</b><br><b>Alan Ad??: </b>geveycim.com<br><b>Hosting: </b>SSD 4 Paket +80TL', 'Deneme ??zel bilgi alan??', 110, '449'),
(86, '<b>Deneme ??r??n 2-799TL</b><br><b>Alan Ad??: </b>erarhaliyikama.com', 'Deneme ??r??n 2 a????klama', 111, '799'),
(87, '<b>Platinum denemem e-499TL</b><br><b>Alan Ad??: </b>geveycim.com<br> -??zg??n ????erik 20 Adet  +400TL<br>', 'Link burada', 111, '499'),
(88, '<b>Sa??l??k | G??zellik | Poliklinik Scripti-449TL</b><br><b>Alan Ad??: </b>http://asfadf', '', 112, '449'),
(89, '<b>Restaurant | Cafe | Bar Scripti-449TL</b><br><b>Alan Ad??: </b>gaziantepanahtar.com.tr', '', 113, '449'),
(90, 'Deneme Paket 7', '', 114, '179'),
(91, '<b>Sa??l??k | G??zellik | Poliklinik Scripti-449TL</b><br><b>Alan Ad??: </b>gaziantepanahtar.com.tr', '', 115, '449'),
(92, '<b>Sa??l??k | G??zellik | Poliklinik Scripti-449TL</b><br><b>Alan Ad??: </b>gaziantepanahtar.com.tr', '', 116, '449'),
(93, '<b>Sa??l??k | G??zellik | Poliklinik Scripti-449TL</b><br><b>Alan Ad??: </b>gaziantepanahtar.com.tr<br><b>Hosting: </b>SSD 2 Paket +60TL<br> -Logo Tasar??m?? +75TL<br>', '', 117, '449'),
(94, 'Deneme Paket 7', '', 118, '179'),
(95, '<b>deneme-1TL</b><br><b>Alan Ad??: </b>https://salonmixkuafor.com/<br><b>Hosting: </b>SSD 1 Paket +50TL<br> -Logo Tasar??m?? +75TL<br>', 'A????klama giriniz.', 119, '1'),
(96, '<b>Spor Salonu Body Fitness Scripti-449TL</b><br><b>Alan Ad??: </b>https://salonmixkuafor.com/<br><b>Hosting: </b>SSD 1 Paket +50TL<br> - Seo Ayarlar?? +100TL<br>', 'Deneme ??zel bilgi alan??', 120, '449'),
(97, 'Deneme Paket 7', '', 121, '179'),
(98, 'Deneme Paket 8', '', 122, '179'),
(99, 'Deneme Paket 6', '', 123, '179'),
(100, '<b>test-1TL</b><br><b>Alan Ad??: </b>https://salonmixkuafor.com/', 'A????klama giriniz.', 124, '1'),
(101, '<b>test-1TL</b><br><b>Alan Ad??: </b>https://sitepaket.com/<br> -??zg??n ????erik 5 Adet  +125TL<br> -??zg??n ????erik 10 Adet  +225TL<br>', 'A????klama giriniz.', 125, '1'),
(102, '<b>test-1TL</b><br><b>Alan Ad??: </b>https://salonmixkuafor.com/', 'A????klama giriniz.', 126, '1'),
(103, '<b>test-1TL</b><br><b>Alan Ad??: </b>https://salonmixkuafor.com/', 'A????klama giriniz.', 127, '1'),
(104, '<b>test-1TL</b><br><b>Alan Ad??: </b>https://salonmixkuafor.com/', 'A????klama giriniz.', 128, '1'),
(105, '<b>Restaurant | Cafe | Bar Scripti-449TL</b><br><b>Alan Ad??: </b>http://deneme.com/<br><b>Hosting: </b>SSD 2 Paket +60TL<br> -Logo Tasar??m?? <b>+75TL</b><br> - Seo Ayarlar?? <b>+100TL</b><br> -??zg??n ????erik 10 Adet  <b>+225TL</b><br> -??zg??n ????erik 20 Adet  <b>+400TL</b><br>', '', 129, '1309'),
(106, '<b>Restaurant | Cafe | Bar Scripti-449TL</b><br><b>Alan Ad??: </b>http://deneme.com/<br><b>Hosting: </b>SSD 3 Paket +70TL<br> -Logo Tasar??m?? <b>+75TL</b><br> - Seo Ayarlar?? <b>+100TL</b><br> -??zg??n ????erik 5 Adet  <b>+125TL</b><br>', '<p>Ba??ar??l?? ??deme Sonras?? Onayl?? Sipari??lerde G??r??necek Alan (??ndirme Linki gibi bilgileri ??r??n detaydan ekleyebilirsiniz. Her ??r??n i??in ayr??d??r.)</p>', 130, '819'),
(107, '<b>Sa??l??k | G??zellik | Poliklinik Scripti-449TL</b><br><b>Alan Ad??: </b>http://deneme.com/<br><b>Hosting: </b>SSD 3 Paket +70TL<br> -??zg??n ????erik 5 Adet  <b>+125TL</b><br> -??zg??n ????erik 10 Adet  <b>+225TL</b><br> -??zg??n ????erik 20 Adet  <b>+400TL</b><br>', '', 131, '1269'),
(108, '<b>Sa??l??k | G??zellik | Poliklinik Scripti-449TL</b><br><b>Alan Ad??: </b>gaziantepanahtar.com.tr<br><b>Hosting: </b>SSD 2 Paket +60TL<br> - Seo Ayarlar?? <b>+100TL</b><br> -??zg??n ????erik 5 Adet  <b>+125TL</b><br> -??zg??n ????erik 10 Adet  <b>+225TL</b><br>', '', 132, '959'),
(109, '<b>Sa??l??k | G??zellik | Poliklinik Scripti-449TL</b><br><b>Alan Ad??: </b>gaziantepanahtar.com.tr<br><b>Hosting: </b>SSD 3 Paket +70TL<br> -??zg??n ????erik 10 Adet  <b>+225TL</b><br> -??zg??n ????erik 20 Adet  <b>+400TL</b><br>', '', 133, '1144'),
(110, '<b>Sa??l??k | G??zellik | Poliklinik Scripti-449TL</b><br><b>Alan Ad??: </b>gaziantepanahtar.com.tr<br><b>Hosting: </b>SSD 2 Paket +60TL', '', 134, '509'),
(111, 'Silver', '', 135, '10000'),
(112, '<b>??N??AAT F??RMA SCR??PT??-449TL</b><br><b>Alan Adı: </b>velihan.com', '', 136, '449'),
(113, 'Gold', '', 137, '179'),
(114, 'Premium+', '', 138, '179'),
(115, 'Gold', '', 139, '179'),
(116, 'Gold', '', 140, '179'),
(117, 'Premium+', '', 141, '179'),
(118, 'E-Ticaret Premium+', '', 142, '179'),
(119, 'E-Ticaret Gold', '', 143, '179'),
(120, 'E-Ticaret Premium+', '', 143, '179'),
(121, '<b>Nakliyat V1 Scritpi-449TL</b><br><b>Alan Adı: </b>HASAN', '', 144, '449'),
(122, 'E-Ticaret Silver', '', 145, '179'),
(123, 'Kurumsal Silver (Yıllık)', '', 146, '11'),
(124, 'Kurumsal Silver', '', 147, '1.00'),
(125, 'Kurumsal Silver (Yıllık)', '', 148, '11'),
(126, 'Kişisel Portföy Silver (Yıllık)', '', 149, '1234');

-- --------------------------------------------------------

--
-- Table structure for table `urunler`
--

CREATE TABLE `urunler` (
  `urun_id` int(11) NOT NULL,
  `urun_baslik` varchar(455) COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_aciklama` longtext COLLATE utf8_turkish_ci,
  `urun_efiyat` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_fiyat` varchar(250) COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_aylik_fiyat` decimal(10,2) DEFAULT '0.00',
  `urun_yillik_fiyat` decimal(10,2) DEFAULT '0.00',
  `urun_kargo` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_vitrin` int(11) DEFAULT '0',
  `urun_title` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_descr` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_keyword` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_demo` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_admin` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_auser` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_apass` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `urun_kategori` int(11) DEFAULT NULL,
  `urun_paket` int(11) DEFAULT '0',
  `alanadi` int(11) DEFAULT '1',
  `hosting` int(11) DEFAULT '1',
  `eklenti` int(11) DEFAULT '1',
  `link` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `urunler`
--

INSERT INTO `urunler` (`urun_id`, `urun_baslik`, `urun_aciklama`, `urun_efiyat`, `urun_fiyat`, `urun_aylik_fiyat`, `urun_yillik_fiyat`, `urun_kargo`, `urun_vitrin`, `urun_title`, `urun_descr`, `urun_keyword`, `urun_demo`, `urun_admin`, `urun_auser`, `urun_apass`, `urun_kategori`, `urun_paket`, `alanadi`, `hosting`, `eklenti`, `link`) VALUES
(65, 'Nakliyat V1 Scritpi', '<p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\"><span style=\"box-sizing: border-box; font-weight: 700;\">Mobil uyumlu son yaz??l??m nakliyat scripti;</span></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><br style=\"box-sizing: border-box;\"></p><div rel=\"text-align: center;\" style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\"><span style=\"box-sizing: border-box; font-weight: 700;\">PHP-PDO-HTML5</span></div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\"><br style=\"box-sizing: border-box;\"></div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* %100 admin kontrol??</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* Full seo uyumlu</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* Beni ara ??zelli??i ve SMS bildirim sistemi</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* H??zl?? teklif formu ve SMS bildirim sistemi</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* SMTP destekli ileti??im formu</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* S??n??rs??z hizmet ekleme ??zelli??i</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* S??n??rs??z blog ekleme ??zelli??i</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* s??n??rs??z sayfa ekleme ??zell??i</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* T??m sayfalarda dnamik meta etiket deste??i</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* H??zl?? a????l????</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* Hatas??z kodlama</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* Basit admin panel kullan??m?? (Nakliyeciler i??in haz??rland??.)</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* 39 adet renk se??ene??i (Adminden ayarlama)</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">* S??n??rs??z slayt ekleme ba??l??k ve a????klama ve buton tan??mlama</div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\"></div><div style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: center;\">ve daha bir ??ok ??zellik...</div>', '749', '449', 0.00, 0.00, '', 0, 'Mobil uyumlu son yaz??l??m nakliyat scripti;', 'Mobil uyumlu son yaz??l??m nakliyat scripti;', 'Mobil uyumlu son yaz??l??m nakliyat scripti;', 'https://www.sonyazilim.com/nakliyat/', 'https://www.sonyazilim.com/nakliyat/sonpanel', 'admin', 'admin', 4, 0, 1, 1, 1, NULL),
(90, 'Nakliyat Scripti V2', '<p style=\"box-sizing: border-box; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" line-height:=\"\" 28px;=\"\" color:=\"\" rgb(123,=\"\" 123,=\"\" 123);=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Dinamik slayt ekleme. (Ba??l??k, a????klama ve buton ekleme) + (Bo?? b??rak??ld??????nda buton ve yaz?? alanlar?? ????kmayacakt??r.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- 40 Adet birbirinden g??zel renk se??enekleri (Admin panel kontroll??)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- T??m dinamik ve sabit sayfalar i??in admin panel kontroll?? belirtme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Header men??leri admin panelinden ekleme silme ve d??zenleme alan??.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- T??m admin paneli SweetAlert ile uyar?? pencereleri. (Dinamik aktif uyar?? penceresi)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfada t??m alanlar aktif pasif edebilme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfa t??m ba??l??k ve yaz?? alanlar?? admin panelden d??zenleme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tam i??erik y??netimi.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Resim Galerisi eklentisi. (Admin panelinde eklenen t??m resimlere title ba??l??k etiketi ekleme)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Video Galerisi eklentisi. (Admin panelden kod ile youtube video ekle)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Admin randevu kontrol?? ve tam sayfa yazd??rma ??zelli??i</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- S??n??rs??z Hizmet Ekleme</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- S??n??rs??z Hizmet B??lgesi Ekleme</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- SMS bildirimi admin aktif pasif yapma. (??leti??im ve randevu i??in admin bildirimi.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Randevu Talep Formu bildirimi (Admin randevu talep formu i??in hem mail hem sms bildirimi.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- MA??L bildirimi (??leti??im admin bildirimi. ??? randevu sonucunda admin bildirimi)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer men??leri adminden d??zenleme, ekleme ve silme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sosyal medya y??netimi.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer link ekleme d??zenleme silme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Full admin kont??rl?? ve basit kullan??m.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Whastapp Destek Mod??l??. (Aktif, pasif ??zelli??i y??n de??i??tirme.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- T??kla Ara Mod??l??. (Aktif, pasif yapabilme.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Daha sayamad??????m??z bir??ok ??zellik i??in demolar?? inceleyebilirsiniz.</span><br></p>', '749', '449', 0.00, 0.00, '', 1, 'Yeni Nakliyat Scripti V2', 'Yeni Nakliyat Scripti V2', 'Yeni Nakliyat Scripti V2', 'https://www.sonyazilim.com/nakliyatv2/', 'https://www.sonyazilim.com/nakliyatv2/trex/', 'admin', 'admin', 4, 0, 1, 1, 1, NULL),
(91, 'Kişisel Portföy Silver', 'A????klama giriniz\r\nA????klama giriniz\r\nA????klama giriniz\r\nA????klama giriniz\r\nA????klama giriniz\r\nA????klama giriniz\r\nA????klama giriniz\r\nA????klama giriniz', '', '799', 123.00, 1234.00, '', 1, '', '', '', '', '', '', '', 4, 1, 1, 1, 1, NULL),
(92, 'Kişisel Portföy Gold', 'A????klama giriniz\r\nA????klama giriniz\r\nA????klama giriniz\r\nA????klama giriniz\r\nA????klama giriniz\r\nA????klama giriniz\r\nA????klama giriniz\r\nA????klama giriniz', '', '1199', 0.00, 0.00, '', 1, '', '', '', '', '', '', '', 4, 1, 1, 1, 1, NULL),
(93, 'Kurumsal Silver', 'Gelişmiş SEO Optimizasyonu  : ✔️  \r\nMobil Uyumlu Tasarım        : ✔️  \r\nİletişim Formu             : ✔️  \r\nÇoklu Dil Desteği           : ❌  \r\nGoogle Konsol Kaydı          : ❌  \r\nGörsel Tasarım Oluşturma    : ❌  \r\nBirebir Özelleştirme        : ❌  \r\nBlog Yazıları Ekleme Sistemi: Sınırsız  \r\nTeknik Destek               : 1 Ay  \r\nHosting                     : Ücretsiz  \r\nTeslim Süresi              : 1 Gün  ', '', '1299', 1.00, 11.00, '', 1, '', '', '', '', '', '', '', 3, 1, 1, 1, 1, NULL),
(94, 'Kurumsal Gold', 'Gelişmiş SEO Optimizasyonu  : ✔️  \r\nMobil Uyumlu Tasarım        : ✔️  \r\nletişim Formu             : ✔️  \r\nÇoklu Dil Desteği           : ✔️  \r\nGoogle Konsol Kaydı          : ✔️  \r\nGörsel Tasarım Oluşturma    : ❌  \r\nBirebir Özelleştirme        : ❌  \r\nBlog Yazıları Ekleme Sistemi: Sınırsız  \r\nTeknik Destek               : 3 Ay  \r\nHosting                     : Ücretsiz  \r\nTeslim Süresi              : 3 Gün  ', '', '1699', 0.00, 0.00, '', 1, '', '', '', '', '', '', '', 3, 1, 1, 1, 1, NULL),
(95, 'Kurumsal Premium+', 'Gelişmiş SEO Optimizasyonu  : ✔️  \r\nMobil Uyumlu Tasarım        : ✔️  \r\nİletişim Formu             : ✔️  \r\nÇoklu Dil Desteği           : ✔️  \r\nGoogle Konsol Kaydı          : ✔️  \r\nGörsel Tasarım Oluşturma    : ✔️ (3 Ay)  \r\nBirebir Özelleştirme        : ✔️  \r\nBlog Yazıları Ekleme Sistemi: Sınırsız  \r\nTeknik Destek               : 1 Yıl  \r\nHosting                     : Ücretsiz  \r\nTeslim Süresi              : Siteniz İstediğiniz Formata Geldiğinde  ', '', '2399', 0.00, 0.00, '', 1, '', '', '', '', '', '', '', 3, 1, 1, 1, 1, NULL),
(96, 'E-Ticaret Silver', ' Ürün Sayısı                     : Sınırsız\r\n Gelişmiş SEO Optimizasyonu      : ✔️\r\n Sepet & Ödeme Sistemi           : ✔️\r\n Stok Takibi                     : ✔️\r\n Sanal POS Entegrasyonları       : ✔️ (PayTR, İyzico, Shopier)\r\n NetGSM Entegrasyonu             : ✔️\r\n Toplu Ürün Ekleme / Güncelleme  : ✔️\r\n Kampanya & İndirim Kodu         : ✔️\r\n\r\n Sepet Takip Sistemi             : ❌\r\n Kargo Takip Entegrasyonu        : ❌\r\n Google Konsol Kaydı             : ❌\r\n Çoklu Dil Desteği               : ❌\r\n 3 Farklı Para Birimi            : ❌\r\n Görsel Tasarım Oluşturma        : ❌ (Banner, Logo vb.)\r\n Birebir Özelleştirme            : ❌\r\n\r\n Blog Yazıları Ekleme Sistemi    : Sınırsız\r\n Teknik Destek                   : 1 Ay\r\n Hosting                         : Ücretsiz\r\n Teslim Süresi                   : 1 Gün', '', '1799', 0.00, 0.00, '', 1, '', '', '', '', '', '', '', 1, 1, 1, 1, 1, NULL),
(97, 'E-Ticaret Gold', ' Ürün Sayısı               : Sınırsız  \r\n Gelişmiş SEO Optimizasyonu             : ✔️  \r\n Sepet & Ödeme Sistemi     : ✔️  \r\n Stok Takibi               : ✔️  \r\n Sanal POS Entegrasyonları : ✔️ (PayTR, İyzico, Shopier)  \r\n NetGSM Entegrasyonu       : ✔️  \r\n Toplu Ürün Ekleme / Güncelleme : ✔️  \r\n Kampanya & İndirim Kodu   : ✔️  \r\n Sepet Takip Sistemi       : ✔️  \r\n Kargo Takip Entegrasyonu  : ✔️  \r\n Google Konsol Kaydı       : ✔️  \r\nÇoklu Dil Desteği         : ✔️  \r\n 3 Farklı Para Birimi      : ❌  \r\n Görsel Tasarım Oluşturma  : ❌(Banner, Logo vb.)  \r\n Birebir Özelleştirme     : ❌  \r\n Blog Yazıları Ekeleme Sistemi     : Sınırsız  \r\n Teknik Destek             : 3 Ay  \r\n Hosting                   : Ücretsiz  \r\n  Teslim Süresi            : 3 Gün ', '', '2299', 0.00, 0.00, '', 1, '', '', '', '', '', '', '', 1, 1, 1, 1, 1, NULL),
(98, 'E-Ticaret Premium+', 'Ürün Sayısı               : Sınırsız  \r\nGelişmiş SEO Optimizasyonu              : ✔️  \r\nSepet & Ödeme Sistemi     : ✔️  \r\nStok Takibi               : ✔️  \r\nSanal POS Entegrasyonları : ✔️ (PayTR, İyzico, Shopier)  \r\nNetGSM Entegrasyonu       : ✔️  \r\nToplu Ürün Ekleme / Güncelleme : ✔️  \r\nKampanya & İndirim Kodu   : ✔️  \r\nSepet Takip Sistemi       : ✔️  \r\nKargo Takip Entegrasyonu  : ✔️  \r\nGoogle Konsol Kaydı       : ✔️  \r\nÇoklu Dil Desteği         : ✔️  \r\n3 Farklı Para Birimi      : ✔️  \r\nGörsel Tasarım Oluşturma  : ✔️(Banner, Logo vb.) (3 Ay)  \r\nBirebir Özelleştirme     : ✔️  \r\nBlog Yazıları Ekleme Sistemi     : Sınırsız  \r\nTeknik Destek             : 1 Yıl  \r\nHosting                   : Ücretsiz  \r\nTeslim Süresi            : Siteniz İstediğiniz Formata Geldiğinde', '', '3499', 0.00, 0.00, '', 1, '', '', '', '', '', '', '', 1, 1, 1, 1, 1, NULL),
(99, 'Kurumsal V2 firma scripti', '<p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">Full SEO + Full Kontrol</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*Full Meta</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">Ekledi??iniz t??m ??r??nlerin, blog konular??n??n, hizmetlerin, projelerin, ve kurumsal sayfalar??n ba??l??klar?? title ve a????klama alanlar?? otomatik olarak description meta taglar?? olarak tan??mlanmaktad??r.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*SMTP destekli ??leti??im mod??l??</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">??leti??im formu ile iletilen mesajlar size an??nda mail olarak iletilir..</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*Blog mod??l??</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">Adminden s??n??rs??z blog ekleyebilir silebilir ve d??zenleyebilirsiniz.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*Sayfalar mod??l??</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">Adminden s??n??rs??z sayfa ekleyebilir silebilir ve d??zenleyebilirsiniz. Ekledi??iniz t??m sayfalar otomatik olarak footer ve headerda yay??nlanmaktad??r.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*S??k Sorulan Sorular mod??l??</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">Adminden s??n??rs??z soru ve cevap ekleyebilir silebilir ve d??zenleyebilirsiniz.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*Hizmetlerimiz mod??l??</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">Adminden hizmetlerimiz alan??n?? aktif pasif yapabilirsiniz. Pasif yapt??????n??zda ??st men??den, ana sayfadan ve footerden otomatik olarak kalkar.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*Projeler mod??l??</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">Adminden projelerimiz alan??n?? aktif pasif yapabilirsiniz. Pasif yapt??????n??zda ??st men??den, ana sayfadan ve footerden otomatik olarak kalkar.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*??r??nler mod??l??</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">Adminden ??r??nlerimiz alan??n?? aktif pasif yapabilirsiniz. Pasif yapt??????n??zda ??st men??den, ana sayfadan ve footerden otomatik olarak kalkar.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*Yorumlar mod??l??</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">Adminden yorumlar alan??n?? aktif pasif yapabilirsiniz. Pasif yapt??????n??zda ??st men??den, ana sayfadan ve footerden otomatik olarak kalkar.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*Counter mod??l??</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">Adminden counter (rakam sayan alan) alan??n?? aktif pasif yapabilirsiniz. Pasif yapt??????n??zda ??st men??den, ana sayfadan ve footerden otomatik olarak kalkar.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><b style=\"box-sizing: border-box; font-weight: bold;\">*Tercih mod??l??</b></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">Adminden tercih alan??n?? aktif pasif yapabilirsiniz. Pasif yapt??????n??zda ??st men??den, ana sayfadan ve footerden otomatik olarak kalkar.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"box-sizing: border-box; font-weight: 700;\">Full admin panel kontrol??n?? g??r??nce inanamayacaks??n??z!</span></p>', '749', '449', 0.00, 0.00, '', 0, 'Kurumsal V2 firma scripti', 'Kurumsal V2 firma scripti', 'Kurumsal V2 firma scripti', 'https://sonyazilim.com/kurumsalv2/', 'https://sonyazilim.com/kurumsalv2/sonpanel', 'admin', 'admin', 1, 0, 0, 0, 0, '<p><br></p>'),
(100, 'Kurumsal V3 Firma Scripti', '<p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Dinamik slayt ekleme. (Ba??l??k, a????klama ve buton ekleme)</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">-Site ana meta kelimeleri belirleme. (Title, Description, Keywords)</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- T??m dinamik ve sabit sayfalar i??in admin panel kontroll?? belirtme. (Title, Description, Keywords)</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Header men??leri admin panelinden ekleme silme ve d??zenleme alan??.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- T??m admin paneli SweetAlert ile uyar?? pencereleri. (Dinamik aktif uyar?? penceresi)</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Hizmetler, Projeler ve ??r??nler \'de ana sayfa vitrin belirleme.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Ana sayfada t??m alanlar aktif pasif edebilme.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Ana sayfa t??m ba??l??k ve yaz?? alanlar?? admin panelden d??zenleme.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Tam i??erik y??netimi.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Resim Galerisi eklentisi. (Admin panelinde eklenen t??m resimlere title ba??l??k etiketi ekleme)</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Video Galerisi eklentisi. (Admin panelden kod ile youtube video ekle)</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- ??r??nler mod??l??. (Title, Description, Keywords)</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Sat??n alma formu.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- ??deme se??enekleri y??netimi.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- SMS bildirimi admin aktif pasif yapma. (??leti??im admin bildirimi. ??? Sipari?? sonucunda admin ve m????teri anl??k bildirim)</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Footer men??leri adminden d??zenleme, ekleme ve silme.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Sosyal medya y??netimi.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Footer link ekleme d??zenleme silme.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Full admin kont??rl?? ve basit kullan??m.</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Daha sayamad??????m??z bir??ok ??zellik i??in demolar?? inceleyebilirsiniz.</p>', '749', '449', 0.00, 0.00, '', 1, 'Kurumsal V3 Firma Scripti', 'Kurumsal V3 Firma Scripti', 'Kurumsal V3 Firma Scripti', 'https://www.sonyazilim.com/kurumsalv3/', 'https://www.sonyazilim.com/kurumsalv3/trex', 'admin', 'admin', 1, 0, 1, 1, 1, NULL),
(103, 'Kurumsal V4 Firma Scripti', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Dinamik slayt ekleme. (Ba??l??k, a????klama ve buton ekleme) + (Bo?? b??rak??ld??????nda buton ve yaz?? alanlar?? ????kmayacakt??r.)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- 39 Adet birbirinden g??zel renk se??enekleri (Admin panel kontroll??)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- T??m dinamik ve sabit sayfalar i??in admin panel kontroll?? belirtme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Header men??leri admin panelinden ekleme silme ve d??zenleme alan??.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- T??m admin paneli SweetAlert ile uyar?? pencereleri. (Dinamik aktif uyar?? penceresi)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Hizmetler, Projeler ve ??r??nler \'de ana sayfa vitrin belirleme.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Ana sayfada t??m alanlar aktif pasif edebilme.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Ana sayfa t??m ba??l??k ve yaz?? alanlar?? admin panelden d??zenleme.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Tam i??erik y??netimi.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Resim Galerisi eklentisi. (Admin panelinde eklenen t??m resimlere title ba??l??k etiketi ekleme)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Video Galerisi eklentisi. (Admin panelden kod ile youtube video ekle)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- ??r??nler mod??l??. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Sat??n alma formu.??</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- ??deme se??enekleri y??netimi.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- SMS bildirimi admin aktif pasif yapma. (??leti??im admin bildirimi. ??? Sipari?? sonucunda admin ve m????teri anl??k bildirim)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Footer men??leri adminden d??zenleme, ekleme ve silme.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Sosyal medya y??netimi.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Footer link ekleme d??zenleme silme.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Full admin kont??rl?? ve basit kullan??m.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: left;\">- Daha sayamad??????m??z bir??ok ??zellik i??in demolar?? inceleyebilirsiniz.</span><br></p>', '749', '449', 0.00, 0.00, '', 0, 'Kurumsal V4 Firma Scripti', 'Kurumsal V4 Firma Scripti', 'Kurumsal V4 Firma Scripti', 'https://www.sonyazilim.com/v4/', 'https://www.sonyazilim.com/v4/trex', 'admin', 'admin', 1, 0, 1, 1, 1, NULL),
(104, 'GEL????M???? KURUMSAL SCR??PT?? V5', '<p style=\"box-sizing: border-box; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" line-height:=\"\" 28px;=\"\" color:=\"\" rgb(123,=\"\" 123,=\"\" 123);=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Dinamik slayt ekleme. (Ba??l??k, a????klama ve buton ekleme) + (Bo?? b??rak??ld??????nda buton ve yaz?? alanlar?? ????kmayacakt??r.)<br style=\"box-sizing: border-box;\">- ??R??NLERDE TOPLU RES??M Y??KLEME ??ZELL??????<br style=\"box-sizing: border-box;\">- Hizmet detay sayfas??nda o hizmete ??zel teklif al formu.<br style=\"box-sizing: border-box;\">- ??r??nlerde fiyat g??ster gizle.<br style=\"box-sizing: border-box;\">- ??r??nlerde sat??n al butonu g??ster gizle.<br style=\"box-sizing: border-box;\">- ??r??nlerde h??zl?? incele ??zelli??i.<br style=\"box-sizing: border-box;\">- Video ve resim galeri ??zelli??i.<br style=\"box-sizing: border-box;\">- S??n??rs?? ??st ve alt men?? ekleme ??zelli??i.<br style=\"box-sizing: border-box;\">- Slayt ??zerinde yazan yaz??lara her birine ayr?? renk belirleme ??zelli??i<br style=\"box-sizing: border-box;\"></span><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer ve sidebarda admin kontrol?? son tweetler ??zelli??i</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Yeni tasar??m geli??mi?? ileti??im sayfas??.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- 39 Adet birbirinden g??zel renk se??enekleri (Admin panel kontroll??)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- T??m dinamik ve sabit sayfalar i??in admin panel kontroll?? belirtme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Header men??leri admin panelinden ekleme silme ve d??zenleme alan??.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- T??m admin paneli SweetAlert ile uyar?? pencereleri. (Dinamik aktif uyar?? penceresi)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfada t??m alanlar aktif pasif edebilme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfa t??m ba??l??k ve yaz?? alanlar?? admin panelden d??zenleme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tam i??erik y??netimi.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- S??n??rs??z ??r??n Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- SMS bildirimi admin aktif pasif yapma. (??leti??im ve sipari?? i??in admin bildirimi.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- MA??L bildirimi (??leti??im admin bildirimi. ??? Sipari?? sonucunda admin bildirimi)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer men??leri adminden d??zenleme, ekleme ve silme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sosyal medya y??netimi.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer link ekleme d??zenleme silme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Full admin kont??rl?? ve basit kullan??m.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Whastapp Destek Mod??l??. (Aktif, pasif ??zelli??i y??n de??i??tirme.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- T??kla ara kolay eri??im butonu.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- S??k sorulan sorular mod??l??</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Daha sayamad??????m??z bir??ok ??zellik i??in demolar?? inceleyebilirsiniz.</span><br></p>', '749', '449', 0.00, 0.00, '', 1, 'GEL????M???? KURUMSAL SCR??PT?? V5', 'GEL????M???? KURUMSAL SCR??PT?? V5', 'GEL????M???? KURUMSAL SCR??PT?? V5', 'https://www.sonyazilim.com/v5/', 'https://www.sonyazilim.com/v5/trex', 'admin', 'admin', 1, 0, 1, 1, 1, NULL),
(105, 'Mobil Uyumlu ??ilingir Scripti', '<p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">-BA??LICA ??ZELL??KLER-</p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Dinamik slayt ekleme. (Ba??l??k, a????klama ve buton ekleme) + (Bo?? b??rak??ld??????nda buton ve yaz?? alanlar?? ????kmayacakt??r.)<br style=\"box-sizing: border-box;\">- 39 Adet birbirinden g??zel renk se??enekleri (Admin panel kontroll??)<br style=\"box-sizing: border-box;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)<br style=\"box-sizing: border-box;\">- T??m dinamik ve sabit sayfalar i??in admin panel kontroll?? belirtme. (Title, Description, Keywords)<br style=\"box-sizing: border-box;\">- Header men??leri admin panelinden ekleme silme ve d??zenleme alan??.<br style=\"box-sizing: border-box;\">- T??m admin paneli SweetAlert ile uyar?? pencereleri. (Dinamik aktif uyar?? penceresi)<br style=\"box-sizing: border-box;\">- Ana sayfada t??m alanlar aktif pasif edebilme.<br style=\"box-sizing: border-box;\">- Ana sayfa t??m ba??l??k ve yaz?? alanlar?? admin panelden d??zenleme.<br style=\"box-sizing: border-box;\">- Tam i??erik y??netimi.<br style=\"box-sizing: border-box;\">- Resim Galerisi eklentisi. (Admin panelinde eklenen t??m resimlere title ba??l??k etiketi ekleme)<br style=\"box-sizing: border-box;\">- Video Galerisi eklentisi. (Admin panelden kod ile youtube video ekle)<br style=\"box-sizing: border-box;\">- Admin randevu kontrol?? ve tam sayfa yazd??rma ??zelli??i<br style=\"box-sizing: border-box;\">- S??n??rs??z Hizmet Ekleme<br style=\"box-sizing: border-box;\">- S??n??rs??z Hizmet B??lgesi Ekleme<br style=\"box-sizing: border-box;\">- SMS bildirimi admin aktif pasif yapma. (??leti??im ve randevu i??in admin bildirimi.)<br style=\"box-sizing: border-box;\">- Servis Talep Formu bildirimi (Admin randevu talep formu i??in hem mail hem sms bildirimi.)<br style=\"box-sizing: border-box;\">- MA??L bildirimi (??leti??im admin bildirimi. ??? randevu sonucunda admin bildirimi)<br style=\"box-sizing: border-box;\">- Footer men??leri adminden d??zenleme, ekleme ve silme.<br style=\"box-sizing: border-box;\">- Sosyal medya y??netimi.<br style=\"box-sizing: border-box;\">- Footer link ekleme d??zenleme silme.<br style=\"box-sizing: border-box;\">- Full admin kont??rl?? ve basit kullan??m.<br style=\"box-sizing: border-box;\">- Whastapp Destek Mod??l??. (Aktif, pasif ??zelli??i y??n de??i??tirme.)<br style=\"box-sizing: border-box;\">- Daha sayamad??????m??z bir??ok ??zellik i??in demolar?? inceleyebilirsiniz.<br style=\"box-sizing: border-box;\">- T??kla Ara! butonu aktif/pasif ??zelli??i</p>', '749', '449', 0.00, 0.00, '', 1, 'Mobil Uyumlu ??ilingir Scripti', 'Mobil Uyumlu ??ilingir Scripti', 'Mobil Uyumlu ??ilingir Scripti', 'https://www.sonyazilim.com/cilingir/', 'https://www.sonyazilim.com/cilingir/trex', 'admin', 'admin', 3, 0, 1, 1, 1, NULL),
(106, 'Avukat ve Hukuk B??rosu Scripti', '<p style=\"box-sizing: border-box; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" line-height:=\"\" 28px;=\"\" color:=\"\" rgb(123,=\"\" 123,=\"\" 123);=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Geli??mi?? dinamik her slayt yaz?? rengini panelden farkl?? yapma ??zelli??i ile m????terilerinizin ba????n?? d??nd??r??n.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- S??n??rs??z ??st ve alt men?? ekleme ??zelli??i.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Yeni tasar??m geli??mi?? ileti??im sayfas??.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- 39 Adet birbirinden g??zel renk se??enekleri (Admin panel kontroll??)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- T??m dinamik ve sabit sayfalar i??in admin panel kontroll?? belirtme. (Title, Description, Keywords)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Header men??leri admin panelinden ekleme silme ve d??zenleme alan??.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- T??m admin paneli SweetAlert ile uyar?? pencereleri. (Dinamik aktif uyar?? penceresi)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfada t??m alanlar aktif pasif edebilme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfa t??m ba??l??k ve yaz?? alanlar?? admin panelden d??zenleme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tam i??erik y??netimi.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- S??n??rs??z Avukat Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- S??n??rs??z Hizmet Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- S??n??rs??z Belge ??d??l g??rselleri ekleme d??zenleme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- 7 tane otomatik dil se??ene??ini y??netim panelinden aktif pasif yapabilme komple a????p kapatabilme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Anasayfa html alan d??zenleme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- SMS bildirimi admin aktif pasif yapma. (??leti??im ve Randevu i??in admin bildirimi.)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- MA??L bildirimi (??leti??im admin bildirimi. ??? Randevu sonucunda admin bildirimi)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer men??leri adminden d??zenleme, ekleme ve silme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sosyal medya y??netimi.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer link ekleme d??zenleme silme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Full admin kont??rl?? ve basit kullan??m.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Yeni Tasar??m KOLAY ER??????M full ileti??im kanallar?? y??netimi hepsi adminden ayr??ca belirtilip aktif ve pasif edilerek kullan??labilir.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Yeni Tasar??m ??st men??de online randevu mod??l?? (Aktif, pasif ??zelli??i.)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Daha sayamad??????m??z bir??ok ??zellik i??in demolar?? inceleyebilirsiniz.</span><br></p>', '749', '449', 0.00, 0.00, '', 1, 'Avukat ve Hukuk B??rosu Scripti', 'Avukat ve Hukuk B??rosu Scripti', 'Avukat ve Hukuk B??rosu Scripti', 'https://www.sonyazilim.com/avukat/', 'https://www.sonyazilim.com/avukat/trex', 'admin', 'admin', 5, 0, 1, 1, 1, NULL);
INSERT INTO `urunler` (`urun_id`, `urun_baslik`, `urun_aciklama`, `urun_efiyat`, `urun_fiyat`, `urun_aylik_fiyat`, `urun_yillik_fiyat`, `urun_kargo`, `urun_vitrin`, `urun_title`, `urun_descr`, `urun_keyword`, `urun_demo`, `urun_admin`, `urun_auser`, `urun_apass`, `urun_kategori`, `urun_paket`, `alanadi`, `hosting`, `eklenti`, `link`) VALUES
(107, '??N??AAT F??RMA SCR??PT??', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Geli??mi?? dinamik YEN?? ST??L her slayt yaz?? rengini panelden farkl?? yapma ??zelli??i ile m????terilerinizin ba????n?? d??nd??r??n.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- S??n??rs??z ??st ve alt men?? ekleme ??zelli??i.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Yeni tasar??m geli??mi?? ileti??im sayfas??.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- 39 Adet birbirinden g??zel renk se??enekleri (Admin panel kontroll??)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- T??m dinamik ve sabit sayfalar i??in admin panel kontroll?? belirtme. (Title, Description, Keywords)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Header men??leri admin panelinden ekleme silme ve d??zenleme alan??.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- T??m admin paneli SweetAlert ile uyar?? pencereleri. (Dinamik aktif uyar?? penceresi)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Ana sayfada t??m alanlar aktif pasif edebilme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Ana sayfa t??m ba??l??k ve yaz?? alanlar?? admin panelden d??zenleme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Tam i??erik y??netimi.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- S??n??rs??z Avukat Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- S??n??rs??z Hizmet Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- S??n??rs??z RES??M GALER??S?? Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- S??n??rs??z V??DEO GALER??S?? Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- S??n??rs??z Belge ??d??l g??rselleri ekleme d??zenleme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- 7 tane otomatik dil se??ene??ini y??netim panelinden aktif pasif yapabilme komple a????p kapatabilme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Anasayfa html alan d??zenleme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- SMS bildirimi admin aktif pasif yapma. (??leti??im ve Randevu i??in admin bildirimi.)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- MA??L bildirimi (??leti??im admin bildirimi. ??? Randevu sonucunda admin bildirimi)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Footer men??leri adminden d??zenleme, ekleme ve silme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Sosyal medya y??netimi.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Footer link ekleme d??zenleme silme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- M????teri Yorumu admin paneli kontrol.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Full admin kont??rl?? ve basit kullan??m.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Yeni Tasar??m KOLAY ER??????M full ileti??im kanallar?? y??netimi hepsi adminden ayr??ca belirtilip aktif ve pasif edilerek kullan??labilir.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Yeni Tasar??m ??st men??de online randevu mod??l?? (Aktif, pasif ??zelli??i.)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px; text-align: left;\">- Daha sayamad??????m??z bir??ok ??zellik i??in demolar?? inceleyebilirsiniz.</span><br></p>', '749', '449', 0.00, 0.00, '', 1, '??N??AAT F??RMA SCR??PT??', '??N??AAT F??RMA SCR??PT??', '??N??AAT F??RMA SCR??PT??', 'https://www.sonyazilim.com/insaat/', 'https://www.sonyazilim.com/insaat/trex', 'admin', 'admin', 6, 0, 1, 1, 1, NULL),
(108, '??la??lama ??irketi Scripti', '<p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"box-sizing: border-box; font-weight: 700;\">-BA??LICA ??ZELL??KLER-</span><br style=\"box-sizing: border-box;\"></p><p style=\"box-sizing: border-box; margin: 20px 0px 0px; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Dinamik slayt ekleme. (Ba??l??k, a????klama ve buton ekleme) + (Bo?? b??rak??ld??????nda buton ve yaz?? alanlar?? ????kmayacakt??r.)<br style=\"box-sizing: border-box;\">- 39 Adet birbirinden g??zel renk se??enekleri (Admin panel kontroll??)<br style=\"box-sizing: border-box;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)<br style=\"box-sizing: border-box;\">- T??m dinamik ve sabit sayfalar i??in admin panel kontroll?? belirtme. (Title, Description, Keywords)<br style=\"box-sizing: border-box;\">- Header men??leri admin panelinden ekleme silme ve d??zenleme alan??.<br style=\"box-sizing: border-box;\">- T??m admin paneli SweetAlert ile uyar?? pencereleri. (Dinamik aktif uyar?? penceresi)<br style=\"box-sizing: border-box;\">- Ana sayfada t??m alanlar aktif pasif edebilme.<br style=\"box-sizing: border-box;\">- Ana sayfa t??m ba??l??k ve yaz?? alanlar?? admin panelden d??zenleme.<br style=\"box-sizing: border-box;\">- Tam i??erik y??netimi.<br style=\"box-sizing: border-box;\">- Resim Galerisi eklentisi. (Admin panelinde eklenen t??m resimlere title ba??l??k etiketi ekleme)<br style=\"box-sizing: border-box;\">- Video Galerisi eklentisi. (Admin panelden kod ile youtube video ekle)<br style=\"box-sizing: border-box;\">- S??n??rs??z Hizmet Ekleme<br style=\"box-sizing: border-box;\">- S??n??rs??z Hizmet B??lgesi Ekleme<br style=\"box-sizing: border-box;\">- SMS bildirimi admin aktif pasif yapma. (??leti??im admin bildirimi.)<br style=\"box-sizing: border-box;\">- MA??L bildirimi (??leti??im admin bildirimi. ??? Sipari?? sonucunda admin bildirimi)<br style=\"box-sizing: border-box;\">- Footer men??leri adminden d??zenleme, ekleme ve silme.<br style=\"box-sizing: border-box;\">- Sosyal medya y??netimi.<br style=\"box-sizing: border-box;\">- Footer link ekleme d??zenleme silme.<br style=\"box-sizing: border-box;\">- Full admin kont??rl?? ve basit kullan??m.<br style=\"box-sizing: border-box;\">-Whastapp Destek Mod??l??. (Aktif, pasif ??zelli??i y??n de??i??tirme.)<br style=\"box-sizing: border-box;\">- Daha sayamad??????m??z bir??ok ??zellik i??in demolar?? inceleyebilirsiniz.</p>', '749', '449', 0.00, 0.00, '', 1, '??la??lama ??irketi Scripti', '??la??lama ??irketi Scripti', '??la??lama ??irketi Scripti', 'https://www.sonyazilim.com/ilaclama/', 'https://www.sonyazilim.com/ilaclama/trex/', 'admin', 'admin', 7, 0, 1, 1, 1, NULL),
(109, 'Temizlik ??irketi Scripti', '<span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Dinamik slayt ekleme. (Ba??l??k, a????klama ve buton ekleme) + (Bo?? b??rak??ld??????nda buton ve yaz?? alanlar?? ????kmayacakt??r.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- 39 Adet birbirinden g??zel renk se??enekleri (Admin panel kontroll??)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- T??m dinamik ve sabit sayfalar i??in admin panel kontroll?? belirtme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Header men??leri admin panelinden ekleme silme ve d??zenleme alan??.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- T??m admin paneli SweetAlert ile uyar?? pencereleri. (Dinamik aktif uyar?? penceresi)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfada t??m alanlar aktif pasif edebilme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfa t??m ba??l??k ve yaz?? alanlar?? admin panelden d??zenleme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tam i??erik y??netimi.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Resim Galerisi eklentisi. (Admin panelinde eklenen t??m resimlere title ba??l??k etiketi ekleme)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Video Galerisi eklentisi. (Admin panelden kod ile youtube video ekle)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Admin randevu kontrol?? ve tam sayfa yazd??rma ??zelli??i</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- S??n??rs??z Hizmet Ekleme</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- S??n??rs??z Hizmet B??lgesi Ekleme</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- SMS bildirimi admin aktif pasif yapma. (??leti??im ve randevu i??in admin bildirimi.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Servis Talep Formu bildirimi (Admin randevu talep formu i??in hem mail hem sms bildirimi.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- MA??L bildirimi (??leti??im admin bildirimi. ??? randevu sonucunda admin bildirimi)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer men??leri adminden d??zenleme, ekleme ve silme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sosyal medya y??netimi.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer link ekleme d??zenleme silme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Full admin kont??rl?? ve basit kullan??m.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Whastapp Destek Mod??l??. (Aktif, pasif ??zelli??i y??n de??i??tirme.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Daha sayamad??????m??z bir??ok ??zellik i??in demolar?? inceleyebilirsiniz.</span>', '749', '449', 0.00, 0.00, '', 1, 'Temizlik ??irketi Scripti', 'Temizlik ??irketi Scripti', 'Temizlik ??irketi Scripti', 'https://www.sonyazilim.com/temizlik/', 'https://www.sonyazilim.com/temizlik/trex/', 'admin', 'admin', 8, 0, 1, 1, 1, NULL),
(110, 'Tek ??r??n Sat???? Scripti V2', '<span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Dinamik slayt . (Slayt g??rseli ekleme yaz?? i??eri??i d??zenleme arkaplan rengi ve yaz?? rengini d??zenleyebilme)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- ??R??NLERDE TOPLU RES??M Y??KLEME ??ZELL??????</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- KOLAY ??ADE MOD??L??</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- 39 Adet birbirinden g??zel renk se??enekleri (Admin panel kontroll??)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- T??m dinamik ve sabit sayfalar i??in admin panel kontroll?? belirtme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Header men??leri admin panelinden ekleme silme ve d??zenleme alan??.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- T??m admin paneli SweetAlert ile uyar?? pencereleri. (Dinamik aktif uyar?? penceresi)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfada t??m alanlar aktif pasif edebilme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfada t??m alanlar??n arkaplan renklerini panelden d??zenleme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfa t??m ba??l??k ve yaz??lar??n renklerini panelden d??zenleme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfa t??m ba??l??k ve yaz?? alanlar?? admin panelden d??zenleme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- S??n??rs??z ??r??n ekleme ve ??r??nler sayfas??.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Geli??mi?? her sayfada SATIN AL , KOLAY ??ADE ve S??PAR???? TAK??P butonlar??.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Kolay iade mod??l?? ile m????terilerinize g??ven sa??layacaks??n??z.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Dinamik iade nedenlerini adminden istedi??iniz nedeni ekleyebilir silebilir ve d??zenleyebilirsiniz.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- SEPET MOD??L?? ile m????terileriniz art??k sipari??te tek ??r??n de??il istedi??i t??m ??r??nleri ve istedi??i adette sat??n alabilirler.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">ve daha bir ??ok ??zellik i??in demoyu inceleyiniz.</span>', '749', '449', 0.00, 0.00, '', 1, 'Tek ??r??n Sat???? Scripti V2', 'Tek ??r??n Sat???? Scripti V2', 'Tek ??r??n Sat???? Scripti V2', 'https://tekurunscripti.com/demo/tekurunv2/', 'https://tekurunscripti.com/demo/tekurunv2/trex', 'admin', 'admin', 9, 0, 1, 1, 1, NULL),
(111, 'Spor Salonu Body Fitness Scripti', '<span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Geli??mi?? dinamik YEN?? ST??L her slayt yaz?? rengini panelden farkl?? yapma ??zelli??i ile m????terilerinizin ba????n?? d??nd??r??n.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- S??n??rs??z ??st ve alt men?? ekleme ??zelli??i.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Yeni tasar??m geli??mi?? ileti??im sayfas??.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- 39 Adet birbirinden g??zel renk se??enekleri (Admin panel kontroll??)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- T??m dinamik ve sabit sayfalar i??in admin panel kontroll?? belirtme. (Title, Description, Keywords)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Header men??leri admin panelinden ekleme silme ve d??zenleme alan??.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- T??m admin paneli SweetAlert ile uyar?? pencereleri. (Dinamik aktif uyar?? penceresi)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfada t??m alanlar aktif pasif edebilme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfa t??m ba??l??k ve yaz?? alanlar?? admin panelden d??zenleme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tam i??erik y??netimi.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- S??n??rs??z Antren??r Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- S??n??rs??z Hizmet Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- S??n??rs??z RES??M GALER??S?? Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- S??n??rs??z V??DEO GALER??S?? Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- S??n??rs??z Salon tan??s??m resmi ekleme d??zenleme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Anasayfa html alan d??zenleme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- SMS bildirimi admin aktif pasif yapma. (??leti??im ve Randevu i??in admin bildirimi.)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- MA??L bildirimi (??leti??im admin bildirimi. ??? Randevu sonucunda admin bildirimi)&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer men??leri adminden d??zenleme, ekleme ve silme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sosyal medya y??netimi.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer link ekleme d??zenleme silme.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Full admin kont??rl?? ve basit kullan??m.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Yeni Tasar??m KOLAY ER??????M full ileti??im kanallar?? y??netimi hepsi adminden ayr??ca belirtilip aktif ve pasif edilerek kullan??labilir.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Daha sayamad??????m??z bir??ok ??zellik i??in demolar?? inceleyebilirsiniz.</span>', '749', '449', 0.00, 0.00, '', 1, 'Spor Salonu Body Fitness Scripti', 'Spor Salonu Body Fitness Scripti', 'Spor Salonu Body Fitness Scripti', 'https://sonyazilim.com/spor/', 'https://sonyazilim.com/spor/trex', 'admin', 'admin', 10, 0, 1, 1, 1, 'Deneme ??zel bilgi alan??'),
(112, 'Sa??l??k | G??zellik | Poliklinik Scripti', '<span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Dinamik slayt ekleme. (Ba??l??k, a????klama ve buton ekleme) + (Bo?? b??rak??ld??????nda buton ve yaz?? alanlar?? ????kmayacakt??r.) + (Eklenen yaz??lara ayr?? ayr?? renk girme)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- BELGELER??M??ZDE/RES??M GALER??S??NDE TOPLU RES??M Y??KLEME ??ZELL??????</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Video ve resim galeri ??zelli??i.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- S??n??rs??z ??st ve alt men?? ekleme ??zelli??i.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Yeni tasar??m geli??mi?? ileti??im sayfas??.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- 39 Adet birbirinden g??zel renk se??enekleri (Admin panel kontroll??)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- T??m dinamik ve sabit sayfalar i??in admin panel kontroll?? belirtme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Header men??leri admin panelinden ekleme silme ve d??zenleme alan??.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- T??m admin paneli SweetAlert ile uyar?? pencereleri. (Dinamik aktif uyar?? penceresi)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfada t??m alanlar aktif pasif edebilme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Ana sayfa t??m ba??l??k ve yaz?? alanlar?? admin panelden d??zenleme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Tam i??erik y??netimi.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Belgelerimiz Mod??l??.&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- S??n??rs??z Hizmet Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- S??n??rs??z Doktor Ekleme&nbsp;</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- SMS bildirimi admin aktif pasif yapma. (??leti??im ve Randevu i??in admin bildirimi.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- MA??L bildirimi (??leti??im admin bildirimi. ??? Randevu sonucunda admin bildirimi)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer men??leri adminden d??zenleme, ekleme ve silme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Sosyal medya y??netimi.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Footer link ekleme d??zenleme silme.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Full admin kont??rl?? ve basit kullan??m.</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Yeni Tasar??m T??kla Ara, Randevu Al, Whatsapp Destek Mod??l?? (Aktif, pasif ??zelli??i.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Yeni Tasar??m ??st men??de online randevu mod??l?? (Aktif, pasif ??zelli??i.)</span><br style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\"><span style=\"font-family: &quot;Open Sans&quot;, sans-serif; font-size: 15px;\">- Daha sayamad??????m??z bir??ok ??zellik i??in demolar?? inceleyebilirsiniz.</span>', '749', '449', 0.00, 0.00, '', 1, 'Sa??l??k | G??zellik | Poliklinik Scripti', 'Sa??l??k | G??zellik | Poliklinik Scripti', 'Sa??l??k | G??zellik | Poliklinik Scripti', 'https://sonyazilim.com/hastane/', 'https://sonyazilim.com/hastane/trex', 'admin', 'admin', 11, 0, 1, 1, 1, NULL),
(113, 'Restaurant | Cafe | Bar Scripti', '<span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Dinamik slayt ekleme. (Ba??l??k, a????klama ve buton ekleme) + (Bo?? b??rak??ld??????nda buton ve yaz?? alanlar?? ????kmayacakt??r.) + (Eklenen yaz??lara ayr?? ayr?? renk girme)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- BELGELER??M??ZDE/RES??M GALER??S??NDE TOPLU RES??M Y??KLEME ??ZELL??????</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- ??r??nlerde fiyat g??ster gizle.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Video ve resim galeri ??zelli??i.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- S??n??rs?? ??st ve alt men?? ekleme ??zelli??i.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Footer ve sidebarda admin kontrol?? son tweetler ??zelli??i</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Yeni tasar??m geli??mi?? ileti??im sayfas??.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- 39 Adet birbirinden g??zel renk se??enekleri (Admin panel kontroll??)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Site ana meta kelimeleri belirleme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- T??m dinamik ve sabit sayfalar i??in admin panel kontroll?? belirtme. (Title, Description, Keywords)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Header men??leri admin panelinden ekleme silme ve d??zenleme alan??.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- T??m admin paneli SweetAlert ile uyar?? pencereleri. (Dinamik aktif uyar?? penceresi)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Ana sayfada t??m alanlar aktif pasif edebilme.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Ana sayfa t??m ba??l??k ve yaz?? alanlar?? admin panelden d??zenleme.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Tam i??erik y??netimi.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Belgelerimiz Mod??l??.??</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- S??n??rs??z Men??/??r??n Ekleme??</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- SMS bildirimi admin aktif pasif yapma. (??leti??im ve rezervasyon i??in admin bildirimi.)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- MA??L bildirimi (??leti??im admin bildirimi. ??? Rezervasyon sonucunda admin bildirimi)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Footer men??leri adminden d??zenleme, ekleme ve silme.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Sosyal medya y??netimi.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Footer link ekleme d??zenleme silme.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Full admin kont??rl?? ve basit kullan??m.</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Whastapp Destek Mod??l??. (Aktif, pasif ??zelli??i.)</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- T??kla ara kolay eri??im butonu. (Aktif, pasif ??zelli??i.)- T??kla rezervasyon yap eri??im butonu.??</span><br style=\"box-sizing: border-box; font-family: \"Open Sans\", sans-serif; font-size: 15px;\"><span style=\"font-family: \"Open Sans\", sans-serif; font-size: 15px;\">- Daha sayamad??????m??z bir??ok ??zellik i??in demolar?? inceleyebilirsiniz.</span>', '749', '449', 0.00, 0.00, '', 1, 'Restaurant | Cafe | Bar Scripti', 'Restaurant | Cafe | Bar Scripti', 'Restaurant | Cafe | Bar Scripti', 'https://sonyazilim.com/restaurant/', 'https://sonyazilim.com/restaurant/trex/', 'admin', 'admin', 12, 0, 1, 1, 1, '<p>Ba??ar??l?? ??deme Sonras?? Onayl?? Sipari??lerde G??r??necek Alan (??ndirme Linki gibi bilgileri ??r??n detaydan ekleyebilirsiniz. Her ??r??n i??in ayr??d??r.)</p>'),
(115, 'Kişisel Portföy Premium+', 'A????klama giriniz\r\nA????klama giriniz\r\nA????klama giriniz\r\nA????klama giriniz\r\nA????klama giriniz\r\nA????klama giriniz\r\nA????klama giriniz\r\nA????klama giriniz', '', '1999', 0.00, 0.00, '', 1, '', '', '', '', '', '', '', 4, 1, 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `uye`
--

CREATE TABLE `uye` (
  `uye_id` int(11) NOT NULL,
  `uye_tarih` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `uye_ad` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_soyad` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_tel` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_mail` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_adres` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_tc` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_sifre` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_kod` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_resim` varchar(255) COLLATE utf8_turkish_ci DEFAULT '0',
  `uye_onaymail` int(11) DEFAULT '0',
  `uye_onaytel` int(11) DEFAULT '0',
  `uye_kodmail` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_kodtel` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_smssure` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `uye_mailsure` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `uye`
--

INSERT INTO `uye` (`uye_id`, `uye_tarih`, `uye_ad`, `uye_soyad`, `uye_tel`, `uye_mail`, `uye_adres`, `uye_tc`, `uye_sifre`, `uye_kod`, `uye_resim`, `uye_onaymail`, `uye_onaytel`, `uye_kodmail`, `uye_kodtel`, `uye_smssure`, `uye_mailsure`) VALUES
(19, '2020-10-24 05:49:40', 'Ozan', '??z', '08508407870', 'bilgi@sonyazilim.net', '', '', '21232f297a57a5a743894a0e4a801fc3', '730e96707e9068fdbd451fb716835daa', 'admin/assets/img/genel/23847.jpg', 1, 1, '27820', '20033', '', '2020-11-09 21:53:07'),
(20, '2025-11-07 10:52:44', 'Velihan', 'Özge', '05554443322', 'velihan369@gmail.com', 'Cemalpaşa District Ethem Ekin street\r\nEnder apartment building floor 2 flat no 5', '12345678912', '202fbc7de94742520719cb22392ed2dc', 'faaeae42bdaa536883762c605b4b3c9a', 'admin/assets/img/genel/22260.jpg', 1, 0, '31723', '29179', NULL, NULL),
(21, '2025-11-18 12:38:32', 'Anıl', 'Elemir', '23423423432', 'anil_cem01@hotmail.com', NULL, NULL, '4297f44b13955235245b2497399d7a93', '340fd27b3c201e322e70ba9c2ac0575b', '0', 1, 0, '21399', '22814', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `videogaleri`
--

CREATE TABLE `videogaleri` (
  `video_id` int(11) NOT NULL,
  `video_link` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `video_resim` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `videogaleri`
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
-- Table structure for table `whatsapp`
--

CREATE TABLE `whatsapp` (
  `whats_id` int(11) NOT NULL,
  `whats_tel` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `whats_durum` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `whats_cdestek` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `whats_cdestekdurum` int(11) NOT NULL,
  `whats_tiklaara` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `whats_tiklaaradurum` int(11) NOT NULL,
  `whats_skype` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `whats_skypedurum` int(11) NOT NULL,
  `whats_mail` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `whats_maildurum` int(11) NOT NULL,
  `whats_sssdurum` int(11) NOT NULL,
  `whats_iletisimdurum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `whatsapp`
--

INSERT INTO `whatsapp` (`whats_id`, `whats_tel`, `whats_durum`, `whats_cdestek`, `whats_cdestekdurum`, `whats_tiklaara`, `whats_tiklaaradurum`, `whats_skype`, `whats_skypedurum`, `whats_mail`, `whats_maildurum`, `whats_sssdurum`, `whats_iletisimdurum`) VALUES
(0, '5416715507', '1', '0', 0, '5416715507', 1, '0', 0, '0', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `widget`
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
  `widget_bwelcome` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_breferans` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_bwelcome1` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_welcome` int(11) DEFAULT NULL,
  `widget_welcome1` int(11) DEFAULT NULL,
  `widget_bhizmet` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_bproje` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_byorum` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_bblog` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_burun` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_html` longtext COLLATE utf8_turkish_ci,
  `widget_bbilgi` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_bilgi` int(11) DEFAULT NULL,
  `widget_ara` int(11) DEFAULT NULL,
  `widget_bara` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_ufiyat` int(11) DEFAULT NULL,
  `widget_usatinal` int(11) DEFAULT NULL,
  `widget_bdiger` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_diger` int(11) DEFAULT NULL,
  `widget_bgaleri` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_twitter` int(255) DEFAULT NULL,
  `widget_btwitter` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_pyazi` longtext COLLATE utf8_turkish_ci,
  `widget_pbuton` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_plink` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `widget_onaymail` int(11) DEFAULT NULL,
  `widget_onaytel` int(11) DEFAULT NULL,
  `widget_satissozlesme` longtext COLLATE utf8_turkish_ci,
  `widget_uyesozlesme` longtext COLLATE utf8_turkish_ci,
  `widget_html2` longtext COLLATE utf8_turkish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `widget`
--

INSERT INTO `widget` (`widget_id`, `widget_hizmet`, `widget_proje`, `widget_yorum`, `widget_galeri`, `widget_urun`, `widget_counter`, `widget_referans`, `widget_blog`, `widget_bwelcome`, `widget_breferans`, `widget_bwelcome1`, `widget_welcome`, `widget_welcome1`, `widget_bhizmet`, `widget_bproje`, `widget_byorum`, `widget_bblog`, `widget_burun`, `widget_html`, `widget_bbilgi`, `widget_bilgi`, `widget_ara`, `widget_bara`, `widget_ufiyat`, `widget_usatinal`, `widget_bdiger`, `widget_diger`, `widget_bgaleri`, `widget_twitter`, `widget_btwitter`, `widget_pyazi`, `widget_pbuton`, `widget_plink`, `widget_onaymail`, `widget_onaytel`, `widget_satissozlesme`, `widget_uyesozlesme`, `widget_html2`) VALUES
(1, 1, NULL, 1, 1, 1, 1, 1, 1, '?? 2025 <a href=\"https://nextify.tr/\">Nextify.tr</a>  T??m hakk?? sakl??d??r.', 'REFERANSLARIMIZ', 'PAKETLER??M??Z', 1, 1, '??NE ??IKAN SCR??PTLER', 'M????terimizden Gelen Yorumlar', 'M????TER?? YORUMLARI', 'BLOG / DUYURU', 'Counter', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h2><b style=\"color: inherit; font-family: inherit; font-size: 2rem; text-align: justify;\">Paket Bilgileri</b><br></h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">* Silver: Siteyi demoda görüldüğü gibi teslim ediyoruz. Siz panelden istediğiniz gibi düzenleyebilirsiniz.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">* Gold: Siteyi demoda görüldüğü gibi teslim ediyoruz. Siz panelden istediğiniz gibi düzenleyebilirsiniz.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">* Premium Plus: Demoda gördüğünüz site içerisinde, neyi nasıl yapmak, nereye ne entegre etmek isterseniz bize Iletin, biz istediğiniz entegrasyonu ve özellikleri siteye ekleyelim, sizin için kişisel banner fotoğraf tasarımınızı yapalım, kişisel kimliğinizi oluşturalım, onay verdiğiniz anda sitenizi size teslim edelim.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">* Yıllık fiyatlandırmada ilk yıldan sonra ilk ücretin %66 sı olarak devam eder. </p><div style=\"text-align: justify;\" bis_skin_checked=\"1\"><br></div>', NULL, 1, NULL, ' Welcome to the largest broadband and Internet services provider where you can choose the best plan ever. We guarantee customer support service with high-speed satellite connection.', 0, 1, 'Hakk??m??zda', 1, 'Html Alan', 0, 'Html Alan', '<p style=\"box-sizing: border-box; margin-right: 0px; margin-bottom: 1.85714em; margin-left: 0px; font-family: \" open=\"\" sans\";=\"\" line-height:=\"\" 28px;=\"\" color:=\"\" rgb(123,=\"\" 123,=\"\" 123);\"=\"\">Sistemlerimizin en son yaz??l??m teknolojileri olan PHP MYSQL PDO HTML5 BOOTSTRAP yap??s?? kullan??larak arama motorlar??n??n istedi??i ??zellikleri standart olarak sunan kendi alt yap??m??z ile kodlad??k.</p>', 'T??M PROJELER', 'projeler', 0, 1, '<h3 style=\"font-family: Rubik, sans-serif; color: rgb(69, 90, 100);\">Sat???? S??zle??mesi</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis vitae erat vel ornare. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed in turpis nec eros tincidunt sollicitudin sit amet a ipsum. Phasellus lacinia id turpis quis efficitur. Integer finibus, diam in pharetra sagittis, dolor tortor tincidunt dui, a vestibulum nisl quam vestibulum est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam erat volutpat. Nunc convallis lacus eget dignissim consectetur. Curabitur sit amet rutrum velit. Pellentesque a magna enim. Vivamus bibendum pulvinar odio non imperdiet. In nulla ipsum, varius eget ultricies in, vulputate nec enim. Nullam hendrerit nisl ut convallis ultrices. In vitae massa quis nunc placerat faucibus in a nibh. Suspendisse suscipit, nulla id vulputate convallis, diam lorem volutpat lacus, vel condimentum tortor ligula ac ante. Integer auctor sagittis ex in finibus.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Curabitur in dignissim sapien, non ultrices lorem. Suspendisse auctor iaculis turpis, gravida tempor ex suscipit id. Nunc fermentum id est auctor accumsan. Phasellus in est non augue consectetur sagittis et in orci. Donec tempus bibendum ex eget sagittis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec quis diam tincidunt, pulvinar leo in, pretium erat. Sed nec ex rutrum, pretium mauris et, consequat massa. Cras commodo sapien ut nibh semper aliquam. Sed tincidunt tincidunt consequat. Phasellus semper sem egestas bibendum vehicula. Nullam tempus, ligula euismod volutpat efficitur, sem velit laoreet sapien, in venenatis quam dolor eleifend lacus. Etiam finibus quam elementum est bibendum, vitae bibendum ante pretium. Ut at sapien dignissim, pulvinar metus sit amet, auctor lectus. Morbi ullamcorper lorem a ligula fringilla, a finibus tellus volutpat.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Etiam semper, odio in dictum tempus, dui sem fringilla ante, a iaculis augue lorem in risus. Nulla vitae tincidunt eros, mollis dapibus magna. Nulla eu velit a elit malesuada ullamcorper. Maecenas bibendum tincidunt justo non tempor. Phasellus blandit, erat in semper egestas, mi ex varius felis, eu egestas urna ex quis mi. Sed mollis urna quis est convallis placerat. Vestibulum lacus arcu, condimentum ut imperdiet nec, tristique sed lorem. Proin eu consequat magna. Nam sed placerat libero, eget tincidunt nibh. Nam sed leo dapibus urna consectetur commodo at eget arcu. Fusce sagittis consequat elementum. Nunc viverra sed leo at porttitor.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Nulla tempor nulla at nunc malesuada, non faucibus sem vulputate. Nunc turpis tortor, aliquet et orci id, finibus sollicitudin est. Etiam at faucibus libero, et finibus sapien. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras pulvinar nisi id nisl elementum interdum. In eget magna ut nisi rutrum venenatis. Morbi pretium condimentum imperdiet. Quisque sed felis sed ante accumsan malesuada nec molestie mi. Nullam a maximus dui, nec tristique sapien. Ut porttitor quam eget orci suscipit maximus. Vivamus eu ipsum tincidunt, pharetra eros in, sodales dolor. Praesent posuere massa purus, sit amet consectetur est commodo et. Proin et erat fringilla, sodales ante quis, semper arcu.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Integer risus nibh, suscipit eget diam quis, dignissim molestie urna. Quisque dictum, nulla id ornare facilisis, purus eros varius augue, et vulputate ligula odio vitae augue. Donec pharetra non ex sit amet vulputate. Morbi scelerisque tellus nec enim maximus, sed auctor turpis vulputate. Donec vulputate sem varius dui dapibus auctor. Ut aliquam efficitur risus id pretium. Vestibulum ultricies ex ut tellus pharetra, at viverra augue convallis. Vivamus consectetur orci nec eros luctus imperdiet. Quisque pretium neque in quam viverra vestibulum.</p>', '<h3 style=\"font-family: Rubik, sans-serif; color: rgb(69, 90, 100);\">??yelik S??zle??mesi</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis vitae erat vel ornare. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed in turpis nec eros tincidunt sollicitudin sit amet a ipsum. Phasellus lacinia id turpis quis efficitur. Integer finibus, diam in pharetra sagittis, dolor tortor tincidunt dui, a vestibulum nisl quam vestibulum est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam erat volutpat. Nunc convallis lacus eget dignissim consectetur. Curabitur sit amet rutrum velit. Pellentesque a magna enim. Vivamus bibendum pulvinar odio non imperdiet. In nulla ipsum, varius eget ultricies in, vulputate nec enim. Nullam hendrerit nisl ut convallis ultrices. In vitae massa quis nunc placerat faucibus in a nibh. Suspendisse suscipit, nulla id vulputate convallis, diam lorem volutpat lacus, vel condimentum tortor ligula ac ante. Integer auctor sagittis ex in finibus.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Curabitur in dignissim sapien, non ultrices lorem. Suspendisse auctor iaculis turpis, gravida tempor ex suscipit id. Nunc fermentum id est auctor accumsan. Phasellus in est non augue consectetur sagittis et in orci. Donec tempus bibendum ex eget sagittis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec quis diam tincidunt, pulvinar leo in, pretium erat. Sed nec ex rutrum, pretium mauris et, consequat massa. Cras commodo sapien ut nibh semper aliquam. Sed tincidunt tincidunt consequat. Phasellus semper sem egestas bibendum vehicula. Nullam tempus, ligula euismod volutpat efficitur, sem velit laoreet sapien, in venenatis quam dolor eleifend lacus. Etiam finibus quam elementum est bibendum, vitae bibendum ante pretium. Ut at sapien dignissim, pulvinar metus sit amet, auctor lectus. Morbi ullamcorper lorem a ligula fringilla, a finibus tellus volutpat.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Etiam semper, odio in dictum tempus, dui sem fringilla ante, a iaculis augue lorem in risus. Nulla vitae tincidunt eros, mollis dapibus magna. Nulla eu velit a elit malesuada ullamcorper. Maecenas bibendum tincidunt justo non tempor. Phasellus blandit, erat in semper egestas, mi ex varius felis, eu egestas urna ex quis mi. Sed mollis urna quis est convallis placerat. Vestibulum lacus arcu, condimentum ut imperdiet nec, tristique sed lorem. Proin eu consequat magna. Nam sed placerat libero, eget tincidunt nibh. Nam sed leo dapibus urna consectetur commodo at eget arcu. Fusce sagittis consequat elementum. Nunc viverra sed leo at porttitor.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Nulla tempor nulla at nunc malesuada, non faucibus sem vulputate. Nunc turpis tortor, aliquet et orci id, finibus sollicitudin est. Etiam at faucibus libero, et finibus sapien. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras pulvinar nisi id nisl elementum interdum. In eget magna ut nisi rutrum venenatis. Morbi pretium condimentum imperdiet. Quisque sed felis sed ante accumsan malesuada nec molestie mi. Nullam a maximus dui, nec tristique sapien. Ut porttitor quam eget orci suscipit maximus. Vivamus eu ipsum tincidunt, pharetra eros in, sodales dolor. Praesent posuere massa purus, sit amet consectetur est commodo et. Proin et erat fringilla, sodales ante quis, semper arcu.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Integer risus nibh, suscipit eget diam quis, dignissim molestie urna. Quisque dictum, nulla id ornare facilisis, purus eros varius augue, et vulputate ligula odio vitae augue. Donec pharetra non ex sit amet vulputate. Morbi scelerisque tellus nec enim maximus, sed auctor turpis vulputate. Donec vulputate sem varius dui dapibus auctor. Ut aliquam efficitur risus id pretium. Vestibulum ultricies ex ut tellus pharetra, at viverra augue convallis. Vivamus consectetur orci nec eros luctus imperdiet. Quisque pretium neque in quam viverra vestibulum.</p>', '<p><span style=\"color: rgb(102, 102, 102);\"><b>Dijital Geleceğinizi Sadece KODLAMIYORUZ, İNŞA EDİYORUZ</b></span></p><p><br></p><div bis_skin_checked=\"1\"><br></div><p><br></p>');

-- --------------------------------------------------------

--
-- Table structure for table `yenileme_hatirlatmalar`
--

CREATE TABLE `yenileme_hatirlatmalar` (
  `hatirlatma_id` int(11) NOT NULL,
  `hatirlatma_abone` int(11) NOT NULL,
  `hatirlatma_uye` int(11) NOT NULL,
  `hatirlatma_gun` int(11) NOT NULL COMMENT '3 ya da 1 gün kala',
  `hatirlatma_tip` enum('mail','sms','ikisi') COLLATE utf8_turkish_ci NOT NULL DEFAULT 'ikisi',
  `hatirlatma_gonderildi` int(11) DEFAULT '0',
  `hatirlatma_gonderilme_tarihi` datetime DEFAULT NULL,
  `hatirlatma_olusturma_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yorumlar`
--

CREATE TABLE `yorumlar` (
  `yorum_id` int(11) NOT NULL,
  `yorum_icerik` longtext COLLATE utf8_turkish_ci NOT NULL,
  `yorum_isim` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `yorum_resim` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `yorum_link` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `yorumlar`
--

INSERT INTO `yorumlar` (`yorum_id`, `yorum_icerik`, `yorum_isim`, `yorum_resim`, `yorum_link`) VALUES
(1, ' Ut nec arcu ut tortor volutpat posuere non eu justo. \r\nPellentesque elementum ultricies enim a elementum. Integer feugiat sagittis diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Bet??l Bayer', 'assets/img/yorumlar/2679829691.jpg', ''),
(2, ' consectetur adipiscing elit. Ut nec arcu ut tortor volutpat posuere non eu justo.\r\nLorem ipsum dolor sit amet, Pellentesque elementum ultricies enim a elementum. Integer feugiat sagittis diam. ', 'Y??ld??z Ceren', 'assets/img/yorumlar/2496031920.jpg', ''),
(3, 'Pellentesque elementum ultricies enim a elementum. Integer feugiat sagittis diam.\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nec arcu ut tortor volutpat posuere non eu justo.  ', 'Fatma Nagihan', 'assets/img/yorumlar/2273220786.jpg', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abonelikler`
--
ALTER TABLE `abonelikler`
  ADD PRIMARY KEY (`abone_id`),
  ADD KEY `abone_uye` (`abone_uye`),
  ADD KEY `abone_urun` (`abone_urun`);

--
-- Indexes for table `abonelik_odemeler`
--
ALTER TABLE `abonelik_odemeler`
  ADD PRIMARY KEY (`odeme_id`),
  ADD KEY `odeme_abone` (`odeme_abone`),
  ADD KEY `odeme_uye` (`odeme_uye`);

--
-- Indexes for table `ayar`
--
ALTER TABLE `ayar`
  ADD PRIMARY KEY (`ayar_id`);

--
-- Indexes for table `ayar_kredi_karti`
--
ALTER TABLE `ayar_kredi_karti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bilgi`
--
ALTER TABLE `bilgi`
  ADD PRIMARY KEY (`bilgi_id`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`blog_id`);

--
-- Indexes for table `counter`
--
ALTER TABLE `counter`
  ADD PRIMARY KEY (`counter_id`);

--
-- Indexes for table `demo`
--
ALTER TABLE `demo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `destek`
--
ALTER TABLE `destek`
  ADD PRIMARY KEY (`destek_id`);

--
-- Indexes for table `destekmesaj`
--
ALTER TABLE `destekmesaj`
  ADD PRIMARY KEY (`destekmesaj_id`);

--
-- Indexes for table `duyuru`
--
ALTER TABLE `duyuru`
  ADD PRIMARY KEY (`duyuru_id`);

--
-- Indexes for table `eklenti`
--
ALTER TABLE `eklenti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flink`
--
ALTER TABLE `flink`
  ADD PRIMARY KEY (`flink_id`);

--
-- Indexes for table `fmenu`
--
ALTER TABLE `fmenu`
  ADD PRIMARY KEY (`fmenu_id`);

--
-- Indexes for table `hesap`
--
ALTER TABLE `hesap`
  ADD PRIMARY KEY (`hesap_id`);

--
-- Indexes for table `hit`
--
ALTER TABLE `hit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hizmetler`
--
ALTER TABLE `hizmetler`
  ADD PRIMARY KEY (`hizmet_id`);

--
-- Indexes for table `il`
--
ALTER TABLE `il`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iletisim`
--
ALTER TABLE `iletisim`
  ADD PRIMARY KEY (`iletisim_id`);

--
-- Indexes for table `kategoriler`
--
ALTER TABLE `kategoriler`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `kategorilerb`
--
ALTER TABLE `kategorilerb`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `kategoripaket`
--
ALTER TABLE `kategoripaket`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `kategoriproje`
--
ALTER TABLE `kategoriproje`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `kredi_karti_odemesi`
--
ALTER TABLE `kredi_karti_odemesi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kullanici`
--
ALTER TABLE `kullanici`
  ADD PRIMARY KEY (`kullanici_id`);

--
-- Indexes for table `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`mail_id`);

--
-- Indexes for table `markalar`
--
ALTER TABLE `markalar`
  ADD PRIMARY KEY (`hizmet_id`);

--
-- Indexes for table `mesajlar`
--
ALTER TABLE `mesajlar`
  ADD PRIMARY KEY (`mesaj_id`);

--
-- Indexes for table `meta`
--
ALTER TABLE `meta`
  ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `motor`
--
ALTER TABLE `motor`
  ADD PRIMARY KEY (`motor_id`);

--
-- Indexes for table `odeme`
--
ALTER TABLE `odeme`
  ADD PRIMARY KEY (`odeme_id`);

--
-- Indexes for table `odemebildirim`
--
ALTER TABLE `odemebildirim`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `omenu`
--
ALTER TABLE `omenu`
  ADD PRIMARY KEY (`omenu_id`);

--
-- Indexes for table `paytr`
--
ALTER TABLE `paytr`
  ADD PRIMARY KEY (`paytr_id`);

--
-- Indexes for table `projeler`
--
ALTER TABLE `projeler`
  ADD PRIMARY KEY (`proje_id`);

--
-- Indexes for table `randevu`
--
ALTER TABLE `randevu`
  ADD PRIMARY KEY (`randevu_id`);

--
-- Indexes for table `referanslar`
--
ALTER TABLE `referanslar`
  ADD PRIMARY KEY (`referans_id`);

--
-- Indexes for table `resim`
--
ALTER TABLE `resim`
  ADD PRIMARY KEY (`resim_id`);

--
-- Indexes for table `resimgaleri`
--
ALTER TABLE `resimgaleri`
  ADD PRIMARY KEY (`resim_id`);

--
-- Indexes for table `sayfalar`
--
ALTER TABLE `sayfalar`
  ADD PRIMARY KEY (`sayfa_id`);

--
-- Indexes for table `shopier`
--
ALTER TABLE `shopier`
  ADD PRIMARY KEY (`shopier_id`);

--
-- Indexes for table `siparis`
--
ALTER TABLE `siparis`
  ADD PRIMARY KEY (`siparis_id`);

--
-- Indexes for table `slayt`
--
ALTER TABLE `slayt`
  ADD PRIMARY KEY (`slayt_id`);

--
-- Indexes for table `smenu`
--
ALTER TABLE `smenu`
  ADD PRIMARY KEY (`smenu_id`);

--
-- Indexes for table `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`sms_id`);

--
-- Indexes for table `sosyal`
--
ALTER TABLE `sosyal`
  ADD PRIMARY KEY (`sosyal_id`);

--
-- Indexes for table `sss`
--
ALTER TABLE `sss`
  ADD PRIMARY KEY (`sss_id`);

--
-- Indexes for table `surun`
--
ALTER TABLE `surun`
  ADD PRIMARY KEY (`surun_id`);

--
-- Indexes for table `urunler`
--
ALTER TABLE `urunler`
  ADD PRIMARY KEY (`urun_id`);

--
-- Indexes for table `uye`
--
ALTER TABLE `uye`
  ADD PRIMARY KEY (`uye_id`);

--
-- Indexes for table `videogaleri`
--
ALTER TABLE `videogaleri`
  ADD PRIMARY KEY (`video_id`);

--
-- Indexes for table `whatsapp`
--
ALTER TABLE `whatsapp`
  ADD PRIMARY KEY (`whats_id`);

--
-- Indexes for table `widget`
--
ALTER TABLE `widget`
  ADD PRIMARY KEY (`widget_id`);

--
-- Indexes for table `yenileme_hatirlatmalar`
--
ALTER TABLE `yenileme_hatirlatmalar`
  ADD PRIMARY KEY (`hatirlatma_id`),
  ADD KEY `hatirlatma_abone` (`hatirlatma_abone`),
  ADD KEY `hatirlatma_uye` (`hatirlatma_uye`);

--
-- Indexes for table `yorumlar`
--
ALTER TABLE `yorumlar`
  ADD PRIMARY KEY (`yorum_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abonelikler`
--
ALTER TABLE `abonelikler`
  MODIFY `abone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `abonelik_odemeler`
--
ALTER TABLE `abonelik_odemeler`
  MODIFY `odeme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ayar`
--
ALTER TABLE `ayar`
  MODIFY `ayar_id` int(1) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ayar_kredi_karti`
--
ALTER TABLE `ayar_kredi_karti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bilgi`
--
ALTER TABLE `bilgi`
  MODIFY `bilgi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `counter`
--
ALTER TABLE `counter`
  MODIFY `counter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `demo`
--
ALTER TABLE `demo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `destek`
--
ALTER TABLE `destek`
  MODIFY `destek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `destekmesaj`
--
ALTER TABLE `destekmesaj`
  MODIFY `destekmesaj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `duyuru`
--
ALTER TABLE `duyuru`
  MODIFY `duyuru_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `eklenti`
--
ALTER TABLE `eklenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `flink`
--
ALTER TABLE `flink`
  MODIFY `flink_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `fmenu`
--
ALTER TABLE `fmenu`
  MODIFY `fmenu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `hesap`
--
ALTER TABLE `hesap`
  MODIFY `hesap_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hit`
--
ALTER TABLE `hit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `hizmetler`
--
ALTER TABLE `hizmetler`
  MODIFY `hizmet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `il`
--
ALTER TABLE `il`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `iletisim`
--
ALTER TABLE `iletisim`
  MODIFY `iletisim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kategoriler`
--
ALTER TABLE `kategoriler`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kategorilerb`
--
ALTER TABLE `kategorilerb`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kategoripaket`
--
ALTER TABLE `kategoripaket`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kategoriproje`
--
ALTER TABLE `kategoriproje`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kredi_karti_odemesi`
--
ALTER TABLE `kredi_karti_odemesi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kullanici`
--
ALTER TABLE `kullanici`
  MODIFY `kullanici_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mail`
--
ALTER TABLE `mail`
  MODIFY `mail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `markalar`
--
ALTER TABLE `markalar`
  MODIFY `hizmet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `mesajlar`
--
ALTER TABLE `mesajlar`
  MODIFY `mesaj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `meta`
--
ALTER TABLE `meta`
  MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `motor`
--
ALTER TABLE `motor`
  MODIFY `motor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `odeme`
--
ALTER TABLE `odeme`
  MODIFY `odeme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `odemebildirim`
--
ALTER TABLE `odemebildirim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `omenu`
--
ALTER TABLE `omenu`
  MODIFY `omenu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `paytr`
--
ALTER TABLE `paytr`
  MODIFY `paytr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `projeler`
--
ALTER TABLE `projeler`
  MODIFY `proje_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `randevu`
--
ALTER TABLE `randevu`
  MODIFY `randevu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `referanslar`
--
ALTER TABLE `referanslar`
  MODIFY `referans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `resim`
--
ALTER TABLE `resim`
  MODIFY `resim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT for table `resimgaleri`
--
ALTER TABLE `resimgaleri`
  MODIFY `resim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `sayfalar`
--
ALTER TABLE `sayfalar`
  MODIFY `sayfa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `shopier`
--
ALTER TABLE `shopier`
  MODIFY `shopier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `siparis`
--
ALTER TABLE `siparis`
  MODIFY `siparis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `slayt`
--
ALTER TABLE `slayt`
  MODIFY `slayt_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `smenu`
--
ALTER TABLE `smenu`
  MODIFY `smenu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `sms`
--
ALTER TABLE `sms`
  MODIFY `sms_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sosyal`
--
ALTER TABLE `sosyal`
  MODIFY `sosyal_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sss`
--
ALTER TABLE `sss`
  MODIFY `sss_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `surun`
--
ALTER TABLE `surun`
  MODIFY `surun_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `urunler`
--
ALTER TABLE `urunler`
  MODIFY `urun_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `uye`
--
ALTER TABLE `uye`
  MODIFY `uye_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `videogaleri`
--
ALTER TABLE `videogaleri`
  MODIFY `video_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `whatsapp`
--
ALTER TABLE `whatsapp`
  MODIFY `whats_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widget`
--
ALTER TABLE `widget`
  MODIFY `widget_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `yenileme_hatirlatmalar`
--
ALTER TABLE `yenileme_hatirlatmalar`
  MODIFY `hatirlatma_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `yorumlar`
--
ALTER TABLE `yorumlar`
  MODIFY `yorum_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `abonelikler`
--
ALTER TABLE `abonelikler`
  ADD CONSTRAINT `abonelikler_ibfk_1` FOREIGN KEY (`abone_uye`) REFERENCES `uye` (`uye_id`),
  ADD CONSTRAINT `abonelikler_ibfk_2` FOREIGN KEY (`abone_urun`) REFERENCES `urunler` (`urun_id`);

--
-- Constraints for table `abonelik_odemeler`
--
ALTER TABLE `abonelik_odemeler`
  ADD CONSTRAINT `abonelik_odemeler_ibfk_1` FOREIGN KEY (`odeme_abone`) REFERENCES `abonelikler` (`abone_id`),
  ADD CONSTRAINT `abonelik_odemeler_ibfk_2` FOREIGN KEY (`odeme_uye`) REFERENCES `uye` (`uye_id`);

--
-- Constraints for table `yenileme_hatirlatmalar`
--
ALTER TABLE `yenileme_hatirlatmalar`
  ADD CONSTRAINT `yenileme_hatirlatmalar_ibfk_1` FOREIGN KEY (`hatirlatma_abone`) REFERENCES `abonelikler` (`abone_id`),
  ADD CONSTRAINT `yenileme_hatirlatmalar_ibfk_2` FOREIGN KEY (`hatirlatma_uye`) REFERENCES `uye` (`uye_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
