#!/bin/bash

DUNST_ID=222
OUTPUT_NAME="record.mp4"

if pgrep -x "wf-recorder" > /dev/null; then
  pkill -x wf-recorder
  sleep 0.5
  pkill -RTMIN+8 waybar

  if grep -qE "Failed to|error|invalid" /tmp/wf-recorder.log 2>/dev/null; then
    dunstify -r $DUNST_ID -a "hypr" "Recorder" "Recording failed. Check /tmp/wf-recorder.log"
  elif [ ! -s "$HOME/$OUTPUT_NAME" ]; then
    dunstify -r $DUNST_ID -a "hypr" "Recorder" "Recording failed (empty file generated)"
  else
    dunstify -r $DUNST_ID -a "hypr" "Recorder" "Stopped recording and saved to $OUTPUT_NAME"
  fi
else
  > /tmp/wf-recorder.log

  dunstify -r $DUNST_ID -a "hypr" "Recorder" "Starting recording in 3 seconds..."
  sleep 1
  dunstify -r $DUNST_ID -a "hypr" "Recorder" "Starting recording in 2 seconds..."
  sleep 1
  dunstify -r $DUNST_ID -a "hypr" "Recorder" "Starting recording in 1 seconds..."
  sleep 1

  dunstify -r $DUNST_ID -a "hypr" "Recorder" "Recording..."

  GEOM=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')

  wf-recorder \
   -g "$GEOM" \
   -r 24 \
   -c h264_vaapi \
   -d /dev/dri/renderD128 \
   -p qp=25 \
   -F "scale_vaapi=w=800:h=-2:format=nv12" \
   -f "$HOME/$OUTPUT_NAME" > /tmp/wf-recorder.log 2>&1 &

  # Use this for scaling

  if grep -qE "Failed to|error|invalid" /tmp/wf-recorder.log 2>/dev/null; then
    dunstify -r $DUNST_ID -a "hypr" "Recorder" "Recording failed. Check /tmp/wf-recorder.log"
    echo $(cat /tmp/wf-recorder.log)
  fi

  pkill -RTMIN+8 waybar
fi

