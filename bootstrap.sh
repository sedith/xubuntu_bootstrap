#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y curl wget vim git

# bashrc
cp ./config_files/bashrc ~/.bashrc

# git config
cp ./config_files/gitconfig ~/.gitconfig

# terminator
sudo apt-get install -y terminator
mkdir -p ~/.config/terminator
cp ./config_files/config/terminator/config ~/.config/terminator/

# brave browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser
# TODO sync browser

# thunderbird
sudo apt-get install -y thunderbird
# TODO export config and import it

# redshift
sudo apt-get install -y redshift
cp ./config_files/config/redshift.conf ~/.config/
cp ./config_files/config/autostart/redshift-gtk.desktop ~/.config/autostart/

# sound switcher indicator
sudo apt-add-repository -y ppa:yktooo/ppa
sudo apt-get update
sudo apt-get install -y indicator-sound-switcher
cp ./config_files/config/autostart/indicator-sound-switcher.desktop config/autostart/

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
rm Linux.pulsar_1.103.0_amd64.deb
# TODO pulsar packages using submodules (how to set config?)

# latex
sudo apt-get install -y texlive-latex-base texlive-latex-extra texlive-latex-recommended texlive-bibtex-extra cm-super latexmk biber

# ibus mocz
sudo apt-get install -y ibus ibus-mozc
sudo apt-get install -y xbindkeys
cp ./config_files/xbindkeysrc ~/.xbindkeysrc
xbindkeys_autostart
# TODO export ibus keyboard layout config?

# panels and configs
cp -r ./config_files/config/xfce4/panel/* ~/.config/xfce4/panel/
cp -r ./config_files/config/xfce4/xfconf/xfce-perchannel-xml/ ~/.config/xfce4/xfconf/xfce-perchannel-xml/

# disable pad when typing using libinputs, remove synaptics
echo 'add - Option "DisableWhileTyping" "True" - to libinput touchpad catchall in /usr/share/X11/xorg.conf.d/40-libinput.conf'
sudo vim /usr/share/X11/xorg.conf.d/40-libinput.conf
sudo apt remove -y xserver-xorg-input-synaptics*
# TODO do it properly through commandlines

# zotero
# TODO install + clouded bib?

# matlab
# TODO install + clouded bib?

# signal desktop
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list
sudo apt update
sudo apt install -y signal-desktop

# install stuff
sudo apt-get install -y blueman bluetooth
sudo apt-get install -y kolourpaint
sudo apt-get install -y thunar-archive-plugin engrampa
sudo apt-get install -y okular
sudo apt-get install -y plocates
sudo apt-get install -y xfce4-cpugraph-plugin
sudo apt-get install -y sqlite3

# default apps
cp ./config_files/config/mimeapps.list ~/.config/
sudo update-alternatives --set x-terminal-emulator /usr/bin/terminator

# custom home
rm -d ~/Documents
rm -d ~/Public
rm -d ~/Templates
rm -d ~/Videos
echo "snap" > .hidden

# wallpaper
cp -r wallpapers/ ~/Pictures/

# reboot
reboot
