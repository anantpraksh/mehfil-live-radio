#!/bin/bash

mkdir -p public

# playlist create
ls songs/*.mp3 | sed "s/^/file '/;s/$/'/" > list.txt

# LIVE RADIO (AUDIO FORCE SELECT)
ffmpeg -re -f concat -safe 0 -stream_loop -1 -i list.txt \
-map a:0 \
-vn \
-c:a aac \
-b:a 128k \
-ar 44100 \
-ac 2 \
-af "aresample=async=1" \
-f hls \
-hls_time 6 \
-hls_list_size 5 \
-hls_flags delete_segments+append_list \
public/live.m3u8