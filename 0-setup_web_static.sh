#!/usr/bin/env bash
# setup web servers for deployment of web static.

sudo apt-get -y update
sudo apt-get -y install nginx

sudo mkdir -p /data/web_static/
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p data/web_static/shared/

echo "ceci est mon propre page" > /data/web_static/releases/test/index.html

ln -s -f /data/web_static/releases/test/ /data/web_static/current

chown -R ubuntu /data/

printf %s "server {
        listen 80 default_server;
        listen [::]:80 default_server;
        add_header X-Served-By $HOSTNAME;
        root /var/www/html;
        index index.html index.htm;

        location /hbnb_static {
                alias /data/web_static/current;
                index index.html index.htm;
        }
        error_page 404 /404.html;
        location /404 {
                root /var/www/html;
                internal;
        }
}" > /etc/nginx/sites-available/default

sudo service nginx restart
