#!/bin/bash

# Script para obtener clima desde OpenWeatherMap API
# Necesita: curl, jq

CIUDAD="${1:-Madrid}"
API_KEY="${WEATHER_API_KEY:-}"

# Símbolos de clima
declare -A WEATHER_ICONS=(
    ["01d"]="☀️  Soleado"
    ["01n"]="🌙 Noche clara"
    ["02d"]="⛅ Parcialmente nublado"
    ["02n"]="🌙 Parcialmente nublado"
    ["03d"]="☁️  Nublado"
    ["03n"]="☁️  Nublado"
    ["04d"]="☁️  Muy nublado"
    ["04n"]="☁️  Muy nublado"
    ["09d"]="🌧️ Lluvia"
    ["09n"]="🌧️ Lluvia"
    ["10d"]="🌦️ Lluvia con sol"
    ["10n"]="🌧️ Lluvia nocturna"
    ["11d"]="⛈️  Tormenta"
    ["11n"]="⛈️  Tormenta"
    ["13d"]="❄️ Nieve"
    ["13n"]="❄️ Nieve"
    ["50d"]="🌫️ Niebla"
    ["50n"]="🌫️ Niebla"
)

# Sin API key, mostrar placeholder
if [ -z "$API_KEY" ]; then
    echo "⛅ 18°C"
    exit 0
fi

# Obtener coordenadas
COORDS=$(curl -s "https://nominatim.openstreetmap.org/search?city=$CIUDAD&format=json&limit=1" | jq -r '.[0] | "\(.lat),\(.lon)"')

if [ -z "$COORDS" ] || [ "$COORDS" = "null,null" ]; then
    echo "⛅ N/A"
    exit 0
fi

# Obtener clima desde OpenWeatherMap
WEATHER=$(curl -s "https://api.openweathermap.org/data/2.5/weather?lat=$(echo $COORDS | cut -d, -f1)&lon=$(echo $COORDS | cut -d, -f2)&units=metric&lang=es&appid=$API_KEY")

TEMP=$(echo $WEATHER | jq -r '.main.temp // "N/A"')
CONDITION=$(echo $WEATHER | jq -r '.weather[0].icon // "01d"')
ICON="${WEATHER_ICONS[$CONDITION]:-⛅ Desconocido}"

echo "$ICON $TEMP°C"
