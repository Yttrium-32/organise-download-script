#!/usr/bin/env bash

log() {
    printf '[%s] %s\n' \
           "$(date '+%Y-%m-%d %H:%M:%S')" \
           "$*"
}

download_folder=~/Downloads/

declare -A file_extensions=(
    [Compressed]="zip|tar|gz|bz2|xz|lz|lzma|zst|7z|rar|tgz|tbz|txz"
    [Documents]="pdf|djvu|epub|txt|md|rst|doc|docx|odt|rtf|xls|xlsx|ods|csv|ppt|pptx|odp|json|yaml|yml|xml|toml"
    [Video]="mp4|mkv|webm|avi|mov|wmv|flv|mpeg|mpg|m4v|3gp"
    [Audio]="mp3|flac|wav|ogg|opus|aac|m4a|alac|wma|aiff"
    [Images]="jpg|jpeg|jpe|png|gif|bmp|tif|tiff|webp|avif|heic|heif|svg|ico|ppm|pgm|pbm|xbm|xpm|exr|psd|raw|arw|cr2|cr3|nef|dng|rw2"
    [Programs]="appimage|run|sh|bin|elf|out|py|pl|rb|jar|exe|apk|msi|deb|rpm"
)

sorted_items=0
log "Starting sorting..."
for entry in "$download_folder"*
do
    if [[ -f $entry ]]; then
        extension="${entry##*.}"
        lower_extension=${extension,,}

        for dir in "${!file_extensions[@]}"
        do
            extensions_list=${file_extensions[$dir]}

            if [[ "$lower_extension" =~ ^($extensions_list)$ ]]; then
                mv "$entry" "$HOME/Downloads/$dir"
                log "Sorted `$entry` to `$HOME/Downloads/$dir`"
                ((sorted_items++))
            fi
        done
        echo
    fi
done

log "Finished sorting"
log "Sorted $sorted_items items"
