#!/bin/sh

set -e

_files="./ia/"
_id="RubenerdShow281"

echo "Checking if eyeD3 is installed..."
command -v eyeD3 >/dev/null 2>&1 || {
  echo "eyeD3 not installed, or not in \$PATH.";
  exit 1
}

eyeD3 \
  --fs-encoding "utf-8" \
  --artist "${_creator}" \
  --album "${_series}" \
  --album-artist "${_creator}" \
  --title "${_title}" \
  --track ${_episode_number} \
  --genre "New Time Radio" \
  --release-year ${_year} \
  --add-lyrics "${_files}${_id}_lyrics.txt" \
  --remove-all-images \
  --add-image "${_files}${_id}.png:FRONT_COVER" \
  --encoding "utf-8" \
  --preserve-file-times \
  "${_file}{$_id}.mp3"

#  --comment ${_description}"

onsug() {
eyeD3 \
  --fs-encoding "utf-8" \
  --artist "${_creator}" \
  --album "Overnightscape Underground ${_series}" \
  --album-artist "${_creator}" \
  --title "${_title}" \
  --track 0 \
  --genre "New Time Radio" \
  --release-year ${_year} \
  --add-lyrics ${_description} \
  --encoding "utf-8" \
  --preserve-file-times
#  --comment ${_description}"
}
