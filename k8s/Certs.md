```shell
openssl x509 -in /etc/kubernetes/ssl/cert.pem -noout -enddate

kubectl get secrets -n <namespace> <secret-name> -o jsonpath='{.data.tls\.crt}' | base64 --decode | openssl x509 -noout -enddate
```