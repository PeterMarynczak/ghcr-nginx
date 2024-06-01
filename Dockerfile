# Use the official PHP image with Nginx and PHP-FPM
# Use the official PHP image with Nginx and PHP-FPM
FROM php:8.2-fpm

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Remove the default Nginx configuration file
RUN rm /etc/nginx/sites-enabled/default

# Copy the custom Nginx configuration file
COPY default.conf /etc/nginx/conf.d/

# Copy the PHP source code
COPY src /var/www/html

# Expose port 9090
EXPOSE 9090

# Start Nginx and PHP-FPM
CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
