#!/bin/bash
apt update
apt install -y wget unzip  apache2
systemctl start apache2
systemctl enable apache2
wget https://www.tooplate.com/zip-templates/2137_barista_cafe.zip
unzip 2137_barista_cafe.zip
cp -r 2137_barista_cafe/* /var/www/html/
systemctl restart apache2