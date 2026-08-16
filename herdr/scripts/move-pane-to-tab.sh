#!/bin/bash
set -euo pipefail

PANE_ID="$HERDR_ACTIVE_PANE_ID"
CURRENT_TAB="$HERDR_ACTIVE_TAB_ID"
CURRENT_WS="$HERDR_ACTIVE_WORKSPACE_ID"

TABS=$(herdr tab list 2>/dev/null | jq -r --arg current "$CURRENT_TAB" --arg ws "$CURRENT_WS" '
  .result.tabs[]
  | select(.tab_id != $current and .workspace_id == $ws)
  | "\(.tab_id)\t\(.label // (.number | tostring))"
')

if [ -z "$TABS" ]; then
  echo "移動先のタブがありません"
  sleep 1
  exit 0
fi

TARGET=$(echo "$TABS" | fzf --prompt="Move to tab> " --with-nth=2 --delimiter='\t' | cut -f1)

[ -z "$TARGET" ] && exit 0

herdr pane move "$PANE_ID" --tab "$TARGET" --split right --focus
