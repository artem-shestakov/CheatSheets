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

## Tools
### Logs
* [kubetail](https://github.com/johanhaleby/kubetail)
* [Stern](https://github.com/stern/stern)
* [Kail](https://github.com/boz/kail?tab=readme-ov-file)
* [Logcli](https://grafana.com/docs/loki/latest/query/logcli/)