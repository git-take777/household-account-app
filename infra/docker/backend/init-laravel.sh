#!/bin/bash

if [ ! -f "composer.json" ]; then
    composer create-project --prefer-dist laravel/laravel .
    chown -R www-data:www-data /var/www/html
    chmod -R 755 /var/www/html/storage
fi

apache2-foreground