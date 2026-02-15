#!/usr/bin/env bash

THIS_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
EMOJIS_FILEPATH="${THIS_DIR}/emojis.txt"
EMOJI="$(cat "${EMOJIS_FILEPATH}" | rofi -dmenu | cut -d ' ' -f1 | tr -d '\n')"
wl-copy "${EMOJI}"
wtype "${EMOJI}"
