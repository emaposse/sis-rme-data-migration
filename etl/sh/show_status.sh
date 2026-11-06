#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

. "$script_dir/common.sh"

home_dir="$(resolve_home_dir)"

JAR_NAME="sisrme-etl-api-1.0.jar"

STATUS_DIR="$home_dir/process_status"
LOG_DIR="$home_dir/logs"


echo "SIS RME ETL - STATUS"
echo ""


echo "SERVIÇO"


PID=$(pgrep -f "$JAR_NAME" | head -1 || true)


if [ -n "$PID" ]; then

    OWNER=$(ps -o user= -p "$PID" | tr -d ' ')

    echo "Estado      : EM EXECUÇÃO"
    echo "PID         : $PID"
    echo "Utilizador  : $OWNER"

else

    echo "Estado      : PARADO"

fi


echo ""
echo "PROCESSAMENTO"



OP_FILE=$(find "$STATUS_DIR/destination/etl/etl" -type f -name "etl_on_*" 2>/dev/null | head -1 || true)


if [ -n "$OP_FILE" ]; then


    OPERATION=$(grep "operationName" "$OP_FILE" | sed 's/.*: "//;s/".*//' || true)

    STATUS=$(grep "status" "$OP_FILE" | sed 's/.*: "//;s/".*//' || true)


    echo "Operação    : $OPERATION"


    case "$STATUS" in

        RUNNING)
            echo "Estado      : A PROCESSAR"
            ;;

        COMPLETED)
            echo "Estado      : CONCLUÍDO"
            ;;

        FAILED)
            echo "Estado      : COM ERRO"
            ;;

        *)
            echo "Estado      : $STATUS"
            ;;

    esac


else

    echo "Operação    : Nenhuma encontrada"

fi



echo ""
echo "PROGRESSO"



THREAD_FILE=$(find "$STATUS_DIR/destination/etl/etl" -type f -path "*/threads/*" 2>/dev/null | head -1 || true)



if [ -n "$THREAD_FILE" ]; then


    MIN=$(grep "minRecordId" "$THREAD_FILE" | head -1 | sed 's/[^0-9]//g')

    MAX=$(grep "maxRecordId" "$THREAD_FILE" | head -1 | sed 's/[^0-9]//g')


    LAST=$(grep "lastSavedOn" "$THREAD_FILE" | sed 's/.*: "//;s/".*//' || true)


    DONE=$(grep -c '"processed" : true' "$THREAD_FILE" || true)


    TOTAL=$(grep -c '"minRecordId"' "$THREAD_FILE" || true)



    echo "Registos    : $MIN até $MAX"
    echo "Intervalos  : $DONE concluídos"
    echo "Actualizado : $LAST"


else

    echo "Sem informação de progresso"

fi



echo ""
echo "LOGS"



if [ -f "$LOG_DIR/log.txt" ]; then


    ERRORS=$(grep -i "error" "$LOG_DIR/log.txt" | wc -l || true)

    WARNINGS=$(grep -i "warn" "$LOG_DIR/log.txt" | wc -l || true)


    echo "Erros       : $ERRORS"
    echo "Avisos      : $WARNINGS"


else

    echo "Log não encontrado"

fi


echo ""
