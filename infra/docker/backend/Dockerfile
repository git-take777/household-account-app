FROM php:8.3-apache

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql gd zip

RUN a2enmod rewrite

COPY apache.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY init-laravel.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init-laravel.sh

CMD ["/usr/local/bin/init-laravel.sh"]