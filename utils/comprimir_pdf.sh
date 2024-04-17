#!/bin/bash

# comprime todos los pdf de una carpeta
# Carpeta de entrada y salida
input_folder=$1
output_folder=$2


# Asegurarse de que la carpeta de salida exista
mkdir -p "$output_folder"

# Iterar sobre los archivos PDF en la carpeta de entrada
for file in "$input_folder"*.pdf; do
    # Obtener el nombre del archivo sin la ruta
    filename=$(basename "$file")
    
    echo "Comprimiendo: $filename"
    # Aplicar el comando gs a cada archivo PDF
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$output_folder$filename" "$file"
done

echo "Terminado"
