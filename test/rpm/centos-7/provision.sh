#!/bin/bash

yum install -y \
  java-1.8.0-openjdk \
  python

rpm -Uvh http://archive.cloudera.com/cdh4/one-click-install/redhat/6/x86_64/cloudera-cdh-4-0.x86_64.rpm
yum -y install zookeeper-server
service zookeeper-server init
systemctl start zookeeper-server

rpm -Uvh http://repos.mesosphere.io/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm
yum -y install mesos-0.22.0
systemctl start mesos-slave mesos-master
