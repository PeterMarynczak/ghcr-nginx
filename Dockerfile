# Use an official PHP image with Nginx
FROM richarvey/nginx-php-fpm:php8.2

# Copy the PHP file to the appropriate directory
COPY index.php /var/www/html/index.php

# Expose port 80 to the outside world
EXPOSE 80
