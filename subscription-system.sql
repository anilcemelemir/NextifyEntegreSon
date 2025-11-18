-- 1. urunler tablosuna aylık ve yıllık fiyat alanları ekle
ALTER TABLE `urunler` 
ADD COLUMN `urun_aylik_fiyat` DECIMAL(10, 2) DEFAULT 0.00 AFTER `urun_fiyat`,
ADD COLUMN `urun_yillik_fiyat` DECIMAL(10, 2) DEFAULT 0.00 AFTER `urun_aylik_fiyat`;

-- 2. Abonelik kayıtlarını tutmak için tablo
CREATE TABLE IF NOT EXISTS `abonelikler` (
  `abone_id` int(11) NOT NULL AUTO_INCREMENT,
  `abone_uye` int(11) NOT NULL,
  `abone_urun` int(11) NOT NULL,
  `abone_tur` enum('aylik','yillik') NOT NULL,
  `abone_baslangic_tarih` datetime NOT NULL,
  `abone_bitis_tarih` datetime NOT NULL,
  `abone_son_odeme_tarih` datetime DEFAULT NULL,
  `abone_sonraki_odeme_tarih` datetime NOT NULL,
  `abone_durum` enum('aktif','iptal','bekleme') NOT NULL DEFAULT 'aktif',
  `abone_yil_sayisi` int(11) DEFAULT 1,
  `abone_tarih` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`abone_id`),
  FOREIGN KEY (`abone_uye`) REFERENCES `uye`(`uye_id`),
  FOREIGN KEY (`abone_urun`) REFERENCES `urunler`(`urun_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- 3. Abonelik ödemeleri (başarılı ve başarısız)
CREATE TABLE IF NOT EXISTS `abonelik_odemeler` (
  `odeme_id` int(11) NOT NULL AUTO_INCREMENT,
  `odeme_abone` int(11) NOT NULL,
  `odeme_uye` int(11) NOT NULL,
  `odeme_tutar` decimal(10,2) NOT NULL,
  `odeme_tur` enum('aylik','yillik') NOT NULL,
  `odeme_durum` enum('basarili','basarisiz','bekleme') NOT NULL DEFAULT 'bekleme',
  `odeme_tarih` datetime DEFAULT NULL,
  `odeme_basarisiz_neden` varchar(255) DEFAULT NULL,
  `odeme_referans` varchar(255) DEFAULT NULL,
  `odeme_olusturma_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`odeme_id`),
  FOREIGN KEY (`odeme_abone`) REFERENCES `abonelikler`(`abone_id`),
  FOREIGN KEY (`odeme_uye`) REFERENCES `uye`(`uye_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- 4. Yenileme hatırlatmaları (3 gün ve 1 gün kala)
CREATE TABLE IF NOT EXISTS `yenileme_hatirlatmalar` (
  `hatirlatma_id` int(11) NOT NULL AUTO_INCREMENT,
  `hatirlatma_abone` int(11) NOT NULL,
  `hatirlatma_uye` int(11) NOT NULL,
  `hatirlatma_gun` int(11) NOT NULL COMMENT '3 ya da 1 gün kala',
  `hatirlatma_tip` enum('mail','sms','ikisi') NOT NULL DEFAULT 'ikisi',
  `hatirlatma_gonderildi` int(11) DEFAULT 0,
  `hatirlatma_gonderilme_tarihi` datetime DEFAULT NULL,
  `hatirlatma_olusturma_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hatirlatma_id`),
  FOREIGN KEY (`hatirlatma_abone`) REFERENCES `abonelikler`(`abone_id`),
  FOREIGN KEY (`hatirlatma_uye`) REFERENCES `uye`(`uye_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;