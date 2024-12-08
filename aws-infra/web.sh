#!/bin/bash

# Install necessary packages
sudo apt-get update -y
sudo apt-get install -y wget unzip nginx

# Start Nginx and enable it to start on boot
sudo systemctl start nginx
sudo systemctl enable nginx

# Download and unzip the template
wget https://www.tooplate.com/zip-templates/2117_infinite_loop.zip -P /tmp
unzip -o /tmp/2117_infinite_loop.zip -d /tmp

# Ensure /var/www/html/ exists, then copy the files
sudo mkdir -p /var/www/html/
sudo cp -r /tmp/2117_infinite_loop/* /var/www/html/

# Set permissions for the copied files
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/