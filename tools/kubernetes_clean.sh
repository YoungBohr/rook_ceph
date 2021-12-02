#!/bin/bash
docker rm -f $(docker ps -qa)
docker volume rm $(docker volume ls -q)

rm -rf /usr/libexec/kubernetes/
rm -rf /etc/kubernetes/
rm -rf /var/cache/dnf/kubernetes*
rm -rf /var/lib/etcd /etc/kubernetes /etc/cni /opt/cni /var/lib/cni /var/run/calico
rm -rf /usr/libexec/kubernetes/
rm -rf /usr/lib/firewalld/services/etcd-client.xml
rm -rf /usr/lib/firewalld/services/etcd-server.xml
rm -rf /usr/lib/firewalld/services/kube-apiserver.xml
rm -rf /usr/lib/systemd/system/kubelet.service.d
find /* -name "*docker*" | xargs rm -rf
find /* -name "*container*" | xargs rm -rf


yum -y install docker-ce docker-ce-cli containerd.io
docker load -i /opt/k8s/kube-apiserver
docker load -i /opt/k8s/kube-controller-manager
docker load -i /opt/k8s/kube-proxy
docker load -i /opt/k8s/kube-scheduler
docker load -i /opt/k8s/pause
docker load -i /opt/k8s/coredns
docker load -i /opt/k8s/etcd

yum -y install kubeclt kubelet kubeadm
















helm install --namespace swat --name mysql-5.7 azure/mysql --set mysqlRootPassword=tta_2020,msyqlUser=zyc,mysqlPassword=zyc_1688 --set persistence.existingClaim=mysql-nfs-pvc01
helm install --namespace swat --name mongodb azure/mongodb --set auth.enabled=true --set auth.rootPassword=tta_2020 --set useStatefulSet=true --set directoryPerDB=true --set replicaCount=1 --set persistence.storageClass=nfs-client --set persistence.size=100Gi
helm install --namespace swat --name redis azure/redis --set password=tta_redis_1877 --set master.persistence.size=30Gi --set master.persistence.storageClass=nfs-client --set slave.persistence.size=30Gi --set slave.persistence.storageClass=nfs-client 
helm install --namespace swat --name kafka incubator/kafka --set replicas=1 --set persistence.storageClass=nfs-client --set persistence.size=30Gi --set zookeeper.storage=9Gi