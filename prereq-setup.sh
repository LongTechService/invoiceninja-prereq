#!/bin/bash
echo ""
echo "Please Wait! install will begin shortly..."
echo ""
sleep 5
apt update
apt upgrade -y
apt install apache2 -y
apt install python3-certbot-apache -y
apt install unzip -y
apt-get install software-properties-common
wget -O invoice-ninja.zip https://download.invoiceninja.com/
mkdir -p /var/www/
unzip invoice-ninja.zip -d /var/www/
mv /var/www/ninja /var/www/invoice-ninja
chown www-data:www-data /var/www/invoice-ninja/ -R
chmod 755 /var/www/invoice-ninja/storage/ -R
apt install mariadb-server -y
add-apt-repository ppa:ondrej/php
apt install php7.4-bcmath php7.4-gmp php7.4-fileinfo php7.4-gd php7.4-json php7.4-mbstring php7.4-pdo php7.4-xml php7.4-curl php7.4-zip php7.4-gmp php7.4-mysqlnd
a2dismod php7.4
a2dismod mpm_prefork
a2enmod mpm_event proxy_fcgi setenvif
systemctl restart apache2
mysql_secure_installation
