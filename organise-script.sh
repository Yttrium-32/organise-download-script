#!/usr/bin/env bash

download_folder=~/Downloads/

directories=(Compressed Documents Images Programs)
declare -A file_extensions=(
    [Compressed]="zip|gz|rar"
    [Documents]="docx|xlsx|pdf|odt|json|pptx"
    [Images]="jpg|jpeg|jpe|png|gif|bmp|tif|tiff|webp|avif|heic|heif|svg|ico|ppm|pgm|pbm|xbm|xpm|exr|psd|raw|arw|cr2|cr3|nef|dng|rw2"
    [Programs]="appimage|run|sh|bin|elf|out|py|pl|rb|jar|exe|apk"
)

for entry in "$download_folder"*
do
    if [[ -f $entry ]]; then
        extension="${entry##*.}"
        lower_extension=${extension,,}

        for dir in "${directories[@]}"
        do
            extensions_list=${file_extensions[$dir]}

            if [[ "$lower_extension" =~ ^($extensions_list)$ ]]; then
                mv "$entry" "$HOME/Downloads/$dir"
                echo "Moved `$entry` to `$HOME/Downloads/$dir`"
            fi
        done
        echo
    fi
done

