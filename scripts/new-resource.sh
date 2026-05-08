#!/usr/bin/env bash
# Quick scaffolder for a new org / person / topic file.
# Usage: ./scripts/new-resource.sh org stripe
#        ./scripts/new-resource.sh person hamel-husain
#        ./scripts/new-resource.sh topic data-layer

set -euo pipefail

if [ $# -lt 2 ]; then
  echo "Usage: $0 <org|person|topic> <slug>"
  exit 1
fi

KIND="$1"
SLUG="$2"

case "$KIND" in
  org)    DIR="orgs"    ;;
  person) DIR="people"  ;;
  topic)  DIR="topics"  ;;
  *) echo "Unknown kind: $KIND (use org|person|topic)"; exit 1 ;;
esac

FILE="$DIR/$SLUG.md"
if [ -f "$FILE" ]; then
  echo "$FILE already exists."
  exit 1
fi

cat > "$FILE" <<EOF
# $(echo "$SLUG" | tr '-' ' ' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)} 1')

> One-line description of what this $KIND is known for in the AI-native context.

## Practitioner sources

- 🟢 **[Title](URL)** — Author, Year-MM
  Why this matters — name the *specific practitioner insight*, not generic praise.
  Tags: \`tag1\`, \`tag2\`

## What's underexplored

-

EOF

echo "Created $FILE"
