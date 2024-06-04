#!/bin/bash

# Update package lists
sudo apt update -y

# Create directory for the frontend
sudo mkdir -p /var/www/vhosts/frontend

# Change ownership of the frontend directory to the current user
sudo chown -R $USER:$USER /var/www/vhosts/frontend/

# Navigate to the frontend directory
cd /var/www/vhosts/frontend/

# Install Nginx
sudo apt install nginx -y

# Start Nginx service
sudo systemctl start nginx.service

# Navigate to Nginx configuration directory
cd /etc/nginx/conf.d/

# Adjust permissions for the configuration directory
sudo chmod 757 /etc/nginx/conf.d/

# Download the configuration files
sudo wget https://github.com/piku143526/nginx/raw/main/nginx/ubuntu_nginx/api.conf
sudo wget https://github.com/piku143526/nginx/raw/main/nginx/ubuntu_nginx/app.conf

# Set appropriate permissions for the configuration directory
sudo chmod 755 /etc/nginx/conf.d/

# Navigate back to the frontend directory
cd /var/www/vhosts/frontend/

# Download the index.html file
sudo wget https://github.com/piku143526/nginx/raw/main/nginx/ubuntu_nginx/index.html

# Install Certbot and the Python3 Certbot Nginx package
sudo apt install certbot python3-certbot-nginx -y

# Edit nginx.conf to include 'server_tokens off;'
if [ -f /etc/nginx/nginx.conf ]; then
  sudo sed -i '/http {/a \\tserver_tokens off;' /etc/nginx/nginx.conf
else
  echo "nginx.conf not found!"
  exit 1
fi

# Restart and enable Nginx service
sudo systemctl restart nginx.service
sudo systemctl enable nginx.service

# Check the status of Nginx service
sudo systemctl status nginx.service
