#!/bin/bash

display_menu() {
    echo "v) View $1"
    echo "e) Edit $1"
    echo "c) Compile $1"
    echo "x) Execute $1"
    echo "q) Quit"
}

for file in *; do
    if [ -f "$file" ] && [ "$file" != "menu.sh" ]; then
        while true; do
            display_menu "$file"
            read -p "Enter your choice for $file: " choice

            case $choice in
                v) less "$file";;
                e) $EDITOR "$file";;
                c) g++ "$file" -o "${file%.*}";;
                x) chmod +x "$file"; ./"$file";;
                q) break;;
                *) echo "INVALID RESPONSE"; echo "Skipping this file!"; break;;
            esac
        done
    fi
done
