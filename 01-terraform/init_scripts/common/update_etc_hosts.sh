#!/bin/bash

HOSTNAME=`hostname`
AWS_HOSTNAME=`hostname -A`

EXT_INET=`ifconfig eth0 | grep "inet addr"| cut -d : -f 2 | awk '{ print $1}'`

echo >> /etc/hosts
echo "# Added by INIT" >> /etc/hosts
#echo "127.0.0.1	${HOSTNAME}.common.env2.vpc.internal ${HOSTNAME}" >> /etc/hosts
echo "${EXT_INET}	${HOSTNAME}.common.env2.vpc.internal ${HOSTNAME}" >> /etc/hosts
echo "${EXT_INET}	${AWS_HOSTNAME}" >> /etc/hosts
