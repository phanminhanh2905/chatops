#!/bin/bash

function handle_build() {
    chat_id="$1"
    branch="$2"
    user_id="$3"

    # Lấy tên người dùng từ user_id
    username=$(curl -s "https://api.telegram.org/bot$TOKEN/getChat?chat_id=$user_id" | jq -r ".result.username")

    # Lấy thời gian hiện tại
    current_time=$(date +"%Y-%m-%d %H:%M:%S")

    send_message "$chat_id" "Đang thực hiện lệnh build trên nhánh $branch..."

    # Link api chạy Pipeline
    response=$(curl -X POST "$GITLAB_URL/api/v4/projects/$GITLAB_PROJECT_ID/pipeline" -H "PRIVATE-TOKEN: $GITLAB_ACCESS_TOKEN" -F "ref=$branch")

    # Kiểm tra trạng thái từ response gọi pipeline
    status=$(echo "$response" | jq -r ".status")
    echo "Response: $response"
    if [ "$status" == "created" ]; then
        message="Đã thực hiện lệnh build trên nhánh $branch bởi @$username lúc $current_time!"
    else
        message="Không thể thực hiện lệnh build trên nhánh $branch vì nhánh không tồn tại hoặc lỗi."
    fi

    send_message "$chat_id" "$message"

}

