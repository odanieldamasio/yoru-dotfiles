#!/bin/bash

THEME_DIR="$HOME/.config/themes"
CHOICE=$(ls "$THEME_DIR" | rofi -dmenu -p "Selecionar Tema")

if [ -z "$CHOICE" ]; then exit; fi

SELECTED_PATH="$THEME_DIR/$CHOICE"

# 2. Waybar (Link simbólico para o CSS)
ln -sf "$SELECTED_PATH/waybar/colors.css" "$HOME/.config/waybar/colors.css"
pkill waybar && waybar &

notify-send "Tema Atualizado" "O tema $CHOICE foi aplicado em todo o sistema."