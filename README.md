# Elasticsearch Install

One-click installation of Elasticsearch cluster.

## Version List:
* java:1.8.0_131
* elasticsearch:6.3.0


## Installation Steps:

### 1.Edit the cluster server host (write to the corresponding IP)
```
vim /etc/hosts
192.168.253.130 server1
192.168.253.131 server2
192.168.253.132 server3
```

### 2.Run the installation script (there is only one parameter, which is 1, 2, 3,  represents the corresponding server id)
```
chmod +x install.sh 
./install.sh 1
```
> 1 is to install server1, 2 is to install server2, 3 is to install server3

### 3.Access ES (change to the corresponding IP)
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

Email:hello21st@gmail.com

