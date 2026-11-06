#!/bin/sh
. "$(dirname "$0")/common.sh"

home_dir="$(resolve_home_dir)"

# Timestamp ISO 8601
current_time=$(date +"%Y-%m-%dT%H:%M:%S%z")

cat > "$home_dir/process_status/stop_requested.info" <<EOF
{
  "stopRequestedAt": "${current_time}"
}
EOF