#!/bin/bash
sudo yum update -y
sudo mkdir -p  /var/www/vhosts/frontend
sudo chown ec2-user:ec2-user -R /var/www/vhosts/frontend/
cd /var/www/vhosts/frontend/
sudo amazon-linux-extras enable php7.4
sudo  yum install php-cli php-pdo php-fpm php-json php-mysqlnd php-xml php-mbstring git telnet -y
sudo chkconfig php-fpm on
sudo amazon-linux-extras install nginx1 -y
sudo service nginx start
cd /etc/nginx/conf.d/
sudo chmod 757 /etc/nginx/conf.d/
cd /etc/nginx/conf.d/
sudo wget  https://github.com/piku143526/nginx/raw/main/api.conf
sudo wget  https://github.com/piku143526/nginx/raw/main/app.conf
sudo chmod 755 /etc/nginx/conf.d/
cd /var/www/vhosts/frontend/
sudo wget https://github.com/piku143526/nginx/raw/main/index.html
sudo systemctl restart nginx.service
sudo systemctl enable nginx.service
sudo systemctl status nginx.service
