#!/bin/bash

handle_pods() {

    local chat_id="$1"

    pods=$(get_pods)

    if [ $? -ne 0 ]; then
        send_message "$chat_id" "❌ Kubernetes Error

$pods"
        return
    fi

    if [ -z "$pods" ]; then
        send_message "$chat_id" "⚠️ Namespace '${K8S_NAMESPACE}' không có Pod nào."
        return
    fi

    pod_count=$(echo "$pods" | grep -c .)

    message="☸ Kubernetes Cluster

Namespace : ${K8S_NAMESPACE}
Pods      : ${pod_count}

────────────────────────────

"

    while read -r name ready status restarts age
    do

        # Xóa ReplicaSet hash + Pod ID
        display_name=$(echo "$name" | sed -E 's/-[a-z0-9]{9,}-[a-z0-9]{5}$//')
        display_name=$(echo "$display_name" | sed 's/-deployment$//')

        case "$status" in
            Running)
                icon="🟢"
                ;;
            Pending)
                icon="🟡"
                ;;
            Succeeded)
                icon="🔵"
                ;;
            Failed)
                icon="🔴"
                ;;
            *)
                icon="⚪"
                ;;
        esac

        message="${message}${icon} ${display_name}

Ready    : ${ready}
Status   : ${status}
Restarts : ${restarts}
Age      : ${age}

────────────────────────────

"

    done <<< "$pods"

    message="${message}
📊 Total Pods : ${pod_count}"

    send_message "$chat_id" "$message"

}
