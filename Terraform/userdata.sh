#!/bin/bash
sudo apt update -y &&
sudo apt install -y nginx
echo "Hello Nginx Demo" > /var/www/html/index.html

while [ ! -d /opt/app/ ]; do echo Waiting for config directory; sleep 2; done
while [ -z "$(ls -A /opt/app/)" ]; do echo Waiting for config files; sleep 2; done