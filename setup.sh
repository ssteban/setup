#!/bin/bash

set -e

echo "╔════════════════════════════════════════╗"
echo "║     🚀 Setup Hyprland Completo 🚀     ║"
echo "╚════════════════════════════════════════╝"
echo ""

chmod +x install.sh

echo "[1/4] ✓ Instalando paquetes necesarios..."
./install.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "[2/4] ✓ Creando carpetas de configuración..."
mkdir -p ~/.config/hypr
mkdir -p ~/.config/waybar/scripts
mkdir -p ~/.config/swaync
mkdir -p ~/Pictures

echo "[3/4] ✓ Copiando configuraciones..."
cp "$SCRIPT_DIR/config/hyprland.conf" ~/.config/hypr/
cp "$SCRIPT_DIR/config/hyprpaper.conf" ~/.config/hypr/
cp "$SCRIPT_DIR/waybar/config" ~/.config/waybar/
cp "$SCRIPT_DIR/waybar/style.css" ~/.config/waybar/
cp "$SCRIPT_DIR/waybar/scripts"/* ~/.config/waybar/scripts/ 2>/dev/null || true
cp "$SCRIPT_DIR/config/swaync/config.json" ~/.config/swaync/
cp "$SCRIPT_DIR/config/swaync/style.css" ~/.config/swaync/

echo "[3/4] ✓ Haciendo scripts ejecutables..."
chmod +x ~/.config/waybar/scripts/*.sh 2>/dev/null || true

echo "[4/4] ✓ Copiando fondos de pantalla..."
cp "$SCRIPT_DIR/wallpapers/"* ~/Pictures/ 2>/dev/null || true

echo ""
echo "╔════════════════════════════════════════╗"
echo "║  ✓ Setup Completado Exitosamente 🎉   ║"
echo "╚════════════════════════════════════════╝"
echo ""
echo "📝 Proximos pasos:"
echo "  1. Reinicia tu sesión"
echo "  2. Presiona SUPER para ver el menú"
echo "  3. Las teclas de función (volumen, brillo) funcionan automáticamente"
echo ""
echo "⌨️  Atajos principales:"
echo "  • SUPER + RETURN → Terminal"
echo "  • SUPER + E → Menú de aplicaciones"
echo "  • SUPER + Q → Cerrar ventana"
echo "  • SUPER + F → Pantalla completa"
echo "  • SUPER + P → Apagar (con confirmación)"
echo "  • SUPER + SHIFT + P → Suspender"
echo ""
echo "🎵 Características nuevas:"
echo "  • Tema nocturno profundo para menos fatiga"
echo "  • Widget de temperatura en tiempo real"
echo "  • Integración Spotify (si está instalado)"
echo "  • Notificaciones animadas con swaync"
echo "  • Confirmación visual antes de apagar"
echo ""