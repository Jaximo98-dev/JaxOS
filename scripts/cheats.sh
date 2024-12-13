#!/bin/bash

CHEATS_DIR=~/JaxOS/cheatsheets
BAT_CMD="bat --style=numbers --color=always"

# Selección con fzf y previsualización reutilizando $BAT_CMD
SELECTED=$(ls "$CHEATS_DIR" | fzf \
    --height=60% \
    --reverse \
    --color=bg:-1 \
    --prompt="Search cheatsheet: " \
    --preview="$BAT_CMD $CHEATS_DIR/{}" \
    --info="inline-right")

# Mostrar el archivo seleccionado con $BAT_CMD
if [ -n "$SELECTED" ]; then
    $BAT_CMD --paging=always "$CHEATS_DIR/$SELECTED"
fi