#!/bin/sh

#LOCKER="xkblayout-state set 0 && i3lock -c 000000 -e -f && sleep 1"
LOCKER="lock"
CHOICES="1 Отключится от сети WireGuard|2 Подключится к сети WireGuard"

cmd=$(echo -e $CHOICES | rofi -i -width 300 -lines 2 -dmenu -sep "|")

case $cmd in
    "1 Отключится от сети WireGuard")
        sudo wg-quick down wg0
        notify-send -t 3000 "Вы успешно отключились от сети WireGuard"
	;;
    "2 Подключится к сети WireGuard")
		sudo wg-quick up wg0
		notify-send -t 3000 "Вы успешно подключились к сети WireGuard"
	;;
esac
