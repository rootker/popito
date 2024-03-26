#!/bin/bash

artist=$(mpc current -f %artist%)
title=$(mpc current -f %title%)
album=$(mpc current -f %album%)

cover=~/Downloads/music/covers/${album// /_}.jpg

info="$artist    <b>$title</b>"

#info="<b>artist:</b>  $artist\n"
#info+="<b>title:</b>   $title\n"
#info+="<b>album:</b>   $album"

[[ -f $cover ]] && icon="${cover//[()]/}"
#[[ $artist && $title ]] && ~/.orw/scripts/notify.sh $icon -r 101 -F 'Iosevka Orw' -f 8 -p "$info"
TMP_COVER_PATH="/tmp/mpd-track-cover.jpg"
DEFAULT_COVER="~/Downloads/music/cover.png"
exiftool -b -Picture "$HOME/Downloads/music/$(mpc -p 6600 --format "%file%" current)" > "$TMP_COVER_PATH"
if [ $(file $TMP_COVER_PATH|awk '{print $2}') = "empty" ];then
notify-send --expire-time=3000 -i "${DEFAULT_COVER}" "NOW PLAYING " "$info" ; sleep 0.5
else
notify-send --expire-time=3000 -i "${TMP_COVER_PATH}" "NOW PLAYING " "$info" ; sleep 0.5
fi
