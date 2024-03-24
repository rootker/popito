#!/bin/bash

case "$1" in
    --toggle)
        if mpc | grep -q 'status playing'; then
           mpc play 
        else
          mpc pause 
        fi
        ;;
    *)
        if mpc >/dev/null | head -1; then
		output=$(mpc current -f %title%)
		if ((${#output} > 21)); then
			echo ${output:0:21}"..."
		else
			echo $output
		fi
        fi
        ;;
esac
