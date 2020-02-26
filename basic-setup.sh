#!/bin/bash

# install newer go
wget https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz >/dev/null 2>&1
tar zxvf go1.6.linux-amd64.tar.gz >/dev/null
mkdir $HOME/gowork
echo 'export GOROOT=$HOME/go' >> $HOME/.bashrc
echo 'export GOPATH=$HOME/gowork' >> $HOME/.bashrc
echo 'export PATH=$GOROOT/bin:$GOPATH/bin:$PATH' >> $HOME/.bashrc
source $HOME/.bashrc
export GOROOT=/home/vagrant/go
export GOPATH=/home/vagrant/gowork

# intall git
sudo aptitude install -y git tmux traceroute >/dev/null

# gobgp
go/bin/go get github.com/osrg/gobgp/gobgpd
go/bin/go get github.com/osrg/gobgp/gobgp
wget https://raw.githubusercontent.com/osrg/gobgp/master/tools/completion/gobgp-completion.bash 2>/dev/null
wget https://raw.githubusercontent.com/osrg/gobgp/master/tools/completion/gobgp-dynamic-completion.bash 2>/dev/null
wget https://raw.githubusercontent.com/osrg/gobgp/master/tools/completion/gobgp-static-completion.bash 2>/dev/null
echo 'source $HOME/gobgp-completion.bash' >> $HOME/.bashrc
whoami
printenv

