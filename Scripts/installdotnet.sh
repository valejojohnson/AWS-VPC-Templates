#!/bin/bash -e

rpm -Uvh https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm
yum install dotnet-sdk-3.1 -y
yum update -y
yum upgrade -y
echo "linux-dotnet-server" > /etc/hostname
yum install wget -y
yum install -y httpd mariadb-server
service httpd start
chkconfig httpd on
usermod -a -G apache centos
chown -R centos:apache /var/www
echo "Deployed with Terraform!" > /var/www/html/index.html
service mariadb start
chkconfig mariadb on
sudo shutdown -r now