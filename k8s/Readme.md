# K8s
## Test Environment
>For libvirt
### Network
* Create natwork
```shell
virsh net-define --file k8s_net.xml 
virsh net-start k8s-network
virsh net-autostart --network k8s-network
```
### Create
```shell
vagrant up
```