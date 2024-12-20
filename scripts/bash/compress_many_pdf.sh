#!/bin/bash

if ! ghostscript -v > /dev/null; then
    echo "Ghostscript is not installed."
    echo "Instalar: sudo apt install ghostscript"
    exit 1
fi

echo "Comprimiendo PDF..."

# Variables
folder_main=$1

if [ -z "$folde_main"] || [ ! -d "$folder_main" ]; then 
    echo "La carpeta no es valida: ${folder_main}"
    exit 1
fi

folder_pdf_compressed="${folder_main%/}/compressed/"
folder_pdf_original="${folder_main%/}/originals/"

mkdir -p "$folder_pdf_compressed"
mkdir -p "$folder_pdf_original"

counter=0
for file in "${folder_main%/}"/*.pdf; do
    if [ -f "$file" ] && [ -s "$file" ]; then 
        basename=$( basename "$file" )
        outputfile="${folder_pdf_compressed}${basename}"

        gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$outputfile" "$file"
        
        if [ $? -eq 0 ]; then
            mv "$file" "$folder_pdf_original"
            echo "Archivo comprimido y movido: $basename"
        else 
            echo "No se pudo comprimir el archivo: $basename"
        fi

        counter=$((counter + 1))
    fi
done

if [ "$counter" -eq 0 ]; then
    echo "No se encontraron archivos pdf"
fi
