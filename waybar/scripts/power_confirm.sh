#!/bin/bash

# Script de confirmación de apagar/reiniciar
# Uso: power_confirm.sh poweroff|reboot

ACTION="${1:-poweroff}"
TITLE="¿Confirmar acción?"

case "$ACTION" in
    "poweroff")
        TITLE="¿Apagar el sistema?"
        MESSAGE="Se cerrarán todas las aplicaciones"
        ;;
    "reboot")
        TITLE="¿Reiniciar el sistema?"
        MESSAGE="Se cerrarán todas las aplicaciones"
        ;;
    *)
        echo "Acción no válida"
        exit 1
        ;;
esac

# Usar notify-send si está disponible para mostrar confirmación visual
if command -v notify-send &> /dev/null; then
    notify-send -u critical -t 5000 "$TITLE" "$MESSAGE"
fi

# Usar zenity o kdialog para confirmación si están disponibles
if command -v zenity &> /dev/null; then
    zenity --question --no-wrap --text="$TITLE\n\n$MESSAGE" \
           --ok-label="Continuar" --cancel-label="Cancelar" \
           --window-icon="dialog-warning"
    
    if [ $? -eq 0 ]; then
        systemctl "$ACTION"
    fi
elif command -v kdialog &> /dev/null; then
    kdialog --yesno "$TITLE\n\n$MESSAGE" && systemctl "$ACTION"
else
    # Sin interfaz gráfica, ejecutar directamente
    systemctl "$ACTION"
fi
