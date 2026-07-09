#!/bin/bash

source config.sh
source utils.sh
source commands/build.sh
source commands/help.sh
source commands/status.sh
source utils/gitlab.sh
source utils/kubernetes.sh
source commands/pods.sh
source utils/k8s_helper.sh
source commands/logs.sh

handle_build "$chat_id" "$branch" "$user_id"

# Lấy tin nhắn mới
function get_updates() {
    offset="$1"
    response=$(curl -s "https://api.telegram.org/bot$TOKEN/getUpdates?offset=$offset")
    echo "$response"
}

offset=0

while true; do
    updates=$(get_updates $offset)
    message_count=$(echo "$updates" | jq '.result | length')

    if [ "$message_count" -gt 0 ]; then
        for (( i = 0; i < $message_count; i++ )); do
            chat_id=$(echo "$updates" | jq -r ".result[$i].message.chat.id")
            user_id=$(echo "$updates" | jq -r ".result[$i].message.from.id")
            text=$(echo "$updates" | jq -r ".result[$i].message.text")

            command=$(echo "$text" | awk '{print $1}')
            case "$command" in
	    # Help command
            "/help")
                handle_help "$chat_id"
                ;;

	    # CICD command
            "/build")
                branch=$(echo "$text" | cut -d' ' -f2)
                handle_build "$chat_id" "$branch" "$user_id"
                ;;

	    "/status")

   		 handle_status "$chat_id"
		;;

 	    # K8s command
	    "/pods")
		handle_pods "$chat_id"
		;;
	    "/logs")
    		app=$(echo "$text" | cut -d' ' -f2-)
   		 handle_logs "$chat_id" "$app"
   		 ;;
                
            esac

            update_id=$(echo "$updates" | jq -r ".result[$i].update_id")
            offset=$((update_id + 1))
        done
    fi

    sleep 1
done
