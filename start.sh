#!/bin/bash

PORT=${PORT:-8000}

echo "Starting server on port $PORT"

ffmpeg -re -stream_loop -1 -i input.mp3 \
-vn -c:a aac -b:a 128k \
-f hls -hls_time 6 -hls_list_size 5 public/live.m3u8 &

python3 -m http.server $PORT --directory public