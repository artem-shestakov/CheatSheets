## Linux programs to run/debug pods
- swapoff
- iptables
- mount
- systemd
- socat
- nsenter
- unshare
- ps

## Create pod in Linux
```shell
# Test files
touch /tmp/a /tmp/b /tmp/c

# Directory for isolated box
mkdir -p $HOME/box

# Create directory box
mkdir -p $HOME/box/bin
mkdir -p $HOME/box/lib
mkdir -p $HOME/box/lib64
mkdir -p $HOME/box/proc
mkdir -p $HOME/box/usr/lib
mkdir -p $HOME/box/data

# Copy binary files to box
cp -v /bin/kill $HOME/box/bin
cp -v /bin/ps $HOME/box/bin
cp -v /bin/bash $HOME/box/bin
cp -v /bin/ls $HOME/box/bin

# Copy libraries to box
sudo cp -r /lib/* $HOME/box/lib/
sudo cp -r /lib64/* $HOME/box/lib64/
sudo cp -r /usr/lib/* $HOME/box/usr/lib/

# Mount directories from host to box
sudo mount -t proc proc $HOME/box/proc
sudo mount --bind /tmp/ $HOME/box/data

# Create new namspaces
sudo unshare -p -n -f --mount-proc=$HOME/box/proc

# Create isolated process in new namespaces
chroot ./box /bin/bash

chmod +x ./chroot.sh
./chroot.sh

ls /     
bin  data  lib	lib64  proc  usr

ls /data/
a  b  c

ps
    PID TTY          TIME CMD
      1 ?        00:00:00 sh
      5 ?        00:00:00 bash
      6 ?        00:00:00 ps

ip a
1: lo: <LOOPBACK> mtu 65536 qdisc noop state DOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
```
