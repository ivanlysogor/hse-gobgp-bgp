Vagrant.configure("2") do |config|
  config.vm.define "rt1" do |server|
    server.vm.box = "ubuntu/trusty64"

    # for outside world
    server.vm.network "private_network", ip: "10.10.0.10", netmask: "255.255.255.0"
    # for connection between rt1 and rt2
    server.vm.network "private_network", ip: "10.20.0.10", netmask: "255.255.255.0"
    # for inside world
    server.vm.network "private_network", ip: "172.20.10.1", netmask: "255.255.255.0"

    # do basic setup
    # server.vm.provision "shell", privileged: false, path: "basic-setup.sh"

    # run native bgpd
    # server.vm.provision "shell", path: "run-gobgpd.sh", args: "0"
  end

  config.vm.define "rt2" do |server|
    server.vm.box = "ubuntu/trusty64"

    # for outside world
    server.vm.network "private_network", ip: "10.10.0.20", netmask: "255.255.255.0"
    # for connection between rt1 and rt2
    server.vm.network "private_network", ip: "10.20.0.20", netmask: "255.255.255.0"
    # for inside world
    server.vm.network "private_network", ip: "172.20.20.1", netmask: "255.255.255.0"

    # do basic setup
    # server.vm.provision "shell", privileged: false, path: "basic-setup.sh"

    # run native bgpd
    # server.vm.provision "shell", path: "run-gobgpd.sh", args: "1"
  end

  config.vm.define "rt3" do |server|
    server.vm.box = "ubuntu/trusty64"

    # for outside world
    server.vm.network "private_network", ip: "10.10.0.20", netmask: "255.255.255.0"
    # for inside world
    server.vm.network "private_network", ip: "172.20.30.1", netmask: "255.255.255.0"

    # do basic setup
    # server.vm.provision "shell", privileged: false, path: "basic-setup.sh"

    # run native bgpd
    # server.vm.provision "shell", path: "run-gobgpd.sh", args: "2"
  end


end
