FROM php:8.1.16-apache

# Instalar o cURL
RUN apt-get update \
    && apt-get install -y curl libcurl4 libcurl4-openssl-dev \
    && docker-php-ext-install curl

# Instalar o PDO MySQL
RUN docker-php-ext-install pdo pdo_mysql

# Habilitar a extensão pdo_mysql
RUN docker-php-ext-enable pdo_mysql

# Instalar o Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
EXPOSE 80
RUN service apache2 restart

