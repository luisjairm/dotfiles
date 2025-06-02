#!/bin/bash

# Verificar que se proporcionó una carpeta como argumento
if [ -z "$1" ]; then
    echo "❌ Error: Debes especificar la carpeta que contiene los videos."
    echo "Uso: $0 /ruta/a/la/carpeta"
    exit 1
fi

CARPETA_VIDEOS="$1"

# Verificar que la carpeta existe
if [ ! -d "$CARPETA_VIDEOS" ]; then
    echo "❌ Error: La carpeta '$CARPETA_VIDEOS' no existe."
    exit 1
fi

# Crear la subcarpeta 'audio' si no existe
CARPETA_SALIDA="$CARPETA_VIDEOS/audio"
mkdir -p "$CARPETA_SALIDA"

# Procesar archivos de video en la carpeta
for archivo in "$CARPETA_VIDEOS"/*; do
    # Saltar si es la carpeta de salida
    if [[ "$archivo" == "$CARPETA_SALIDA"* ]]; then
        continue
    fi

    if [[ -f "$archivo" ]]; then
        nombre_base=$(basename "$archivo")
        nombre_sin_ext="${nombre_base%.*}"
        salida_mp3="$CARPETA_SALIDA/$nombre_sin_ext.mp3"

        echo "🎵 Extrayendo audio de: $nombre_base"
        ffmpeg -i "$archivo" -q:a 0 -map a "$salida_mp3" -y > /dev/null 2>&1
    fi
done

echo "✅ Todos los audios fueron extraídos a: $CARPETA_SALIDA"
