#!/bin/bash

# Execute in case of development mode with volumes
if [ ! -z ${EXECUTE_COMPOSER_DEV_INSTALL+x} ]; then
    composer install --no-interaction
else
    composer install --no-dev --no-interaction
fi

composer clear-cache
php /app/artisan optimize
