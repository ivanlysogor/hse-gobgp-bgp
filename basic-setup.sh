#!/bin/bash

hostname=$(hostname)

# fix DNS resolving in some cases
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# install gobgp
cp /tmp/gobgpd.conf /etc
apt-get update -y
apt-get install gobgpd -y

whoami
printenv

