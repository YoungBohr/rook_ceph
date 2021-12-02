#kubernetes
##Deploy ceph cluster with rook
```
    git clone http://39.97.162.35:3000/zhanghuanrui/kubernetes.git
    kubectl apply -f ceph/common.yaml 
    kubectl apply -f ceph/operator.yaml
```
When all pods is running, Next need to deploy cluster.yaml, before that we need update some config.
```
    kubectl apply -f ceph/cluster.yaml
```
##Deploy mongodb cluster upon ceph
