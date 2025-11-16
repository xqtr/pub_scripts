cd ~
mkdir scripts bin

# Termux Stuff 
pkg update
pkg upgrade
termux-setup-storage
pkg install termux-tools
pkg install termux-api
pkg install openssh
echo "Set new password for SSH!"
passwd

# Hide MOTD/Login text
touch ~/.hushlogin 

pkg install net-tools
pkg install python3
pkg install python-pip
pkg install git
pkg install tmux
pkg install automake net-tools binutils cmake curl dialog
pkg install htop
pkg install lynx
pkg install nmap
pkg install tree unrar unzip usbutils wget p7zip* rar


# Python libraries
pip install yt-dlp
pip install pygments
pip install pyspellchecker
pip install pyperclip
pip install pycp


# create scripts

cat <<EOF > ~/scripts/sshelp.sh
#!/bin/bash
echo "Local IP:"
ifconfig | grep inet
echo "Starting SSH..."
sshd
echo "Connect with: ssh $(whoami)@IP -p 8022"
echo "Stop SSH server with: killall sshd"
EOF

cd ~
#for f in .shortcuts/*.sh
#do
#  termux-fix-shebang $f
#done

termux-toast "Finished Termux setup!"
