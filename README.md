# gobgp-vagrant-playground

vagrant-based playground for gobgp

### starting environment

```
% vagrant up
```

- This will setup 3 VMs (rt0, rt1 and rt2).
- Each gobgpd is executed in init script

### per-VM operation

#### Editing config

- Configuration file is placed in /vagrant/bgp.${VMID}.conf
- VMID is equivalent to instance ID(e.g. '0' for 'rt0')

#### Restart gobgpd

```
% sudo /etc/init.d/gobgpd stop
% sudo ID=${VMID} /etc/init.d/gobgpd start
```

- Specifying ID(VMID) is required to pick up corresponding configuration in /vagrant/bgp.${VMID}.conf

#### show log

```
% cat /var/log/syslog | grep bgp
```
