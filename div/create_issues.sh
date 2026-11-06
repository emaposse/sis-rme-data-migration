#!/usr/bin/env bash
set -uo pipefail 

ORG="MISAU-DIS"
PROJECT_NUMBER=46
FILE="issues.txt"

PROJECT_ID="PVT_kwDOChAfGs4BNqbW"

STATUS_FIELD_ID="PVTSSF_lADOChAfGs4BNqbWzg8l56s"
BACKLOG_OPTION_ID="13e7a1d6"

count=0

exec 3< "$FILE"

while IFS="|" read -r title repo label <&3; do
  [[ -z "${title// }" ]] && continue

  echo "➡️ Criando issue em $repo → $title"

  ISSUE_URL=$(gh issue create \
    --repo "$ORG/$repo" \
    --title "$title" \
    --body "Criar Configuração Etl e realizar o respectivo teste de migração" \
    --label "$label" \
    </dev/null) || {
      echo "❌ Falhou criar issue → pulando"
      continue
    }

  echo "   🔗 $ISSUE_URL"

  ITEM_ID=$(gh project item-add "$PROJECT_NUMBER" \
    --owner "$ORG" \
    --url "$ISSUE_URL" \
    --format json \
    </dev/null | jq -r '.id') || {
      echo "❌ Falhou adicionar ao project → pulando"
      continue
    }

  echo "   📌 Item ID: $ITEM_ID"

  gh project item-edit \
    --project-id "$PROJECT_ID" \
    --id "$ITEM_ID" \
    --field-id "$STATUS_FIELD_ID" \
    --single-select-option-id "$BACKLOG_OPTION_ID" \
    </dev/null || {
      echo "⚠️ Falhou definir Status → continuando"
      continue
    }

  echo "   🟢 Status definido como Backlog"
  echo

  ((count++))
done

exec 3<&-

echo "✅ Total de issues criadas com sucesso: $count"
