#!/bin/sh

# Clone the OpenEMR Git repository
git clone https://github.com/openemr/openemr.git /var/www/localhost/htdocs/openemr

# Set the appropriate ownership for the Apache web server
chown -R apache:apache /var/www/localhost/htdocs/openemr

# Copy the OpenEMR configuration file
cp /var/www/localhost/htdocs/openemr/sites/default/sqlconf.php /var/www/localhost/htdocs/openemr/sites/default/sqlconf.php.original

# Install OpenEMR
cd /var/www/localhost/htdocs/openemr
bash docker-demo.sh

# Load the sample data
php /var/www/localhost/htdocs/openemr/contrib/util/load_demo.php

