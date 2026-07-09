#!/bin/bash

handle_help() {

    local chat_id="$1"

    read -r -d '' HELP <<EOF
🤖 PMA DevOps Bot

=====================

🚀 CI/CD

/build <branch>
Trigger Pipeline

/status
Current Pipeline

/history
Latest Pipelines

/retry
Retry Pipeline

/cancel
Cancel Pipeline

=====================

☸ Kubernetes

/pods

/logs <deployment>

/restart <deployment>

/rollback <deployment>

/events

/top

=====================

💻 Server

/ram

/cpu

/disk

/uptime

=====================

📦 Harbor

/image

/images

=====================

/help

EOF

    send_message "$chat_id" "$HELP"

}
