#!/bin/bash

# Controlla che ImageMagick (convert) sia installato
if ! command -v convert &> /dev/null; then
    echo "Errore: ImageMagick non è installato o 'convert' non è disponibile."
    echo "Installa con: sudo apt install imagemagick"
    exit 1
fi

shopt -s nullglob

for file in *.dds; do
    output="${file%.dds}.png"
    echo "Converto: $file -> $output"
    convert "$file" \
        -define png:compression-level=9 \
        "$output"
done

echo "Conversione completata."
