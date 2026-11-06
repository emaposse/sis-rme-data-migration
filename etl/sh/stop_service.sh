#!/bin/sh
. "$(dirname "$0")/common.sh"

home_dir="$(resolve_home_dir)"

pkill -f sisrme-etl-api-1.0.jar
