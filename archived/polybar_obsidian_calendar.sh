#!/bin/bash
# Abre la sidebar y despues el calendario y me mueve al workspace de obsidian
i3 workspace 3
xdg-open 'obsidian://adv-uri?vault=Estudios&commandid=app%3Atoggle-right-sidebar'
