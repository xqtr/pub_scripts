#!/bin/bash

install() {
  sudo apt-get install "$@" -y
}

getgit() {
  git clone http://github.com/"$@"
}

cd ~
mkdir various tools bin programming

sudo apt-get update
sudo apt-get upgrade

sudo dpkg-reconfigure locales

install pcmanfm
install audacious
install audacity
install filezilla
install git
install tmux
install fzf
install dosbox
install gparted
install gdebi
install moc 
install mc
install aspell
install automake net-tools binutils cmake curl dialog
install ffmpeg
install geany-plugin-*
install ghex
install dmenu
install htop
install lynx
install mpv
install nmap aircrack-ng
install rtl-sdr rtl-433
install sox
install sqlite3 sqlite3-dev
install sshpass
install suckless-tools
install synaptic 
install tcpdump tree unrar unzip usbutils wget p7zip* rar
install wireless-tools
install uget
install wmctrl
install python3-pip
install sqlitebrowser  
install exa
#text plugin for xfxe panel
install xfce4-genmon-plugin

# sudo snap install glow # Markdown reader in terminal

#PiShring to shrink image .img files.
install -y wget parted gzip pigz xz-utils udev e2fsprogs
wget https://raw.githubusercontent.com/Drewsif/PiShrink/master/pishrink.sh -O /tmp/pishrink.sh
chmod +x /tmp/pishrink.sh
sudo mv /tmp/pishrink.sh /usr/local/bin
rm /tmp/pishrink.sh


# python stuff
pip install yt-dlp
pip install pygments
pip install pyspellchecker
pip install pyperclip
pip install pycp
pip install tldr
#awesome file server
python3 -m pip install --user -U copyparty
#retrochat!
python3 -m pip install --user -U r0c
# code formatter for python
pip install black

cd ~
wget http://andr01d.zapto.org:8080/Files/xqtr_tools/tmux.conf
wget http://andr01d.zapto.org:8080/Files/xqtr_tools/nanorc
wget http://andr01d.zapto.org:8080/Files/xqtr_tools/bash_aliases
wget http://andr01d.zapto.org:8080/Files/xqtr_tools/geany-xqtr.conf

sudo cp geany-xqtr.conf /usr/share/geany/colorschemes/

cd ~/tools

getgit xqtr/clied
getgit justchokingaround/lobster
getgit justchokingaround/jerry
getgit pystardust/ani-cli


ln /home/x/tools/clied/clied.py /home/x/bin/clied.py

echo -e '#!/bin/bash\ncd ~/tools/ani-cli\n./ani-cli' > /home/x/bin/ani-cli
echo -e '#!/bin/bash\ncd ~/tools/jerry\n./jerry.sh' > /home/x/bin/jerry.sh
echo -e '#!/bin/bash\ncd ~/tools/lobster\n./lobster.sh' > /home/x/bin/lobster.sh

chmod +x /home/x/bin/jerry.sh
chmod +x /home/x/bin/lobster.sh
chmod +x /home/x/bin/ani-cli
