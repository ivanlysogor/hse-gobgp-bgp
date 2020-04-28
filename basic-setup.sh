#!/bin/bash

hostname=$(hostname)

# install gobgp
cp /tmp/gobgpd.conf /etc
apt-get install gobgpd
systemctl stop gobgpd
cd /tmp
wget https://github.com/osrg/gobgp/releases/download/v2.15.0/gobgp_2.15.0_linux_amd64.tar.gz
tar -xzf gobgp_2.15.0_linux_amd64.tar.gz
cp gobgp /usr/bin
cp gobgpd /usr/bin


# install zebra
apt-get install quagga-core
systemctl stop zebra
cp /tmp/zebra.conf /etc/quagga/
mkdir /run/quagga
chown quagga:quagga /run/quagga

systemctl start zebra
systemctl start gobgpd

whoami
printenv
