#!/bin/bash

run_kubectl() {
    local cmd="$1"

    ssh \
        -o LogLevel=ERROR \
        k8s-cluster \
        "$cmd" 2>&1
}

#########################################
# Pods
#########################################

get_pods() {

    run_kubectl "
        kubectl get pods \
        -n ${K8S_NAMESPACE} \
        --no-headers
    "

}

#########################################
# Logs
#########################################


get_latest_pod() {

    local app="$1"

    run_kubectl "kubectl get pods -n ${K8S_NAMESPACE} --no-headers" \
    | grep "$app" \
    | tail -1 \
    | awk '{print $1}'
}

get_logs() {

    local pod="$1"

    run_kubectl "kubectl logs ${pod} -n ${K8S_NAMESPACE} --tail=10"

}
