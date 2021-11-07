#!/bin/bash

hostname=$(hostname)

# disable systemd-resolved to fix DNS issue
# systemctl disable systemd-resolved.service
# systemctl stop systemd-resolved
# rm -f /etc/resolv.conf
# echo 'nameserver 10.0.0.1' > /etc/resolv.conf

# update apt cache
apt-get update -y

# install traceroute
apt-get install traceroute -y

# install gobgp
cp /tmp/gobgpd.conf /etc
apt-get install gobgpd -y
systemctl stop gobgpd
cd /tmp
wget -q https://github.com/osrg/gobgp/releases/download/v2.33.0/gobgp_2.33.0_linux_amd64.tar.gz
tar -xzf gobgp_2.33.0_linux_amd64.tar.gz
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
