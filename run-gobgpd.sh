#!/bin/bash

export ID=$1
echo processing $ID gobgpd

#tmux -c "/home/vagrant/gowork/bin/gobgpd -f /vagrant/gobgp.$ID.conf &"
cp /vagrant/gobgpd /etc/init.d/gobgpd
chmod +x /etc/init.d/gobgpd
update-rc.d gobgpd defaults
/etc/init.d/gobgpd start
