#!/bin/bash

echo "Instalando paquetes..."

sudo pacman -S --noconfirm \
  hyprland \
  kitty \
  waybar \
  wofi \
  hyprpaper \
  git \
  neovim \
  networkmanager \
  ttf-dejavu \
  ttf-font-awesome \
  swaync \
  alsa-utils \
  iw \
  base-devel \
  brightnessctl \
  playerctl \
  curl \
  jq \
  zenity

sudo systemctl enable NetworkManager

echo "✓ Paquetes instalados"
echo "✓ NetworkManager habilitado"
echo ""
echo "=== Instalación completada ==="