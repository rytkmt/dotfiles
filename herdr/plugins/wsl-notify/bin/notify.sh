#!/bin/bash
# WSL環境でWindows側にバルーン通知を送る（コマンド確認待ち専用）

EVENT_JSON="$HERDR_PLUGIN_EVENT_JSON"
CONTEXT_JSON="$HERDR_PLUGIN_CONTEXT_JSON"

STATUS=$(echo "$EVENT_JSON" | jq -r '.data.agent_status // ""')

# blocked のみ通知（コマンド確認UI）
[ "$STATUS" = "blocked" ] || exit 0

PANE_ID=$(echo "$EVENT_JSON" | jq -r '.data.pane_id // ""')
CWD=$(echo "$CONTEXT_JSON" | jq -r '.workspace_cwd // ""')
WORKSPACE_LABEL=$(echo "$CONTEXT_JSON" | jq -r '.workspace_label // ""')
PROJECT=$(basename "$CWD" 2>/dev/null || echo "不明")

TITLE="AI: ${WORKSPACE_LABEL:-$PROJECT}"
RAW=$("$HERDR_BIN_PATH" pane read "$PANE_ID" --source visible 2>/dev/null)

# 「↓ Shell ...」または「↓ Write ...」等のコマンド行を直接抽出
CMD=$(echo "$RAW" | grep -P '^\s*↓\s+\S+\s+' | tail -1 | sed 's/^\s*↓\s*\S\+\s*//' | cut -c1-80)
MSG="${CMD:+[確認] $CMD}"
MSG="${MSG:-[確認] コマンド確認待ちです}"

/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -NoProfile -Command "
\$title = '${TITLE//\'/\'\'}';
\$msg = '${MSG//\'/\'\'}';
[reflection.assembly]::loadwithpartialname('System.Windows.Forms') | Out-Null;
[reflection.assembly]::loadwithpartialname('System.Drawing') | Out-Null;
\$n = new-object system.windows.forms.notifyicon;
\$n.icon = [System.Drawing.SystemIcons]::Information;
\$n.visible = \$true;
\$n.showballoontip(5, \$title, \$msg, [system.windows.forms.tooltipicon]::Info);
Start-Sleep -Seconds 6;
\$n.Dispose();
" &

exit 0
