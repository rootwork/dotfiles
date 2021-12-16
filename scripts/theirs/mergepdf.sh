#!/bin/bash
# mergepdf.sh - Join an arbitrary number of PDFs into one PDF.
# Requires pdftk: sudo apt install pdftk

USAGE="mergepdf.sh outfile infile infile [additional infiles...]"

if [ -z "$1" ]; then
  echo "$USAGE"
  exit 1
fi

pdftk=$(command -v pdftk)
if [[ ! $pdftk ]]; then
  error_exit "pdftk must be installed: sudo apt install pdftk"
fi

outfile=$1
shift

idx=1
for arg in "$@"; do
  arg[$idx]=${arg}
  if [ ! -f "${arg}" ]; then
    echo "File not found: ${arg}"
    exit 1
  fi
  (("idx += 1"))
done

"$pdftk" "$@" cat output "$outfile"
echo "Merged PDF created: $outfile"
