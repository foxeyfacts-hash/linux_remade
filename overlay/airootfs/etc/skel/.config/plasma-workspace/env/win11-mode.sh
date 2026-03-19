#!/usr/bin/env bash
MODE_FILE="$HOME/.config/win11/mode"
THEME_FILE="$HOME/.config/win11/theme"

if [ -f "$THEME_FILE" ]; then
  /usr/local/bin/win11-apply-theme || true
fi

if [ -f "$MODE_FILE" ]; then
  /usr/local/bin/win11-mode --apply-user "$(cat "$MODE_FILE")" || true
fi
