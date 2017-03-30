#!/bin/bash

# Add the java8 Repository
add-apt-repository -y ppa:webupd8team/java

# Enable the auto-accept questions for Java installation
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections

# Install Java packages
apt-get update
apt-get install -y oracle-java8-installer
