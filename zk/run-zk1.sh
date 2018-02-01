#!/bin/sh
docker rm -f zk1

docker run -d \
 --net=host \
 --name=zk1 \
 -e SERVER_ID=1 \
 -e ADDITIONAL_ZOOKEEPER_1=server.1=ip1:2888:3888 \
 -e ADDITIONAL_ZOOKEEPER_2=server.2=ip2:2888:3888 \
 -e ADDITIONAL_ZOOKEEPER_3=server.3=ip3:2888:3888 \
 -e ADDITIONAL_ZOOKEEPER_4=clientPort=2181 \
 -v /data/zookeeper:/tmp/zookeeper \
 garland/zookeeper