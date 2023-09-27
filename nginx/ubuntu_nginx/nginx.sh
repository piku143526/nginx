#!/bin/bash
sudo sudo apt update -y
sudo mkdir -p  /var/www/vhosts/frontend
sudo chown -R $USER:$USER /var/www/vhosts/frontend/
cd /var/www/vhosts/frontend/
sudo apt install nginx -y
sudo systemctl start nginx.service
cd /etc/nginx/conf.d/
sudo chmod 757 /etc/nginx/conf.d/
cd /etc/nginx/conf.d/
sudo wget  https://github.com/piku143526/nginx/raw/main/nginx/ubuntu_nginx/api.conf
sudo wget  https://github.com/piku143526/nginx/raw/main/nginx/ubuntu_nginx/app.conf
sudo chmod 755 /etc/nginx/conf.d/
cd /var/www/vhosts/frontend/
sudo wget https://github.com/piku143526/nginx/raw/main/nginx/ubuntu_nginx/index.html
sudo ssystemctl restart nginx.service 
sudo systemctl enable nginx.service 
sudo systemctl status nginx.service 
