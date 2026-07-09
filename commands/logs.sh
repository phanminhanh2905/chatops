#!/bin/bash

handle_logs() {

    local chat_id="$1"
    local app="$2"

    if [ -z "$app" ]; then
        send_message "$chat_id" "⚠️ Usage:

/logs <deployment>

Ví dụ:

/logs user-service"

        return
    fi

    pod=$(get_latest_pod "$app")

    if [ $? -ne 0 ]; then

        send_message "$chat_id" "❌ Kubernetes Error

$pod"

        return

    fi

    if [ -z "$pod" ]; then

        send_message "$chat_id" "❌ Không tìm thấy Pod chứa:

$app"

        return

    fi

    logs=$(get_logs "$pod")

    if [ $? -ne 0 ]; then

        send_message "$chat_id" "❌ Kubernetes Error

$logs"

        return

    fi

    message="📄 Logs

Namespace : ${K8S_NAMESPACE}

Pod :

${pod}

────────────────────────────

${logs}"

    send_message "$chat_id" "$message"

}
