#!/bin/bash

# Execute in case of development mode with volumes
if [ ! -z ${EXECUTE_COMPOSER_DEV_INSTALL+x} ]; then
    composer install --no-interaction
    composer clear-cache
fi

php /app/artisan config:cache
php /app/artisan optimize
