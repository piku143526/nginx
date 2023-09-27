#!/bin/bash
sudo sudo apt update -y
sudo mkdir -p  /var/www/vhosts/frontend
sudo chown -R $USER:$USER /var/www/vhosts/frontend/
cd /var/www/vhosts/frontend/
sudo apt install nginx -y
sudo systemctl start nginx
cd /etc/nginx/conf.d/
sudo chmod 757 /etc/nginx/conf.d/
cd /etc/nginx/conf.d/
sudo wget  https://github.com/piku143526/nginx/raw/main/api.conf
sudo wget  https://github.com/piku143526/nginx/raw/main/app.conf
sudo chmod 755 /etc/nginx/conf.d/
cd /var/www/vhosts/frontend/
sudo wget https://github.com/piku143526/nginx/raw/main/index.html
sudo ssystemctl restart nginx
sudo systemctl enable nginx
sudo systemctl status nginx