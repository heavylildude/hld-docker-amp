# Dockerfile

# Start with the official PHP 8.2 Apache image, it's a solid base
FROM php:8.2-apache

# Copy in our custom php settings
COPY my-php-settings.ini /usr/local/etc/php/conf.d/my-php-settings.ini

# Install all the PHP extensions you could want. The whole shebang. 💪
RUN apt-get update && apt-get install -y \
    libfreetype-dev \
    libjpeg-dev \
    libpng-dev \
    libzip-dev \
    libicu-dev \
    libonig-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo pdo_mysql zip intl mbstring opcache \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# This is the secret sauce. Enable rewrite for .htaccess and ssl for https. No cap.
RUN a2enmod rewrite ssl

# Copy our custom Apache config to enable HTTPS and .htaccess
COPY ./apache.conf /etc/apache2/sites-available/000-default.conf
