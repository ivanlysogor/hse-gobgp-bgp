#!/bin/bash

hostname=$(hostname)

# fix DNS resolving in some cases
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

# update apt cache
apt-get update -y

# install traceroute
apt-get install traceroute -y

# install gobgp
cp /tmp/gobgpd.conf /etc
apt-get install gobgpd -y
systemctl stop gobgpd
cd /tmp
wget -q https://github.com/osrg/gobgp/releases/download/v2.15.0/gobgp_2.15.0_linux_amd64.tar.gz
tar -xzf gobgp_2.15.0_linux_amd64.tar.gz
cp gobgp /usr/bin
cp gobgpd /usr/bin


# install zebra
apt-get install quagga-core -y
systemctl stop zebra
cp /tmp/zebra.conf /etc/quagga/
mkdir /run/quagga
chown quagga:quagga /run/quagga

systemctl start zebra
systemctl start gobgpd

whoami
printenv
