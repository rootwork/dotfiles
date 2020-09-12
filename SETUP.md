# Hardware

## Keybinding

* Keyboard > Layouts > Options...
* Ctrl position
* Swap Left Win with Left Ctrl
* Swap Right Win with Right Ctrl

## Autoconnect trusted Bluetooth devices

* Pair all devices using Bluetooth GUI
* `bluetoothctl devices`
* By default paired devices will be trusted
* `bluetoothctl untrust [device_id]` for each device you do NOT want to autoconnect
* `git clone https://github.com/jrouleau/bluetooth-autoconnect.git`
* `sudo cp bluetooth-autoconnect/bluetooth-autoconnect.service /etc/systemd/system/`
* `sudo cp '/home/ivan/bluetooth-autoconnect/bluetooth-autoconnect' /usr/bin/`
* `sudo systemctl enable bluetooth-autoconnect.service`
* `sudo systemctl start bluetooth-autoconnect.service`
* Reboot, making sure any wired mice are not connected (they'll prevent Bluetooth mice from registering clicks)
* Note you'll get a warning about no keyboard on startup if you use a Bluetooth keyboard; no worries, it'll kick in on the login screen

# Program setup

## Software manager

* Filezilla
* Gimp
* Git
* Sublime Text
* VirtualBox

## File manager

* Edit > Preferences
* View new folders using: List View
* In any folder, <kbd>ctrl-h</kbd> to show hidden (dot) files

## Firefox

* Log in to Firefox Sync
* Boom!

## Thunderbird

* Open program, quit wizard, quit program
* Open `.thunderbird` in home directory
* Copy over extensions, preferences, etc from previous profile directory into new `*.default-release` directory

## Manual downloads

* Google Chrome

# CLI fun

## Installations

* `sudo add-apt-repository ppa:aos1/diff-so-fancy`
* `sudo apt update`
* `sudo apt install diff-so-fancy`
* `sudo apt-get install xclip`
* `sudo apt install zsh`

## Setup Zsh/Oh My Zsh/Powerline
* `sudo usermod -s $(which zsh) ivan`
* logout/login
* open Terminal and choose option 2
* `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
* `cd $HOME/Downloads`
* `wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf`
* `wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf`
* `wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf`
* `wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf`
* Navigate to `Downloads` and double-click on each font to install it
* Right click Terminal window and choose Preferences
* On the selected profile, under Profiles, check Custom font under Text Appearance and select MesloLGS NF Regular, size 12
* `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k`

## Create SSH keys

* `ssh-keygen -t rsa -b 4096 -C "ivan@rootwork.org"`
* `eval "$(ssh-agent -s)"`
* `ssh-add ~/.ssh/id_rsa`

# Online setup

## GitHub: Add SSH key

* `xclip -sel clip < ~/.ssh/id_rsa.pub`
* https://github.com/settings/ssh/new

# Dotfile time

* `cd ~`
* `git clone git@github.com:rootwork/dotfiles.git`
* `cd dotfiles`
* `git checkout local-nix`
* `cp .gitconfig ~/`
* `cp .gitignore ~/`
* `cp .zshrc ~/`
* `cp .p10k.zsh ~/`
* `source ~/.zshrc`

# Things to investigate

* version of Mac CLI `open .`

# Backup!

* Timeshift > Create