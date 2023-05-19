#!/bin/bash

# Install Java Development Kit (JDK)
sudo yum install -y java-1.8.0-openjdk

# Download and install Logstash
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch #imports the GPG key (for data integrity)
echo "[logstash-8.x]" | sudo tee /etc/yum.repos.d/logstash.repo
echo "name=Elastic repository for 8.x packages" | sudo tee -a /etc/yum.repos.d/logstash.repo
echo "baseurl=https://artifacts.elastic.co/packages/8.x/yum" | sudo tee -a /etc/yum.repos.d/logstash.repo
echo "gpgcheck=1" | sudo tee -a /etc/yum.repos.d/logstash.repo
echo "gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch" | sudo tee -a /etc/yum.repos.d/logstash.repo
echo "enabled=1" | sudo tee -a /etc/yum.repos.d/logstash.repo
echo "autorefresh=1" | sudo tee -a /etc/yum.repos.d/logstash.repo
echo "type=rpm-md" | sudo tee -a /etc/yum.repos.d/logstash.repo
sudo yum update
sudo yum install -y logstash

# Start Logstash service
sudo systemctl start logstash

# Enable Logstash service to start on boot
sudo systemctl enable logstash
