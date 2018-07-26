#!/bin/sh
#-------------------------------
#author:Jinlong              -              -
#email:hello21st@gmail.com-
#-------------------------------
echo -e "\033[32m{`date`}[Start] Initialize the installation.............................\033[0m"
if [ ! $1 ]
then
    echo -e "\033[32m{`date`}Please enter the number 1, 2, 3..............................\033[0m"
    exit 1
elif [ $1 -lt 1 ]
then
    echo -e "\033[32m{`date`}The number cannot be less than 1............................\033[0m"
    exit 2
elif [ $1 -gt 3 ]
then
    echo -e "\033[32m{`date`}The number cannot be greater than 3.............................\033[0m"
    exit 3
fi
cat host.conf >> /etc/hosts
cat sysctl.txt >> /etc/sysctl.conf
/sbin/sysctl -p
cat limits.txt >> /etc/security/limits.conf
echo -e "\033[32m{`date`}[End] Initialize the installation.............................\033[0m"
echo -e "\033[32m{`date`}[Start] Download Java8.............................\033[0m"
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
echo -e "\033[32m{`date`}[End] Download Java8.............................\033[0m"
echo -e "\033[32m{`date`}[Start] Install Java8.............................\033[0m"
chmod +x jdk-8u131-linux-x64.rpm 
rpm -ivh jdk-8u131-linux-x64.rpm
cat java.conf >> /etc/profile
source /etc/profile
java -version
echo -e "\033[32m{`date`}[End] Install Java8.............................\033[0m"
echo -e "\033[32m{`date`}[Start] Download ElasticSearch.............................\033[0m"
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.0.tar.gz
echo -e "\033[32m{`date`}[End] Download ElasticSearch.............................\033[0m"
echo -e "\033[32m{`date`}[Start] Install ElasticSearch.............................\033[0m"
tar -zxvf elasticsearch-6.3.0.tar.gz 
mv elasticsearch-6.3.0 /usr/local/elasticsearch
mv -f elasticsearch.yml /usr/local/elasticsearch/config
echo -e "\nnode.name: node-$1" >> /usr/local/elasticsearch/config/elasticsearch.yml
groupadd es
useradd es -g es -p 111111
mkdir /home/es/data
mkdir /home/es/logs
chown -R es:es /home/es
chown -R es:es /usr/local/elasticsearch
chmod +x /usr/local/elasticsearch/bin/*
chmod +x /usr/local/elasticsearch/modules/x-pack/x-pack-ml/platform/linux-x86_64/bin/*
su es -c "nohup /usr/local/elasticsearch/bin/elasticsearch -d &"
echo -e "\033[32m{`date`}[End] Install ElasticSearch.............................\033[0m"
