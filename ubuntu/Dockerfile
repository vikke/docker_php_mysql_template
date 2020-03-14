FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
ENV COMPOSER_ALLOW_SUPERUSER 1

COPY --from=php:7.4 /usr/local/bin/docker-php-* /usr/local/bin/
COPY --from=php:7.4 /usr/src/php.tar.* /usr/src/
COPY --from=php:7.4 /usr/local/bin/phpize /usr/local/bin/
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt update && \
    apt install -y php php-zip php-xdebug vim less
	# libzip-dev autoconf libfreetype6-dev libjpeg-turbo8-dev libpng-dev zip unzip git

#RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
#    && docker-php-ext-install -j$(nproc) gd mysqli pdo_mysql bcmath
ADD 000-default.conf /etc/apache2/sites-enabled/000-default.conf

CMD ["apache2ctl", "-D", "FOREGROUND"]
