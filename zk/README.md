### About Zookeeper
分布式发现服务
```
docker pull garland/zookeeper
```
### 官方zookeeper镜像
默认配置如下
```
clientPort=2181
dataDir=/tmp/zookeeper
dataLogDir=//tmp/zookeeper
tickTime=2000
initLimit=5
syncLimit=2
maxClientCnxns=60

server.1=localhost:2881:3881
server.2=localhost:2882:3882
server.3=localhost:2883:3883
```
### 查看启动状态
* echo stat | nc 127.0.0.1 2181
### zk集群
```
server.1=ip:port1:port2
```
* port1: Leader和Follower或Observer交换数据使用的
* port2: 用于Zookeeper选举用的
### 容器持久化
* 磁盘挂载-v /data/zk1:/tmp/zookeeper