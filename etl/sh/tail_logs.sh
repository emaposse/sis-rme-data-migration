#!/bin/sh
. "$(dirname "$0")/common.sh"

home_dir="$(resolve_home_dir)"

tail -f $home_dir/logs/log.txt
