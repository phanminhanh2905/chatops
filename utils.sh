#!/bin/bash

send_message() {

    local chat_id="$1"
    local text="$2"

    curl -s \
        -X POST \
        "https://api.telegram.org/bot$TOKEN/sendMessage" \
        -d "chat_id=$chat_id" \
        -d "text=$text" >/dev/null
}
