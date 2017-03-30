#!/bin/bash

# Create nginx log directory
mkdir -p /opt/example/nginx/log
chown -R www-data:www-data /opt/example/nginx

# Link the log directory
ln -s /opt/example/nginx/log /var/log/nginx/example

# Move the config files into /etc/nginx
cp nginx/proxy_params /etc/nginx/
cp nginx/sites/* /etc/nginx/sites-available

# Enable the configured sites
cd /etc/nginx/sites-available
for site in *.conf ; do ln -s /etc/nginx/sites-available/$site /etc/nginx/sites-enabled/$site ; done

# Restart nginx
service nginx restart
