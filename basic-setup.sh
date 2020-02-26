#!/bin/bash

hostname=$(hostname)

# install gobgp
cp /tmp/gobgpd.conf /etc
apt-get install gobgpd

whoami
printenv

