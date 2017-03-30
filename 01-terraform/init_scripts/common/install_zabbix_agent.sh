#!/bin/bash

# Add the zabbix repository
wget http://repo.zabbix.com/zabbix/3.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.0-1+trusty_all.deb -O /tmp/zabbix.deb
dpkg -i /tmp/zabbix.deb

apt-get update
apt-get install -y zabbix-agent
