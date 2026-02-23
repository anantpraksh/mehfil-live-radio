#!/bin/bash

echo "Starting Live Radio..."

mkdir -p public

ffmpeg -re -stream_loop -1 -i input.mp3 \
-c:a aac -b:a 128k \
-f hls \
-hls_time 6 \
-hls_list_size 5 \
-hls_flags delete_segments \
public/live.m3u8 &

python3 -m http.server $PORT --directory public