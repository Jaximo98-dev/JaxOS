#!/bin/bash

CHEATS_DIR=~/JaxOS/cheatsheets
BAT_CMD="bat --style=numbers --language=markdown --color=always"

# Selección con fzf y previsualización reutilizando $BAT_CMD
SELECTED=$(ls "$CHEATS_DIR" | fzf \
    --prompt="Cheatsheets: " \
    --height=40% \
    --reverse \
    --preview="$BAT_CMD $CHEATS_DIR/{}" \
    --info="inline-right")

# Mostrar el archivo seleccionado con $BAT_CMD
if [ -n "$SELECTED" ]; then
    $BAT_CMD --paging=always "$CHEATS_DIR/$SELECTED"
fi
