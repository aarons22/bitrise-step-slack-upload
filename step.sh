#!/bin/bash
set -ex

echo "This is the value specified for the input 'example_step_input': ${example_step_input}"

IP=$(curl -F file=@${file_path_input} -F channels=${slack_channel_input} -F title="${slack_title_input}" -F initial_comment="${slack_comment_input}" -F token=${slack_token_input} https://slack.com/api/files.upload)

if [[ $IP = *"invalid_auth"* ]]; then
  exit 1
fi
