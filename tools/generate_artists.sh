#!/usr/bin/env bash

# USAGE: ./generate_artists.sh
# copy and paste output in to app/init.coffee

curl "http://iguana.app.alecgorge.com/api/artists" | node process_artists_json.js
