#!/bin/bash
# resize.sh - Use imagemagick to resize an image to a specific width, setting
#             the height proportionally.
# Source: https://stackoverflow.com/a/7201084

USAGE="resize.sh imagefile width"

if [ "$#" == "0" ]; then
  echo "$USAGE"
  exit 1
fi

if [ -e "$1" ]; then
  file="$1"
  name="${1%.*}"
  ext="${1##*.}"
else
  echo "File not found: $1"
  exit 1
fi

if [ ! -z "$2" ]; then
  width="$2"
else
  echo "Need width (in pixels)."
  exit 1
fi

convert=$(command -v convert)
if [[ ! $convert ]]; then
  error_exit "Imagemagick must be installed. Aborting."
fi

newfile="${name}_${width}.${ext}"

"${convert}" "${file}" -resize "${width}"x "${newfile}"
echo -e "Done. New file: ${newfile}"
