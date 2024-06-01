FROM php:8.2-fpm

# Install Nginx
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# Remove default server definition
RUN rm /etc/nginx/sites-enabled/default

# Add our Nginx server definition
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy PHP index file
COPY index.php /var/www/html/index.php

# Expose port 80
EXPOSE 80

# Start Nginx and PHP-FPM
CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
