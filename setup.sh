#!/bin/bash

echo "=== Setup Hyprland ==="

chmod +x install.sh

./install.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Copiando configuraciones..."

# Crear carpetas
mkdir -p ~/.config/hypr
mkdir -p ~/.config/waybar
mkdir -p ~/Pictures

# Copiar configs
cp "$SCRIPT_DIR/config/hyprland.conf" ~/.config/hypr/
cp "$SCRIPT_DIR/config/hyprpaper.conf" ~/.config/hypr/

cp "$SCRIPT_DIR/config/waybar/config" ~/.config/waybar/
cp "$SCRIPT_DIR/config/waybar/style.css" ~/.config/waybar/

# Copiar wallpapers
cp "$SCRIPT_DIR/wallpapers/"* ~/Pictures/

echo "Setup completado 🚀"