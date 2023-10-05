#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 WORD WEBSITE"
    exit 1
fi

WORD="$1"
WEBSITE="$2"

content=$(wget -O - --quiet "$WEBSITE" | tr ' ' '\n' | grep -o "$WORD")

count=$(echo "$content" | wc -l)

echo "$WORD: $count"
