#!/bin/bash

while : ; do
	change=$(mpc idle)

	if [[ $change == player ]]; then
		status=$(mpc status | awk -F '[][]' 'NR == 2 { s = $2 } END { print s ? s : "stopped" }')

		#~/.orw/scripts/notify.sh "$status"

		case $status in
			stopped)
				all_bars=( $(ps aux | awk -F '[- ]' '!/awk/ && /generate_bar.* -m [^ ]*[ip-]/ {
					b = gensub(".*-n (\\w*).*", "\\1", 1)
					if(ab !~ "\\<" b "\\>") {
						ab = ab " " b
					}
				} END { print ab }') );;

			playing)
				~/bin/mpdnotify/song_notification.sh > /dev/null

				cover=$(ps aux | awk '!/awk/ && /title cover_art_widget/ { c = 1 } END { print c }')
				((cover)) && ~/.orw/scripts/widgets.sh cover show
		esac
	fi
done
