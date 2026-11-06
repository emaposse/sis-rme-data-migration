#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

common_file="$script_dir/common.sh"

if [ ! -f "$common_file" ]; then
    echo "Error: common.sh not found at $common_file" >&2
    exit 1
fi

. "$common_file"

home_dir="$(resolve_home_dir)"

env_file="$home_dir/env.properties"

sync_mode="db_synchronization"
migr_mode="db_migration"
re_migr_mode="resume_cs_polana_remigration"

jar_file="$home_dir/app/sisrme-etl-api-1.0.jar"
logback_file="$home_dir/logback.xml"

migr_conf="$home_dir/conf/migr/sesp_sis_rme_migration.json"
sync_conf="$home_dir/conf/sync/sis_rme_sesp_sync.json"
re_migr_conf="$home_dir/conf/migr/re-migrate/startup.json"

[ -f "$env_file" ] || {
    echo "Error: env file not found: $env_file" >&2
    exit 1
}

[ -f "$jar_file" ] || {
    echo "Error: jar file not found: $jar_file" >&2
    exit 1
}

. "$env_file"

: "${mode:?mode is not defined}"
: "${log_level:=WARN}"
: "${log_level_configuration:=WARN}"
: "${log_level_controller:=WARN}"
: "${log_level_engine:=WARN}"
: "${log_level_processor:=WARN}"
: "${log_level_dao:=WARN}"
: "${log_level_connection:=WARN}"
: "${run_in_debug_mode:=false}"

echo "Using mode: $mode"
echo "Log level: $log_level"
echo "log_level_configuration: $log_level_configuration"
echo "log_level_controller: $log_level_controller"
echo "log_level_engine: $log_level_engine"
echo "log_level_processor: $log_level_processor"
echo "log_level_dao: $log_level_dao"
echo "log_level_connection: $log_level_connection"

case "$mode" in
    "$migr_mode")
        conf_file="$migr_conf"
        ;;
    "$sync_mode")
        conf_file="$sync_conf"
        ;;
    "$re_migr_mode")
        conf_file="$re_migr_conf"
        ;;
    *)
        echo "Unsupported mode: $mode" >&2
        echo "Supported modes: $sync_mode, $migr_mode" >&2
        exit 1
        ;;
esac

[ -f "$conf_file" ] || {
    echo "Error: config file not found: $conf_file" >&2
    exit 1
}

java_opts="
-Dlog.level=$log_level
-Dlog.level.configuration=$log_level_configuration
-Dlog.level.controller=$log_level_controller
-Dlog.level.engine=$log_level_engine
-Dlog.level.processor=$log_level_processor
-Dlog.level.dao=$log_level_dao
-Dlog.level.connection=$log_level_connection
-Dlogback.configurationFile=$logback_file
-Detl.env.file=$env_file
"

debug_opts=""

if [ "$run_in_debug_mode" = "true" ]; then
    debug_opts="
    -Xdebug
    -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=*:8009
    "

    echo "Starting JVM in DEBUG mode on port 8009..."
fi

java \
    $java_opts \
    $debug_opts \
    -jar "$jar_file" \
    "$conf_file"
