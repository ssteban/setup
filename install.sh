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
  ttf-font-awesome

sudo systemctl enable NetworkManager

echo "Instalación lista"