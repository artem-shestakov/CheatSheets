# Ceph

## Playground
### Network

1. Create network file
Use file [Network for playground](./playgrounds/k8s_net.xml)
2. Run commands
```shell
virsh net-define --file ceph_net.xml
virsh net-define --file ceph_public_net.xml
virsh net-start ceph-network
virsh net-start ceph-public-network
virsh net-autostart --network ceph-network
virsh net-autostart --network ceph-public-network
```
### Create environment
1. Select type in directory `playgrounds`
2. Create VMs
```shell
vagrant up
```

## Cephadm deploy
```shell
wget https://download.ceph.com/debian-18.2.0/pool/main/c/ceph/cephadm_18.2.0-1jammy_amd64.deb
dpkg -i cephadm_18.2.0-1jammy_amd64.deb

cephadm bootstrap --mon-ip 10.100.2.11 --cluster-network 10.100.2.0/25 --ssh-user vagrant
```

## Kubernetes
```yaml
---
apiVersion: v1
kind: ConfigMap
data:
  config.json: |-
    [
      {
        "clusterID": "c84eb914-de3d-11ee-9580-453a9a3918ad",
        "monitors": [
          "10.100.2.11:6789",
          "10.100.2.12:6789",
          "10.100.2.13:6789"
        ]
      }
    ]
metadata:
  name: ceph-csi-config

---
apiVersion: v1
kind: ConfigMap
data:
  config.json: |-
    {}
metadata:
  name: ceph-csi-encryption-kms-config

---
apiVersion: v1
kind: ConfigMap
data:
  ceph.conf: |
    [global]
    auth_cluster_required = cephx
    auth_service_required = cephx
    auth_client_required = cephx
  # keyring is a required key and its value should be empty
  keyring: |
metadata:
  name: ceph-config

---
apiVersion: v1
kind: Secret
metadata:
  name: csi-rbd-secret
  namespace: default
stringData:
  userID: kubernetes
  userKey: AQD5texlBajUNRAA2YoLRmakjaRjshEJkqVbNA==
```
