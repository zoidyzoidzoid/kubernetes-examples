# Fun with Cilium

## Quickstart

Example from http://docs.cilium.io/en/latest/gettingstarted/minikube/

### Setup Demo App and Cilium

Create Cilium deployment and demo app:

```
kubectl create -f https://raw.githubusercontent.com/cilium/cilium/master/examples/kubernetes/cilium.yaml
kubectl create -f https://raw.githubusercontent.com/cilium/cilium/master/examples/minikube/demo.yaml
```

List Cilium endpoints using CLI in Cilium pod:
```
kubectl -n kube-system exec $(kubectl -n kube-system get pods -l k8s-app=cilium -o=jsonpath='{.items[0].metadata.name}') cilium endpoint list
```

### L3/L4 Network Policy

Create example policy:
```
kubectl create -f https://raw.githubusercontent.com/cilium/cilium/master/examples/minikube/l3_l4_policy.yaml
```

Let's check on our updated endpoints:
```
kubectl -n kube-system exec $(kubectl -n kube-system get pods -l k8s-app=cilium -o=jsonpath='{.items[0].metadata.name}') cilium endpoint list
```

Now test from app2 and app3, where the first should print
`<html><body><h1>It works!</h1></body></html>` and the second will just
hang:
```
APP2_POD=$(kubectl get pods -l id=app2 -o jsonpath='{.items[0].metadata.name}')
SVC_IP=$(kubectl get svc app1-service -o jsonpath='{.spec.clusterIP}')
kubectl exec $APP2_POD -- curl -s $SVC_IP
```

```
APP3_POD=$(kubectl get pods -l id=app3 -o jsonpath='{.items[0].metadata.name}')
kubectl exec $APP3_POD -- curl -s $SVC_IP
```
