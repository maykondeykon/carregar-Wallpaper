#!/bin/bash

# Informe aqui seu usuário no formato "DOMÍNIO/usuário"
user="SSP/user"
# Informe aqui sua senha do domínio
pass="pass"

pathWallPaper="//172.20.1.111/wallpaper/"
temp=$HOME/"wallpaperTemp"
dirLocal=$HOME/".wallpaperSuinf"
wallpaperName="Wallpaper.jpg"
mkdir -p ${temp}
mkdir -p ${dirLocal}
sudo mount.cifs ${pathWallPaper} ${temp} -o user=${user},password=${pass},file_mode=0777,dir_mode=0777
cp ${temp}/Wallpaper.jpg ${dirLocal}
gsettings set org.gnome.desktop.background picture-uri file://${dirLocal}/${wallpaperName}
sleep 1
sudo umount ${temp}/
rm -Rf ${temp}
