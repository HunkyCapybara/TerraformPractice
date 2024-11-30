#! bin/bash
sudo yum install git -y
sudo yum install java-17-amazon-corretto -y
sudo yum install maven -y
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.97/bin/apache-tomcat-9.0.97.tar.gz
sudo tar -xvzf apache-tomcat-9.0.97.tar.gz #untar
cd apache-tomcat-9.0.97/
cd bin/
chmod +x startup.sh
sh startup.sh
