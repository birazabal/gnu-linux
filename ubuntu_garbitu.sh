#!/bin/bash
echo "************** Ubuntu 16.04 garbitzeko *******************"
echo "**********************************************************"
#Ubuntu 16.04 optimizatu
#aplikazioen desinstalazioa
#aptitude instalatu commons ezabatzeko
echo "[+] aplikazioak desintalatzen"
#*****************************************
#1.- unity webapss kendu
#zeintzuk dauden ikusteko:
#a.- apt-cache search unity-webapps
#b.- sudo apt-get remove unity-webapps-amazoncloudreader
#sudo apt-get remove unity-webapps-bbcnews
#sudo apt-get remove unity-webapps-cnn-news
#sudo apt-get remove unity-webapps-deezer
#aptitude instalatzeko
#sudo apt-get install aptitude
echo "[%1][Unity webapps sistematik ezabatzen]"
sudo aptitude remove '?depends(unity-webapps-common)'
#***************************************************************************************
#2.-Amazon kendu (berrabiaraztean berriro azalduko da) 
#ubuntu 12, 13: Amazon etb kentzeko > sudo apt-get remove unity-lens-shopping 
#https://askubuntu.com/questions/760204/how-to-remove-the-unity-amazon-package-in-16-04
echo "[%2][Amazon sistematik ezabatzen*]"
sudo rm /usr/share/applications/ubuntu-amazon-default.desktop
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/Amazon.user.js
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/manifest.json
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/
#**************************************************************************************
#3.- Memoria birtualaren kudeaketa
#https://ubunlog.com/swappiness-como-ajustar-el-uso-de-la-memoria-virtual/
echo "[%3][Memoria birtualaren kudeaketa moldatzen*ESKUZ]"
sudo sysctl vm.swappiness=10
#echo "vm.swappiness = 10" >> /etc/sysctl.conf  **** permanente egiteko sysctl.conf fitxategian hau aldatu edo editatu
#edo
#echo vm.swappiness=20 | sudo tee -a /etc/sysctl.conf 
#sudo sysctl -p
#cat /proc/sys/vm/swappiness
#**************************************************************************************
#4.- Disko gogorraren idazketa katxea Aktibatu
#https://ubunlog.com/optimiza-rendimiento-ubuntu/
echo "[%4][Disko gogor nagusiaren (sda) idazketa katxea aktibatzen]"
#desaktibatzeko sudo hdparm -W0 /dev/sda 
sudo hdparm -W1 /dev/sda
#**************************************************************************************
#5.- Aplikazioek RAMa erabiltzean hauen karga optimizatzeko
echo "[%5][Preload, RAM memoria kudeatzailea instalatzen"]
sudo apt-get install preload
#ordenagailu zaharretan, hau ere>> 
#sudo apt-get install preload zram-config
#**************************************************************************************
#6.- Aplikazioen liburutegi erabilienen optimizazioa, sistemako estekak
echo "[%6][Prelink liburutegi kudeatzailea instalatzen]"
sudo apt-get install prelink
#**************************************************************************************
#7.- Martxan dauden zerbitzuak ikusi eta geratu >> programa geratu egiten da
echo "[%7][Martxan dauden zerbitzuak ikusi eta geratu *ESKUZ"
#mahaiganaren abiokoak
#sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop
gnome-session-properties
#sudo systemctl list-units --all --state=active --type=service
#sudo systemctl disable ModemManager.service
#sudo systemctl stop ModemManager.service
#***************************************************************************************
#**************** hemen gehiago ***************************#
#**************************************************************************************
#97.- Terminal birtualak kapatu. Ubuntu 7 terminalekin dator, hauetatik batzuk "kapatu"
#http://www.ubuntu-es.org/node/4440
echo "[%97][Terminal birtualak kapatu * ESKUZ]"
#nano /etc/init/tty6.conf + azken bi lerroak komentatu 
#4,5 eta 6 kapatzeko /etc/init/tty4.conf /etc/init/tty5.conf eta /etc/init/tty6.conf moldatu
#*******************************************************************************************
#98.- Pakete zaharkitu umezurtzak ezabatu
echo "[%98][Pakete zaharkitu umezurtzak ezabatzen]"
sudo apt-get autoremove
#******************************************************************************************
#99.- Ubuntu eta honen deribatuen garbiketa automatikoa
echo "[%99][Sistema eragilea garbitzen"]
sudo apt-get autoclean
sudo apt-get clean
echo "[%100][Software gehigarriaren instalazioa?¿]"
#aplikazio interesgarriak
#sudo apt-get install Bleachbit
#https://internautero.blogspot.com.es/2016/05/optimizar-nuestro-pc-y-linux-al-maximo.html
