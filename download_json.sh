#!/bin/bash

# API Docs
# https://xkcd.com/json.html

# Get latest comic number from
# https://xkcd.com/info.0.json

# Ensure folder exists
mkdir -p data

for i in {1..2755}; do
    printf -v url "https://xkcd.com/%d/info.0.json" $i
    echo $url
    curl -s -o "data/$i.json" $url
done
