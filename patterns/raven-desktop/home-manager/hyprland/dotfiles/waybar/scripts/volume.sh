#!/usr/bin/env bash
#
# Adjust default device volume and send a notification with the current level
#
# Requirements:
# 	- pactl (libpulse)
# 	- dunstify (dunst)
#
# Author: Jesse Mirabel <sejjymvm@gmail.com>
# Created: September 07, 2025
# License: MIT

VALUE=1
MIN=0
MAX=100
ID=2425

print-usage() {
	local script=${0##*/}

	cat <<- EOF
		USAGE: $script [OPTIONS]

		Adjust default device volume and send a notification with the current level

		OPTIONS:
		    input            Set device as '@DEFAULT_SOURCE@'
		    output           Set device as '@DEFAULT_SINK@'

		    mute             Toggle device mute

		    raise <value>    Raise volume by <value>
		    lower <value>    Lower volume by <value>
		                         Default value: $VALUE

		EXAMPLES:
		    Toggle microphone mute:
		        $ $script input mute

		    Raise speaker volume:
		        $ $script output raise

		    Lower speaker volume by 5:
		        $ $script output lower 5
	EOF

	exit 1
}

check-muted() {
	local muted
	muted=$(pactl "get-$dev_mute" "$dev" | awk '{print $2}')

	local state
	case $muted in
		'yes') state='Muted' ;;
		'no') state='Unmuted' ;;
	esac

	echo "$state"
}

get-volume() {
	local vol
	vol=$(pactl "get-$dev_vol" "$dev" | awk '{print $5}' | tr -d '%')

	echo "$vol"
}

get-icon() {
	local state vol
	state=$(check-muted)
	vol=$(get-volume)

	local icon
	local new_vol=${1:-$vol}

	if [[ $state == 'Muted' ]]; then
		icon="$HOME/.config/dunst/icons/$dev_icon-muted-white.png"
	else
		if ((new_vol < ((MAX * 33) / 100))); then
			icon="$HOME/.config/dunst/icons/$dev_icon-low-white.png"
		elif ((new_vol < ((MAX * 66) / 100))); then
			icon="$HOME/.config/dunst/icons/$dev_icon-medium-white.png"
		else
			icon="$HOME/.config/dunst/icons/$dev_icon-high-white.png"
		fi
	fi

	echo "$icon"
}

toggle-mute() {
	pactl "set-$dev_mute" "$dev" toggle

	local state icon
	state=$(check-muted)
	icon=$(get-icon)

	dunstify "$title: $state" -I "$icon" -r $ID -t 1300
}

set-volume() {
	local vol
	vol=$(get-volume)

	local new_vol
	case $action in
		'raise')
			new_vol=$((vol + value))
			((new_vol > MAX)) && new_vol=$MAX
			;;
		'lower')
			new_vol=$((vol - value))
			((new_vol < MIN)) && new_vol=$MIN
			;;
	esac

	pactl "set-$dev_vol" "$dev" "${new_vol}%"

	local icon
	icon=$(get-icon "$new_vol")

	dunstify "$title: ${new_vol}%" -I "$icon" -r $ID -t 1300
}

main() {
	device=$1
	action=$2
	value=${3:-$VALUE}

	! ((value > 0)) && print-usage

	case $device in
		'input')
			dev='@DEFAULT_SOURCE@'
			dev_mute='source-mute'
			dev_vol='source-volume'
			dev_icon='mic-volume'
			title='Microphone'
			;;
		'output')
			dev='@DEFAULT_SINK@'
			dev_mute='sink-mute'
			dev_vol='sink-volume'
			dev_icon='audio-volume'
			title='Volume'
			;;
		*) print-usage ;;
	esac

	case $action in
		'mute') toggle-mute ;;
		'raise' | 'lower') set-volume ;;
		*) print-usage ;;
	esac
}

main "$@"
