#!/bin/bash

# Verificar que se proporcionó una carpeta
if [ -z "$1" ]; then
    echo "Uso: $0 <carpeta_de_videos>"
    exit 1
fi

# Variables
CARPETA_VIDEOS="$1"
CARPETA_COMPRESOS="/home/luisjairmz/Vídeos/compress"
CARPETA_ORIGINALES="/home/luisjairmz/Vídeos/originals"

# Crear carpetas si no existen
mkdir -p "$CARPETA_COMPRESOS"
mkdir -p "$CARPETA_ORIGINALES"

# Verificar que la carpeta existe
if [ ! -d "$CARPETA_VIDEOS" ]; then
    echo "Error: La carpeta '$CARPETA_VIDEOS' no existe."
    exit 1
fi

# Procesar todos los archivos MP4 en la carpeta
for VIDEO_ORIGINAL in "$CARPETA_VIDEOS"/*.mp4; do
    # Verificar que el archivo existe
    if [ ! -f "$VIDEO_ORIGINAL" ]; then
        echo "No se encontraron archivos MP4 en '$CARPETA_VIDEOS'."
        exit 0
    fi

    # Obtener el nombre del archivo
    NOMBRE_VIDEO=$(basename "$VIDEO_ORIGINAL")
    VIDEO_COMPRESO="$CARPETA_COMPRESOS/$NOMBRE_VIDEO"

    # Obtener fechas del archivo original
    FECHA_MODIFICACION=$(stat --format=%y "$VIDEO_ORIGINAL")
    FECHA_CREACION=$(stat --format=%w "$VIDEO_ORIGINAL") # Solo funciona en algunos sistemas de archivos
    FECHA_CREACION=${FECHA_CREACION:-$FECHA_MODIFICACION} # Usar fecha de modificación si no hay fecha de creación

    # Reducir tamaño del video con ffmpeg y conservar metadatos
    echo "Comprimiendo '$VIDEO_ORIGINAL'..."
    ffmpeg -i "$VIDEO_ORIGINAL" -vf scale=640:-2 -c:v libx264 -crf 23 -b:v 500k -map_metadata 0 "$VIDEO_COMPRESO"

    if [ $? -ne 0 ]; then
        echo "Error: La compresión de '$VIDEO_ORIGINAL' falló. Se omite este archivo."
        continue
    fi

    # Ajustar fechas del archivo comprimido
    echo "Ajustando fechas de '$VIDEO_COMPRESO'..."
    touch -d "$FECHA_MODIFICACION" "$VIDEO_COMPRESO" # Ajustar la fecha de modificación
    if [ "$(uname)" == "Darwin" ]; then
        # En macOS, ajustar la fecha de creación con SetFile
        CREATION_DATE=$(date -jf "%Y-%m-%d %H:%M:%S" "$FECHA_CREACION" +"%m/%d/%Y %H:%M:%S")
        SetFile -d "$CREATION_DATE" "$VIDEO_COMPRESO"
    else
        echo "Nota: La fecha de creación no se puede ajustar en Linux ext4 directamente."
    fi

    # Mover el video original a la carpeta de originales
    echo "Moviendo '$VIDEO_ORIGINAL' a la carpeta '$CARPETA_ORIGINALES'..."
    mv "$VIDEO_ORIGINAL" "$CARPETA_ORIGINALES/"
done

echo "Proceso completado. Los videos comprimidos están en '$CARPETA_COMPRESOS' y los originales en '$CARPETA_ORIGINALES'."
