# K8s
## Playgrounds
>For libvirt
### Network

* Create network
[Network for playground](./playgrounds/k8s_net.xml)
```shell
virsh net-define --file k8s_net.xml 
virsh net-start k8s-network
virsh net-autostart --network k8s-network
```
### Create environment
1. Select type in directory `playgrounds`
2. Create VMs
```shell
vagrant up
```

## Tools
### Logs
* [kubetail](https://github.com/johanhaleby/kubetail)
* [Stern](https://github.com/stern/stern)
* [Kail](https://github.com/boz/kail?tab=readme-ov-file)
* [Logcli](https://grafana.com/docs/loki/latest/query/logcli/)