#!/bin/bash
clear

case $1 in
 "start")
 clash -t -d $HOME/.config/clash -f $HOME/.config/clash/config.yaml 2>&1
 clear
 screen -dmS v2 clash &
 sleep 6
 xdg-open "http://127.0.0.1:9090/ui/#/proxies"
 echo -e "Buka pengaturan jaringan"
 echo -e "masuk ke Access Point Names (APN)"
 echo -e "APN : Bebas (Reccomended : internet)"
 echo -e "Proxy : 127.0.0.1"
 echo -e "Port : 7890"
 echo -e ""
 echo -e "yacd : http://127.0.0.1:9090/ui/#/proxies"
 exit
 ;;
 "stop")
 pidof clash >pid
 PID=$(<pid)
 kill -9 $PID
 rm pid 2>&1
 exit
 ;;
 "akun")
 nano $HOME/.config/clash/universal.yaml
 exit
 ;;
esac
echo -e "\e[38;3m Start Clash\e[0m \e[34;1m(openclash start)\e[0m"
echo -e "\e[38;3m Stop Clash\e[0m \e[34;1m(openclash stop)\e[0m"
echo -e "\e[38;3m Edit Akun\e[0m \e[34;1m(openclash akun)\e[0m"
