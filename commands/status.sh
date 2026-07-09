#!/bin/bash

handle_status() {

    local chat_id="$1"

    response=$(get_latest_pipeline)

    pipeline=$(echo "$response" | jq '.[0]')

    id=$(echo "$pipeline" | jq -r '.id')
    status=$(echo "$pipeline" | jq -r '.status')
    branch=$(echo "$pipeline" | jq -r '.ref')
    created=$(echo "$pipeline" | jq -r '.created_at')
    url=$(echo "$pipeline" | jq -r '.web_url')

    message="🚀 Pipeline Status

Pipeline : #$id

Branch : $branch

Status : $status

Created : $created

$url"

    send_message "$chat_id" "$message"

}
