#!/bin/sh
set -eu

# ============================================================
# wait-for-db.sh
#
# Aguarda até que a base de dados MySQL esteja realmente
# disponível antes de permitir o arranque da aplicação.
# ============================================================

# ------------------------------------------------------------
# Resolve o diretório onde este script está localizado
# ------------------------------------------------------------
script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

common_file="$script_dir/common.sh"

if [ ! -f "$common_file" ]; then
    echo "ERROR: common.sh not found at: $common_file" >&2
    exit 1
fi

# ------------------------------------------------------------
# Carrega funções comuns
# ------------------------------------------------------------
. "$common_file"

home_dir="$(resolve_home_dir)"

if [ -z "$home_dir" ]; then
    echo "ERROR: Could not resolve home directory." >&2
    exit 1
fi

# ------------------------------------------------------------
# Carrega configuração da aplicação
# ------------------------------------------------------------
env_file="$home_dir/env.properties"

if [ ! -f "$env_file" ]; then
    echo "ERROR: env file not found: $env_file" >&2
    exit 1
fi

. "$env_file"

# ------------------------------------------------------------
# Valida variáveis obrigatórias
# ------------------------------------------------------------
: "${dstUserName:?ERROR: dstUserName is not defined in $env_file}"
: "${dstUserPassword:?ERROR: dstUserPassword is not defined in $env_file}"

# Se tiveres o nome da BD em env.properties, podes também
# validar aqui:
#
# : "${dstDatabase:?ERROR: dstDatabase is not defined in $env_file}"

# ------------------------------------------------------------
# Configuração da conexão
# ------------------------------------------------------------
DB_HOST="127.0.0.1"
DB_PORT="3320"

RETRY_INTERVAL=5
CONNECT_TIMEOUT=3

# ------------------------------------------------------------
# Função de logging
# ------------------------------------------------------------
log()
{
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

# ------------------------------------------------------------
# Aguarda pela BD
# ------------------------------------------------------------
log "Aguardando MySQL em ${DB_HOST}:${DB_PORT}..."

while true
do
    if MYSQL_PWD="${dstUserPassword}" mysql \
        --host="$DB_HOST" \
        --port="$DB_PORT" \
        --user="${dstUserName}" \
        --connect-timeout="$CONNECT_TIMEOUT" \
        --batch \
        --skip-column-names \
        --execute="SELECT 1;" \
        >/dev/null 2>&1
    then
        break
    fi

    log "MySQL ainda não está disponível. Nova tentativa em ${RETRY_INTERVAL}s..."

    sleep "$RETRY_INTERVAL"
done

log "MySQL está disponível e aceita conexões."

exit 0