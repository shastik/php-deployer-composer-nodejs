FROM --platform=linux/amd64 php:7.4-fpm-buster

RUN apt-get update -qq \
    && apt-get install -y rsync curl git zip unzip make bash libicu-dev g++ libzip-dev libpng-dev libbz2-dev libpq-dev gnupg sudo libpng-dev libjpeg-dev libfreetype6-dev \
    && pecl install apcu igbinary \
    && docker-php-ext-install zip exif bcmath sysvsem intl \
    && curl -sS https://getcomposer.org/installer | php \
        && mv composer.phar /usr/local/bin/composer \
    && echo 'extension=apcu' >> /usr/local/etc/php/php.ini \
    && echo 'apc.enable_cli=1' >> /usr/local/etc/php/php.ini \
    && echo 'apc.enable=1' >> /usr/local/etc/php/php.ini \
    && echo 'extension=igbinary' >> /usr/local/etc/php/php.ini \
    && curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash - \
        && apt-get install -y nodejs \
        && ln -sf /usr/bin/node /usr/bin/nodejs \
    && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev \
        && docker-php-ext-configure gd \
            --with-freetype \
            --with-jpeg \
        && docker-php-ext-install gd \
    && apt-get clean \
    && composer global require deployer/deployer \
    && composer global require deployer/recipes --dev

## Add Composer vendor into PATH
ENV PATH /root/.composer/vendor/bin:$PATH
