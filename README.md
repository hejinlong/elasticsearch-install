# Elasticsearch Install

Elasticsearch集群一键安装

## 安装步骤：

### 1.编辑集群主机host（写入对应IP）
```
vim /etc/hosts
192.168.253.130 server1
192.168.253.131 server2
192.168.253.132 server3
```

### 2.运行安装脚本（参数只有一个，分别是1，2，3，代表相对应的server id）
```
chmod +x install.sh 
./install.sh 1
```
> 1是安装server1，2是安装server2, 3是安装server3

### 3.访问es（改成相应的ip地址）
```
curl http://127.0.0.1:9200

{
  "name" : "node-1",
  "cluster_name" : "es",
  "cluster_uuid" : "OyBBznkgTSG_c1WR8cieNA",
  "version" : {
    "number" : "6.3.0",
    "build_flavor" : "default",
    "build_type" : "zip",
    "build_hash" : "424e937",
    "build_date" : "2018-06-11T23:38:03.357887Z",
    "build_snapshot" : false,
    "lucene_version" : "7.3.1",
    "minimum_wire_compatibility_version" : "5.6.0",
    "minimum_index_compatibility_version" : "5.0.0"
  },
  "tagline" : "You Know, for Search"
}
```

ElasticSearch技术QQ群:837411704
