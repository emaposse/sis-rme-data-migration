#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

. "$script_dir/common.sh"

home_dir="$(resolve_home_dir)"

JAR_NAME="sisrme-etl-api-1.0.jar"


echo "SIS RME ETL - RESTART"
echo ""


echo "Verificando processo ETL em execução..."


PIDS=$(pgrep -f "$JAR_NAME" || true)


if [ -n "$PIDS" ]; then

    echo ""
    echo "Processo(s) encontrado(s):"
    echo ""


    for PID in $PIDS
    do
        OWNER=$(ps -o user= -p "$PID" | tr -d ' ')

        echo "PID     : $PID"
        echo "Utilizador: $OWNER"
        echo "Comando : $(ps -p "$PID" -o cmd=)"
        echo ""

    done


    CURRENT_USER=$(whoami)


    for PID in $PIDS
    do

        OWNER=$(ps -o user= -p "$PID" | tr -d ' ')


        if [ "$OWNER" != "$CURRENT_USER" ]; then

            echo "ERRO: Não é possível parar o processo PID $PID."

            echo "O processo pertence ao utilizador: $OWNER"
            echo "Utilizador actual: $CURRENT_USER"
            echo ""
            echo "Para reiniciar este serviço:"
            echo "- execute o restart usando o mesmo utilizador que iniciou o ETL"
            echo "- ou solicite permissões administrativas ao responsável pelo servidor"

            exit 1

        fi


    done


    echo "Parando ETL..."


    for PID in $PIDS
    do

        echo "A parar PID $PID..."

        kill "$PID" || {

            echo ""
            echo "ERRO: Falha ao parar o processo PID $PID."
            exit 1

        }

    done



    echo ""
    echo "Aguardando encerramento..."


    COUNT=0


    while pgrep -f "$JAR_NAME" >/dev/null 2>&1
    do

        sleep 2

        COUNT=$((COUNT + 1))


        if [ "$COUNT" -ge 15 ]; then

            echo ""
            echo "O processo não encerrou normalmente."
            echo "Tentando encerramento forçado..."


            FORCE_PIDS=$(pgrep -f "$JAR_NAME" || true)


            for PID in $FORCE_PIDS
            do

                OWNER=$(ps -o user= -p "$PID" | tr -d ' ')


                if [ "$OWNER" = "$CURRENT_USER" ]; then

                    echo "Finalizando PID $PID..."

                    kill -9 "$PID" || true

                else

                    echo ""
                    echo "ERRO: Não é possível finalizar PID $PID."
                    echo "O processo pertence a $OWNER."

                    exit 1

                fi

            done


            break

        fi

    done


    echo "ETL parado com sucesso."


else

    echo "Nenhum processo ETL encontrado."

fi



echo ""
echo "Iniciando ETL..."


"$script_dir/run.in.background.sh"


sleep 5



NEW_PID=$(pgrep -f "$JAR_NAME" | head -1 || true)


if [ -n "$NEW_PID" ]; then

    OWNER=$(ps -o user= -p "$NEW_PID" | tr -d ' ')

    echo ""
    echo "ETL iniciado com sucesso."
    echo "PID       : $NEW_PID"
    echo "Utilizador: $OWNER"

else

    echo ""
    echo "ERRO: O ETL não iniciou correctamente."

    exit 1

fi