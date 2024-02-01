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

## Tips and Tricks
* To fast create yaml use `dry-run=client -o yaml > fiole.yaml`
```shell
k run web --image nginx --dry-run=client -o yaml > pod.yaml
k create deployment web --image nginx --replicas 3 --port=80 --dry-run=client -o yaml > deployment.yaml
```
