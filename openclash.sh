#!/bin/bash
clear
g="\033[1;32m"
r="\033[1;31m"
b="\033[1;34m"
w="\033[0m"
pack(){
 echo -e $b">"$w" prepare for installing dependencies ..."
 if [ -f $(pkg list-installed 2>/dev/null|grep unzip|awk '{print $1}') ]; then
  echo -e $b">"$w" installing package: "$g"unzip"$w
  pkg install unzip -y
 fi
 if [ -f $(pkg list-installed 2>/dev/null|grep screen|awk '{print $1}') ]; then
  echo -e $b">"$w" installing package: "$g"screen"$w
  pkg install screen -y
 fi
 if [ -f $(pkg list-installed 2>/dev/null|grep clash|awk '{print $1}') ]; then
  echo -e $b">"$w" installing package: "$g"clash"$w
  pkg install clash -y
 fi
 echo -e $b">"$w" successfully installing dependencies"
 rm -rf $HOME/.config/clash*
 curl -sLO "https://github.com/Haris131/clash/blob/main/.config.zip"
 echo -e $b">"$W" settings clash"
 unzip .config.zip -C $HOME/.config/clash >&/dev/null
 rm -rf .config.zip*
 exit
}

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
 "install")
 pack;exit
 ;;
esac
echo -e "\e[38;3m Start Clash\e[0m \e[34;1m(openclash start)\e[0m"
echo -e "\e[38;3m Stop Clash\e[0m \e[34;1m(openclash stop)\e[0m"
echo -e "\e[38;3m Edit Akun\e[0m \e[34;1m(openclash akun)\e[0m"
