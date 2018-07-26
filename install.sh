#!/bin/sh
#-------------------------------
#author:jinlong              -              -
#email:he-jinlong@qq.com -
#-------------------------------
echo -e "\033[32m{`date`}[开始]初始化安装.............................\033[0m"
if [ ! $1 ]
then
    echo -e "\033[32m{`date`}请输入数字1，2，3.............................\033[0m"
    exit 1
elif [ $1 -lt 1 ]
then
    echo -e "\033[32m{`date`}数字不能小于1............................\033[0m"
    exit 2
elif [ $1 -gt 3 ]
then
    echo -e "\033[32m{`date`}数字不能大于3.............................\033[0m"
    exit 3
fi
cat host.conf >> /etc/hosts
cat sysctl.txt >> /etc/sysctl.conf
/sbin/sysctl -p
cat limits.txt >> /etc/security/limits.conf
echo -e "\033[32m{`date`}[结束]初始化安装.............................\033[0m"
echo -e "\033[32m{`date`}[开始]下载Java8.............................\033[0m"
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
echo -e "\033[32m{`date`}[结束]下载Java8.............................\033[0m"
echo -e "\033[32m{`date`}[开始]安装Java8.............................\033[0m"
chmod +x jdk-8u131-linux-x64.rpm 
rpm -ivh jdk-8u131-linux-x64.rpm
cat java.conf >> /etc/profile
source /etc/profile
java -version
echo -e "\033[32m{`date`}[结束]安装Java8.............................\033[0m"
echo -e "\033[32m{`date`}[开始]下载ElasticSearch.............................\033[0m"
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.0.tar.gz
echo -e "\033[32m{`date`}[结束]下载ElasticSearch.............................\033[0m"
echo -e "\033[32m{`date`}[开始]安装ElasticSearch.............................\033[0m"
tar -zxvf elasticsearch-6.3.0.tar.gz 
mv elasticsearch-6.3.0 /usr/local/elasticsearch
echo -e "node.name: node-$1" >> /usr/local/elasticsearch/config/elasticsearch.yml
groupadd es
useradd es -g es -p 111111
mkdir /home/es/data
mkdir /home/es/logs
chown -R es:es /home/es
chown -R es:es /usr/local/elasticsearch
chmod +x /usr/local/elasticsearch/bin/*
chmod +x /usr/local/elasticsearch/modules/x-pack/x-pack-ml/platform/linux-x86_64/bin/*
su es -c "nohup /usr/local/elasticsearch/bin/elasticsearch -d &"
echo -e "\033[32m{`date`}[结束]安装ElasticSearch.............................\033[0m"
