#!/usr/bin/env bash
#
#  ██╗    ██╗ █████╗ ██╗     ██╗     ██████╗  █████╗ ██████╗ ███████╗██████╗
#  ██║    ██║██╔══██╗██║     ██║     ██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗
#  ██║ █╗ ██║███████║██║     ██║     ██████╔╝███████║██████╔╝█████╗  ██████╔╝
#  ██║███╗██║██╔══██║██║     ██║     ██╔═══╝ ██╔══██║██╔═══╝ ██╔══╝  ██╔══██╗
#  ╚███╔███╔╝██║  ██║███████╗███████╗██║     ██║  ██║██║     ███████╗██║  ██║
#   ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝
#
#  ██╗      █████╗ ██╗   ██╗███╗   ██╗ ██████╗██╗  ██╗███████╗██████╗
#  ██║     ██╔══██╗██║   ██║████╗  ██║██╔════╝██║  ██║██╔════╝██╔══██╗
#  ██║     ███████║██║   ██║██╔██╗ ██║██║     ███████║█████╗  ██████╔╝
#  ██║     ██╔══██║██║   ██║██║╚██╗██║██║     ██╔══██║██╔══╝  ██╔══██╗
#  ███████╗██║  ██║╚██████╔╝██║ ╚████║╚██████╗██║  ██║███████╗██║  ██║
#  ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
#
#    Originally written by: gh0stzk - https://github.com/gh0stzk/dotfiles
#    This copy is edited by digital-raven. ASCII Art kept for obvious reasons.
#
#    This script runs the rofi launcher to select wallpapers.
#
#    Raven's edits remove the pointless rofi_override. No differences shown
#    during tests. Also added .gif support.

wall_dir="${HOME}/.config/Wallpapers"
cacheDir="${HOME}/.cache/Wallpapers"
rofi_command="rofi -dmenu -theme ${HOME}/.config/rofi/harness-wallpaper.rasi"

# Create cache dir if not exists
if [ ! -d "${cacheDir}" ] ; then
    mkdir -p "${cacheDir}"
fi

# Convert images in directory and save to cache dir
for imagen in "$wall_dir"/*.{jpg,jpeg,png,webp,gif}; do
    if [ -f "$imagen" ]; then
        nombre_archivo=$(basename "$imagen")
            if [ ! -f "${cacheDir}/${nombre_archivo}" ] ; then
                convert -strip "$imagen" -thumbnail 500x500^ -gravity center -extent 500x500 "${cacheDir}/${nombre_archivo}"
            fi
    fi
done

wall_selection=$(find "${wall_dir}" -maxdepth 1 -type f,l \( -iname "*.png" -o -iname "*.webp" -o -iname "*.gif" -o -iname "*.jpg" -o -iname "*.jpeg" \) -exec basename "{}" \; | sort | while read -r A ; do  echo -en "$A\x00icon\x1f""${cacheDir}"/"$A\n" ; done | $rofi_command )

# Set the wallpaper
[[ -n "$wall_selection" ]] || exit 1
swww img ${wall_dir}/${wall_selection}

exit 0
