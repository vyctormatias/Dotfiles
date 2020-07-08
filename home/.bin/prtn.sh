#!/usr/bin/env bash

save_var=/tmp/opt-main
location="$HOME/Pictures/Screenshots"
filename="$(date +%d-%m-%Y-%T).png"

if [[ -z "$@" ]]
then
	echo "Take a full screen screenshot"
	echo "Take a screenshot of a selection"
fi

if [[ ! -e "$save_var" && -n "$@" ]];then
	echo "$@" > "$save_var"
	count=0
fi

if [[ -n "$@" ]]
then
	echo "Save"
	echo "Copy to clipboard"
fi

if [[ $(sed -n '$=' $save_var 2>/dev/null) == 1 && "$count" != 0 ]]
then
	echo "$@" >> "$save_var"
fi

if [[ $(sed -n '$=' $save_var 2>/dev/null) == 2 ]];then
	
	killall rofi && sleep 0.5

	_type=$(sed -n '1p' $save_var)
	_do=$(sed -n '2p' $save_var)

	if [[ "$_type" == "Take a full screen screenshot" ]]
	then
		if [[ "$_do" == "Save" ]]; then
			maim -u "${location}/${filename}"
			notify-send "Take!" "Screenshot has been saved!"
		else
			maim -u | xclip -selection clipboard -t image/png
			notify-send "Take!" "Screenshot has been copied to clipboard"
		fi
	else
		if [[ "$_do" == "Save" ]]; then
			maim -us "${location}/${filename}"
			notify-send "Take!" "Screenshot has been saved!"
		else
			maim -us | xclip -selection clipboard -t image/png
			notify-send "Take!" "Screenshot has been copied to clipboard"
		fi
	fi
	rm "$save_var"
fi
