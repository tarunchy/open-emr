FROM alpine:3.14

# Install required packages
RUN apk update && apk add --no-cache \
    apache2 \
    php7 \
    php7-apache2 \
    php7-mysqli \
    git \
    wget

# Download and install OpenEMR
RUN git clone https://github.com/openemr/openemr.git /var/www/localhost/htdocs/openemr
RUN chown -R apache:apache /var/www/localhost/htdocs/openemr

# Copy custom configuration files
COPY openemr.conf /etc/apache2/httpd.conf
COPY php.ini /etc/php7/php.ini

# Enable Apache modules
RUN sed -i 's/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/g' /etc/apache2/httpd.conf
RUN sed -i 's/DirectoryIndex\ index.html/DirectoryIndex\ index.php/g' /etc/apache2/httpd.conf

# Expose ports for Apache and MySQL
EXPOSE 80

# Start Apache service
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

