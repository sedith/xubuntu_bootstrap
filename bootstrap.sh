#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y curl wget vim

# bashrc
cp ./bashrc ~/.bashrc

# git config
cp ./gitconfig ~/.gitconfig

# terminator
sudo apt-get install -y terminator
mkdir -p ~/.config/terminator
cp ./config_files/config/terminator/config ~/.config/terminator/

# brave browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser

# thunderbird
sudo apt-get install -y thunderbird

# redshift
sudo apt-get install -y redshift
cp ./config_files/config/redshift.conf ~/.config/
cp ./config_files/config/autostart/redshift-gtk.desktop ~/.config/autostart/

# sound switcher indicator
sudo apt-add-repository ppa:yktooo/ppa
sudo apt-get update
sudo apt-get install -y indicator-sound-switcher
sudo cp ./config_files/etc/xdg/autostart/indicator-sound-switcher.desktop /etc/xdg/autostart/

# quad9
sudo cp ./config_files/etc/systemd/resolved.conf /etc/systemd/
sudo systemctl start systemd-resolved.service

# vpn
sudo apt-get install -y openvpn
# TODO cyberghost vpn?

# pulsar
wget https://github.com/pulsar-edit/pulsar/releases/download/v1.103.0/Linux.pulsar_1.103.0_amd64.deb
sudo dpkg -i Linux.pulsar_1.103.0_amd64.deb
cp -r ./config_files/pulsar ~/.pulsar

# latex
sudo apt-get install -y texlive-latex-base texlive-latex-extra texlive-latex-recommended texlive-bibtex-extra cm-super latexmk biber

# ibus mocz
sudo apt-get install -y ibus ibus-mozc
sudo apt-get install -y xbindkeys
cp ./config_files/xbindkeysrc ~/.xbindkeysrc
xbindkeys_autostart

# panels and configs
cp -r ./config_files/config/xfce4/ ~/.config/xfce4

# disable pad when typing using libinputs, remove synaptics
echo 'add - Option "DisableWhileTyping" "True" - to libinput touchpad catchall in /usr/share/X11/xorg.conf.d/40-libinput.conf'
sudo vim /usr/share/X11/xorg.conf.d/40-libinput.conf
sudo apt remove xserver-xorg-input-synaptics*
