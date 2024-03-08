# Ceph

## Playground
### Network

1. Create network file
Use file [Network for playground](./playgrounds/k8s_net.xml)
2. Run commands
```shell
sudo virsh net-define --file ceph_net.xml
sudo virsh net-define --file ceph_public_net.xml 
sudo virsh net-start ceph-network
sudo virsh net-start ceph-public-network
sudo virsh net-autostart --network ceph-network
sudo virsh net-autostart --network ceph-public-network
```
### Create environment
1. Select type in directory `playgrounds`
2. Create VMs
```shell
vagrant up
```