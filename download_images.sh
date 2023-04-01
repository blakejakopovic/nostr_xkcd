#!/bin/bash

# API Docs
# https://xkcd.com/json.html

# Get latest comic number from
# https://xkcd.com/info.0.json

# Ensure folder exists
mkdir -p images

for i in {1..2755}; do
    URL=$(cat "data/$i.json" | jq -r '.img')
    FILENAME=$(basename "$URL")

    echo $URL
    curl -s "$URL" -o "images/$FILENAME"
done
