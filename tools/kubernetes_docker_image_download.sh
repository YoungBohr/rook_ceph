#!/bin/bash
echo ""
echo "=========================================================="
echo "Pull Kubernetes v1.15.3 Images from aliyuncs.com ......"
echo "=========================================================="
 
MY_REGISTRY=registry.cn-hangzhou.aliyuncs.com/openthings
 
# 基本组件
docker pull ${MY_REGISTRY}/k8s-gcr-io-kube-apiserver:v1.15.3
docker pull ${MY_REGISTRY}/k8s-gcr-io-kube-controller-manager:v1.15.3
docker pull ${MY_REGISTRY}/k8s-gcr-io-kube-scheduler:v1.15.3
docker pull ${MY_REGISTRY}/k8s-gcr-io-kube-proxy:v1.15.3
docker pull ${MY_REGISTRY}/k8s-gcr-io-etcd:3.3.10
docker pull ${MY_REGISTRY}/k8s-gcr-io-pause:3.1
docker pull ${MY_REGISTRY}/k8s-gcr-io-coredns:1.3.1
 
# 修改tag
docker tag ${MY_REGISTRY}/k8s-gcr-io-kube-apiserver:v1.15.3 k8s.gcr.io/kube-apiserver:v1.15.3
docker tag ${MY_REGISTRY}/k8s-gcr-io-kube-scheduler:v1.15.3 k8s.gcr.io/kube-scheduler:v1.15.3
docker tag ${MY_REGISTRY}/k8s-gcr-io-kube-controller-manager:v1.15.3 k8s.gcr.io/kube-controller-manager:v1.15.3
docker tag ${MY_REGISTRY}/k8s-gcr-io-kube-proxy:v1.15.3 k8s.gcr.io/kube-proxy:v1.15.3
docker tag ${MY_REGISTRY}/k8s-gcr-io-etcd:3.3.10 k8s.gcr.io/etcd:3.3.10
docker tag ${MY_REGISTRY}/k8s-gcr-io-pause:3.1 k8s.gcr.io/pause:3.1
docker tag ${MY_REGISTRY}/k8s-gcr-io-coredns:1.3.1 k8s.gcr.io/coredns:1.3.1
 
## 删除镜像
docker rmi ${MY_REGISTRY}/k8s-gcr-io-kube-apiserver:v1.15.3
docker rmi ${MY_REGISTRY}/k8s-gcr-io-kube-controller-manager:v1.15.3
docker rmi ${MY_REGISTRY}/k8s-gcr-io-kube-scheduler:v1.15.3
docker rmi ${MY_REGISTRY}/k8s-gcr-io-kube-proxy:v1.15.3
docker rmi ${MY_REGISTRY}/k8s-gcr-io-etcd:3.3.10
docker rmi ${MY_REGISTRY}/k8s-gcr-io-pause:3.1
docker rmi ${MY_REGISTRY}/k8s-gcr-io-coredns:1.3.1
 
echo ""
echo "=========================================================="
echo "Pull Kubernetes v1.15.3 Images FINISHED."
echo "=========================================================="
