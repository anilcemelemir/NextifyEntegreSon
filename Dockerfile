# Dockerfile
FROM php:7.2.34-apache

# Gerekli PHP eklentilerini kur
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Apache mod_rewrite aktif et
RUN a2enmod rewrite

# PHP ayarlarını düzenle
RUN echo "upload_max_filesize=64M" > /usr/local/etc/php/conf.d/uploads.ini \
 && echo "post_max_size=64M" >> /usr/local/etc/php/conf.d/uploads.ini \
 && echo "memory_limit=256M" >> /usr/local/etc/php/conf.d/uploads.ini

# Proje dosyalarını web root'a kopyala
COPY . /var/www/html/

# Çalışma dizini
WORKDIR /var/www/html/

EXPOSE 80
