# ~/bin/rofi-file-browser.sh
dir=${1:-$HOME}
selected=$(ls "$dir" | rofi -dmenu -p "Browse: $dir")

[ -n "$selected" ] && rofi-file-browser.sh "$dir/$selected"
