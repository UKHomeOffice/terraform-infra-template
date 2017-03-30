#!/bin/bash

# NASTY BUG IN AWS EC2 - Makes instance unresponsive due to IRQ 4
# dmesg >> 
# serial8250: too much work for irq4
ulimit -n 64000

# Create file system on the /dev/xvdh
mkfs.ext4 /dev/xvdh

# Create /opt/example directory
mkdir -p /opt/example

# Set up fstab to use /dev/xvdh
echo "/dev/xvdh	/opt/example	auto	defaults,nobootwait,comment=cloudconfig	0	2" >> /etc/fstab

# Mount the disk in /opt/example
mount /dev/xvdh /opt/example
