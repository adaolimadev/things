FROM php:8.1.16-apache

# Instalar o cURL
RUN apt-get update \
    && apt-get install -y curl libcurl4 libcurl4-openssl-dev \
    && docker-php-ext-install curl

# Instalar o PDO MySQL
RUN docker-php-ext-install pdo pdo_mysql

#install some base extensions
RUN apt-get install -y \
        libzip-dev \
        zip \
  && docker-php-ext-install zip

# Instalar o driver do mysqli
RUN docker-php-ext-install mysqli

# Habilitar a extensão pdo_mysql
RUN docker-php-ext-enable pdo_mysql

# Habilitar a extensão mysqli
RUN docker-php-ext-enable mysqli

# Instalar o Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
EXPOSE 80

COPY ./conf/000-default.conf /etc/apache2/sites-available/

RUN a2enmod rewrite

RUN service apache2 restart

# Instalar o Node.js e o NPM
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs
