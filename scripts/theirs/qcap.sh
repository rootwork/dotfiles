#!/bin/bash
# qcap.sh - Quickly make an image from a single frame of a video. Runs cap.sh
# with default settings.

cap.sh "${1}" 00:00:05 "${1%.*}".jpg
echo "Saved ${1%.*}.jpg"
