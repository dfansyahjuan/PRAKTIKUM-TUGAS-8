# Menggunakan base image PHP dengan Apache
FROM php:8.1-apache

# Menyalin source code ke dalam direktori root server web
COPY index.php /var/www/html/

# Mengekspos port 80
EXPOSE 80