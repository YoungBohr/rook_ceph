#!/bin/bash
NAMESPACE=$1
KEYWORD=$2
PV=$(kubectl get pvc -n mongodb | grep -v NAME | grep $KEYWORD | awk '{print$3}')
PVC=$(kubectl get pvc -n mongodb | grep -v NAME | grep $KEYWORD | awk '{print$1}')

function del_pvc() {
	if [[ ! ${PVC} ]];then
		return 0
	else
		for i in ${PVC};do
			kubectl delete  pvc $i -n $NAMESPACE
		done
	fi
}

function del_pv() {
	if [[ ! ${PV} ]];then
		return 0
	else
		for j in ${PV};do
		kubectl delete  pv  $j
		done
	fi
}

del_pvc
del_pv
