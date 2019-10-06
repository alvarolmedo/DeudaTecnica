#!/bin/bash

## Execute as root

#Performance
echo vm.max_map_count=262144 >> /etc/sysctl.conf
echo fs.file-max=65536 >> /etc/sysctl.conf
sysctl -p
echo "* soft nofile 65536" >> /etc/security/limits.conf
ulimit -n 65536

#Dirs to be used by docker apps
mkdir /maven-repo
mkdir /jenkins_data
mkdir /postgresql_data
mkdir /sonarqube_conf
mkdir /sonarqube_data
mkdir /sonarqube_extensions
mkdir /sonarqube_bundled-plugins
chmod 777 /maven*
chmod 777 /jenkins*
chmod 777 /postgresql*
chmod 777 /sonarqube_*

#Docker network
docker network create sonarnet
