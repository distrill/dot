# ~/bin/rofi-power-menu.sh
options="Lock\nLogout\nSuspend\nReboot\nShutdown"
selected=$(echo -e $options | rofi -dmenu -p "Power Menu")

case $selected in
    Lock) i3lock ;;
    Logout) i3-msg exit ;;
    Suspend) systemctl suspend ;;
    Reboot) systemctl reboot ;;
    Shutdown) systemctl poweroff ;;
esac
