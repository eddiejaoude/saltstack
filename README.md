# Vagrant & Saltstack

Vagrant

> Create and configure lightweight, reproducible, and portable development environments.
> Run a single command — "vagrant up" — and sit back as Vagrant puts together your complete development environment. Say goodbye to the "works on my machine" excuse as Vagrant creates identical development environments for everyone on your team.

Resources:
- http://www.vagrantup.com

SaltStack

> Fast, scalable and flexible software for data center automation, from infrastructure and any cloud, to the entire application stack

Resources:
- http://www.saltstack.com


## What Receipts to load

Update /salt/roots/salt/top.sls with receipts to run

i.e.

```
base:
  '*':
    - base
    - mysql
    - webserver
```

## Updating VM with new Salt Receipts config

1. Vagrant halt
2. Vagrant up

-- or --

1. vagrant ssh
2. sudo salt-call --local state.highstate -l debug


## What is listening on which ports

1. vagrant ssh
2. netstat -an | grep LISTEN


```
tcp        0      0 127.0.0.1:3306          0.0.0.0:*               LISTEN
tcp        0      0 0.0.0.0:111             0.0.0.0:*               LISTEN
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN
tcp        0      0 0.0.0.0:45375           0.0.0.0:*               LISTEN
tcp6       0      0 :::111                  :::*                    LISTEN
tcp6       0      0 :::9200                 :::*                    LISTEN
tcp6       0      0 :::9300                 :::*                    LISTEN
tcp6       0      0 :::22                   :::*                    LISTEN
tcp6       0      0 :::49690                :::*                    LISTEN
unix  2      [ ACC ]     STREAM     LISTENING     824      /run/rpcbind.sock
unix  2      [ ACC ]     STREAM     LISTENING     6933     @/com/ubuntu/upstart
unix  2      [ ACC ]     STREAM     LISTENING     17229    /var/run/mysqld/mysqld.sock
unix  2      [ ACC ]     SEQPACKET  LISTENING     7012     /run/udev/control

```

## What Vagrant VMs are currently running
```
ps aux | grep 'vagrant' | grep -v 'grep' | grep -v 'vagrant ssh' | grep 'VMware Fusion' | awk '{split($23,array,/.vagrant/); print array[1]}'
```



