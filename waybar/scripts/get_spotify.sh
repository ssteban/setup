#!/bin/bash

# Script para obtener canción actual de Spotify
# Necesita: dbus, playerctl

# Usar playerctl si está disponible
if command -v playerctl &> /dev/null; then
    PLAYER_STATUS=$(playerctl status --player=spotify 2>/dev/null)
    
    if [ "$PLAYER_STATUS" = "Playing" ] || [ "$PLAYER_STATUS" = "Paused" ]; then
        ARTIST=$(playerctl metadata --player=spotify --format "{{artist}}" 2>/dev/null || echo "")
        TITLE=$(playerctl metadata --player=spotify --format "{{title}}" 2>/dev/null || echo "")
        
        if [ -n "$TITLE" ]; then
            # Limitar a 30 caracteres
            SONG="$TITLE"
            if [ -n "$ARTIST" ]; then
                SONG="$ARTIST - $TITLE"
            fi
            
            if [ ${#SONG} -gt 30 ]; then
                SONG="${SONG:0:27}..."
            fi
            
            if [ "$PLAYER_STATUS" = "Playing" ]; then
                echo "▶️ $SONG"
            else
                echo "⏸️ $SONG"
            fi
            exit 0
        fi
    fi
fi

# Alternativa usando dbus si playerctl no funciona
if command -v dbus-send &> /dev/null; then
    STATUS=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.GetAll string:'org.mpris.MediaPlayer2.Player' 2>/dev/null | grep -A 10 "PlaybackStatus" | grep -o "[A-Za-z]*" | head -1)
    
    if [ "$STATUS" = "Playing" ] || [ "$STATUS" = "Paused" ]; then
        METADATA=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.GetAll string:'org.mpris.MediaPlayer2.Player' 2>/dev/null | grep -E '"xesam:title"|"xesam:artist"')
        TITLE=$(echo "$METADATA" | grep '"xesam:title"' | sed 's/.*"\([^"]*\)".*/\1/' | head -1)
        ARTIST=$(echo "$METADATA" | grep '"xesam:artist"' | sed 's/.*"\([^"]*\)".*/\1/' | head -1)
        
        if [ -n "$TITLE" ]; then
            SONG="$ARTIST - $TITLE"
            if [ ${#SONG} -gt 30 ]; then
                SONG="${SONG:0:27}..."
            fi
            
            if [ "$STATUS" = "Playing" ]; then
                echo "▶️ $SONG"
            else
                echo "⏸️ $SONG"
            fi
            exit 0
        fi
    fi
fi

# Si no hay canción activa
echo ""
