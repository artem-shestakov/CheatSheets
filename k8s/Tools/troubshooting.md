# Troubshooting
## Network
* **nsenter**
1. Identify the pod that's running the service.
```shell
kubectl get pods
```
2. Find the PID of the container running the pod.
```shell
ps aux
```
3. Once you've identified the PID, use the `nsenter` command to enter the container's network namespace. 
>The network namespace is located at `/proc/{PID}/ns/net`. 
```shell
nsenter -t {PID} -n.
```
3. Once you're inside the container's network namespace, you can use standard networking tools (such as ping, curl, or telnet) to test connectivity to the service.