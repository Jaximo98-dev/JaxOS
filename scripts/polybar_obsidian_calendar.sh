#!/bin/bash
# Abre la sidebar y despues el calendario y me mueve al workspace de obsidian
xdg-open 'obsidian://adv-uri?vault=Estudios&commandid=app%3Atoggle-right-sidebar' > /dev/null 2>&1
sleep 0.2
xdg-open 'obsidian://adv-uri?vault=Estudios&filepath=05%20-%20Estudios%2FCalendario.md&commandid=obsidian-full-calendar%3Afull-calendar-open' > /dev/null 2>&1
sleep 0.2
i3-msg workspace 3
