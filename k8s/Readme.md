# K8s
## Playgrounds
## Vagrant
>For libvirt
### Network

1. Create network file
Use file [Network for playground](./playgrounds/k8s_net.xml)
2. Run commands
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

### Setup cluster
1. Install requiremenst
```shell
ansible-galaxy collection install -r requirements.yaml --force
```
2. Setup cluster
```shell
ansible-playbook -i inventory/inventory.yaml -u vagrant install.yaml
```

## Kind
### Run Cluster
* Without CNI 
```shell
cat <<EOF > multinode.yaml             
kind: Cluster  
apiVersion: kind.x-k8s.io/v1alpha4
networking:
    disableDefaultCNI: true
    podSubnet: 192.168.0.0/16 # For default Calico subnet
nodes:
    - role: control-plane      image: kindest/node:v1.29.2@sha256:acc9e82a5a5bd3dfccfd03117e9ef5f96b46108b55cd647fb5e7d0d1a35c9c6f
    - role: worker
EOF

kind create cluster --name multinode --config multinode.yaml
```

## Tools
### Logs
* [kubetail](https://github.com/johanhaleby/kubetail)
* [Stern](https://github.com/stern/stern)
* [Kail](https://github.com/boz/kail?tab=readme-ov-file)
* [Logcli](https://grafana.com/docs/loki/latest/query/logcli/)