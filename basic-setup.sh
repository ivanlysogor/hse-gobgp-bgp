#!/bin/bash

hostname=$(hostname)

# fix DNS resolving in some cases
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# update apt cache
apt-get update -y

# install gobgp
cp /tmp/gobgpd.conf /etc
apt-get install gobgpd -y

# install traceroute
apt-get install traceroute -y

whoami
printenv

