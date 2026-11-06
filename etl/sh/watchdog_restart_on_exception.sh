#!/bin/sh

BASE_DIR="/his/migracao/sis-rme-data-migration/etl"
LOG_FILE="$BASE_DIR/logs/log.txt"
WATCHDOG_LOG="$BASE_DIR/logs/watchdog_restart.log"
LOCK_FILE="/tmp/sis-rme-etl-watchdog.lock"

REQUEST_STOP="$BASE_DIR/sh/request_stop.sh"
STOP_SERVICE="$BASE_DIR/sh/stop_service.sh"
RUN_BACKGROUND="$BASE_DIR/sh/run.in.background.sh"

log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$WATCHDOG_LOG"
}

(
  flock -n 9 || {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Watchdog já está em execução. Ignorando."
    exit 0
  }

  if [ ! -f "$LOG_FILE" ]; then
    log "Log não encontrado: $LOG_FILE"
    exit 0
  fi

  if grep -q "Exception" "$LOG_FILE"; then
    log "Exception encontrada. Reiniciando operação..."

    "$REQUEST_STOP" 2>&1 | tee -a "$WATCHDOG_LOG"

    sleep 180

    "$STOP_SERVICE" 2>&1 | tee -a "$WATCHDOG_LOG"

    "$RUN_BACKGROUND" 2>&1 | tee -a "$WATCHDOG_LOG"

    log "Operação reiniciada."
  else
    log "Nenhum erro actualmente e o Processo nao sera reiniciado."
  fi

) 9>"$LOCK_FILE"
