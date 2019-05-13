#!/bin/bash

source ~/.config/bh/colors

BORDER_WIDTH=8

WINDOW_BACKGROUND=${PRIMARY_BACKGROUND}
WINDOW_BORDER=${BRIGHT_GREEN}
WINDOW_SEPARATOR=${PRIMARY_FOREGROUND}

BG=${PRIMARY_BACKGROUND}
FG=${PRIMARY_FOREGROUND}
BG_ALT=${PRIMARY_BACKGROUND}
HL_BG=${PRIMARY_BACKGROUND}
HL_FG=${BRIGHT_BLUE}

rofi -show run \
	-fg ${BG} \
	-font "Menlo 24" \
	-hide-scrollbar \
	-color-window "${WINDOW_BACKGROUND}, ${WINDOW_BORDER}, ${WINDOW_SEPARATOR}" \
	-color-normal "${BG}, ${FG}, ${BG_ALT}, ${HL_BG}, ${HL_FG}" \
	-color-urgent  "${BG}, ${FG}, ${BG_ALT}, ${HL_BG}, ${HL_FG}" \
	-color-active "${BG}, ${FG}, ${BG_ALT}, ${HL_BG}, ${HL_FG}" \
	-bw ${BORDER_WIDTH}
