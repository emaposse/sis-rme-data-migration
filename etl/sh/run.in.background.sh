#!/bin/sh
. "$(dirname "$0")/common.sh"

home_dir="$(resolve_home_dir)"

rm $home_dir/logs/log.txt

$home_dir/sh/run.sh > $home_dir/logs/log.txt 2>&1 &
