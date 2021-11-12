#!/bin/bash
# Short script to split videos by filesize using ffmpeg by LukeLR
# Original source: https://stackoverflow.com/a/52158160
# Slightly modified below

if [ $# -le 1 ]; then
  echo 'Illegal number of parameters. Needs at least 2 parameters:'
  echo 'Usage:'
  echo './split-video.sh FILE SIZELIMIT "FFMPEG_ARGS"'
  echo
  echo 'Parameters:'
  echo '    - FILE:        Name of the video file to split'
  echo '    - SIZE:        Maximum file size of each part (in MB)'
  echo '    - FFMPEG_ARGS: Additional arguments to pass to each ffmpeg-call'
  echo '                   (video format and quality options etc.)'
  exit 1
fi

FILE="$1"
SIZE="$2"
FFMPEG_ARGS="$3"
SIZELIMIT="$((SIZE * 1000000))"

if [[ ! $FFMPEG_ARGS ]]; then
  FFMPEG_ARGS="-c copy"
fi

# Duration of the source video
DURATION=$(ffprobe -i "$FILE" -show_entries format=duration -v quiet -of default=noprint_wrappers=1:nokey=1 | cut -d. -f1)

# Duration that has been encoded so far
CUR_DURATION=0

# Filename of the source video (without extension)
BASENAME="${FILE%.*}"

# Extension for the video parts
#EXTENSION="${FILE##*.}"
EXTENSION="mp4"

# Number of the current video part
i=1

# Filename of the next video part
NEXTFILENAME="$BASENAME-$i.$EXTENSION"

echo "Duration of source video: $DURATION"

# Until the duration of all partial videos has reached the duration of the source video
while [[ $CUR_DURATION -lt $DURATION ]]; do
  # Encode next part
  echo ffmpeg -i "$FILE" -ss "$CUR_DURATION" -fs "$SIZELIMIT" $FFMPEG_ARGS "$NEXTFILENAME"
  ffmpeg -ss "$CUR_DURATION" -i "$FILE" -fs "$SIZELIMIT" $FFMPEG_ARGS "$NEXTFILENAME"

  # Duration of the new part
  NEW_DURATION=$(ffprobe -i "$NEXTFILENAME" -show_entries format=duration -v quiet -of default=noprint_wrappers=1:nokey=1 | cut -d. -f1)

  # Total duration encoded so far
  CUR_DURATION=$((CUR_DURATION + NEW_DURATION))

  i=$((i + 1))

  echo "Duration of $NEXTFILENAME: $NEW_DURATION"
  echo "Part No. $i starts at $CUR_DURATION"

  NEXTFILENAME="$BASENAME-$i.$EXTENSION"
done
