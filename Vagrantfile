Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.define "rt1" do |server|
    server.vm.box = "generic/ubuntu1804"
    server.vm.hostname = "rt1"

    # Copy GoBGP config
    server.vm.provision "file", source: "gobgpd.rt1.conf", destination: "/tmp/gobgpd.conf"
    server.vm.provision "file", source: "zebra.conf", destination: "/tmp/zebra.conf"


    # for outside world
    server.vm.network "private_network", ip: "10.10.0.10", netmask: "255.255.255.0"
    # for connection between rt1 and rt2
    server.vm.network "private_network", ip: "10.20.0.10", netmask: "255.255.255.0"
    # for inside world
    server.vm.network "private_network", ip: "172.20.10.10", netmask: "255.255.255.0"

    # do basic setup
    server.vm.provision "shell", privileged: true, path: "basic-setup.sh"

  end

  config.vm.define "rt2" do |server|
    server.vm.box = "generic/ubuntu1804"
    server.vm.hostname = "rt2"

    # Copy GoBGP config
    server.vm.provision "file", source: "gobgpd.rt2.conf", destination: "/tmp/gobgpd.conf"
    server.vm.provision "file", source: "zebra.conf", destination: "/tmp/zebra.conf"

    # for outside world
    server.vm.network "private_network", ip: "10.10.0.20", netmask: "255.255.255.0"
    # for connection between rt1 and rt2
    server.vm.network "private_network", ip: "10.20.0.20", netmask: "255.255.255.0"
    # for inside world
    server.vm.network "private_network", ip: "172.20.20.10", netmask: "255.255.255.0"

    # do basic setup
    server.vm.provision "shell", privileged: true, path: "basic-setup.sh"

  end

  config.vm.define "rt3" do |server|
    server.vm.box = "generic/ubuntu1804"
    server.vm.hostname = "rt3"

    # Copy GoBGP config
    server.vm.provision "file", source: "gobgpd.rt3.conf", destination: "/tmp/gobgpd.conf"
    server.vm.provision "file", source: "zebra.conf", destination: "/tmp/zebra.conf"

    # for outside world
    server.vm.network "private_network", ip: "10.10.0.30", netmask: "255.255.255.0"
    # for inside world
    server.vm.network "private_network", ip: "172.20.30.10", netmask: "255.255.255.0"

    # do basic setup
    server.vm.provision "shell", privileged: true, path: "basic-setup.sh"

  end


end
