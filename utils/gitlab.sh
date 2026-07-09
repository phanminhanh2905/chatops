#!/bin/bash

get_latest_pipeline() {

    curl -s \
        --header "PRIVATE-TOKEN: $GITLAB_ACCESS_TOKEN" \
        "$GITLAB_URL/api/v4/projects/$GITLAB_PROJECT_ID/pipelines?per_page=1"

}
