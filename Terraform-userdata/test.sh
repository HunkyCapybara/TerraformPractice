#! bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo service start httpd
sudo systemctl enable httpd
echo "<h1> Welcome to the your second created shell script for service install and html file</h1>" > /var/www/html/index.html

#-----To Install git -------
sudo yum install git -y