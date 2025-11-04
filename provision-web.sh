#!/usr/bin/env bash
set -e

sudo apt-get update -y
sudo apt-get install -y apache2 php libapache2-mod-php php-pgsql

# Copiar el sitio desde la carpeta compartida
sudo mkdir -p /var/www/html
sudo rm -rf /var/www/html/*
sudo cp -r /vagrant/www/* /var/www/html/

# Asegurar índice con PHP por delante
echo "<IfModule dir_module>
    DirectoryIndex index.php index.html
</IfModule>" | sudo tee /etc/apache2/mods-enabled/dir.conf > /dev/null

sudo systemctl enable apache2
sudo systemctl restart apache2
