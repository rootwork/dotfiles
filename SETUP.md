This was created using Linux Mint. Other Debian-based distros should work just as well, though the directions to parts of the UI will be different.

# First-run OS and computer setup

Update all the things!

```
sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo apt autoremove
sudo apt autoclean
```

If this is a reinstall rather than a brand-new machine, skip to the next step.

```
sudo fwupdmgr get-devices
sudo fwupdmgr get-updates
sudo fwupdmgr update
```

# Program setup

## Software manager

* Filezilla
* Gimp
* Git
* Skype
* Sublime Text

## Applets

* Weather [weather-mockturtl]
* Color Picker

## Manual downloads

* [Autokey](https://github.com/autokey/autokey/wiki/Installing#debian-and-derivatives)
* [Zoom](https://zoom.us/download#client_4meeting)
* [Rambox](https://github.com/ramboxapp/community-edition/releases) (get the most recent `-linux-amd64.deb` file)
* [QuickEmu](https://github.com/wmutschl/quickemu), in lieu of VirtualBox, if needed

## Firefox

* Log in to Firefox Sync
* Boom!

## Thunderbird

* Open program, quit wizard, quit program
* Open `.thunderbird` in home directory
* Copy over extensions, preferences, etc from previous profile directory into new `*.default-release` directory

# CLI fun

## Installations

* `sudo add-apt-repository ppa:aos1/diff-so-fancy`
* `sudo add-apt-repository ppa:agornostal/ulauncher`
* `sudo add-apt-repository ppa:yubico/stable`
* `sudo add-apt-repository ppa:font-manager/staging`
* `sudo add-apt-repository ppa:jonaski/strawberry`
* `sudo apt update`
* `sudo apt install diff-so-fancy xclip zsh python python3-pip rar guake ulauncher whois dconf-editor arc-theme apache2 mysql-server php libapache2-mod-php php-mysql php7.4-xml libpam-yubico yubikey-manager font-manager nemo-font-manager nemo-image-converter strawberry chromium`
* `pip3 install pygithub`
* Right-click the big "U" Ulauncher icon in the system tray and exit
* Right-click the big "A" autokey icon in the system tray and quit

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
* `cp .* ~/`

## Grab private config settings and load them

* `cd ~`
* `git clone git@github.com:rootwork/config-repo.git repos/config-repo`
* `sudo cp -rf config-repo/* ~/.config`
* `dconf load / < ~/.config/config.conf`
* `rm ~/.config/README.md`

## Now finish setting up

* `cd ~`
* `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
* `git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions`
* `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
* `git clone https://github.com/bobthecow/git-flow-completion ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-flow-completion`
* `git clone https://gist.github.com/475ee7768efc03727f21.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-auto-status`
* `git clone https://github.com/supercrabtree/k ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/k`
* `source ~/.zshrc`
* Run Update Manager and install anything new

# Bits and bobs

## Autoconnect trusted Bluetooth devices

* Pair all devices using Bluetooth GUI
* `bluetoothctl devices`
* By default paired devices will be trusted
* `bluetoothctl untrust [device_id]` for each device you do NOT want to autoconnect
* `git clone https://github.com/jrouleau/bluetooth-autoconnect.git repos/bluetooth-autoconnect`
* `sudo cp repos/bluetooth-autoconnect/bluetooth-autoconnect.service /etc/systemd/system/`
* `sudo cp '/home/ivan/repos/bluetooth-autoconnect/bluetooth-autoconnect' /usr/bin/`
* `sudo systemctl enable bluetooth-autoconnect.service`
* `sudo systemctl start bluetooth-autoconnect.service`
* Reboot, making sure any wired mice are not connected (they'll prevent Bluetooth mice from registering clicks)
* Note you'll get a warning about no keyboard on startup if you use a Bluetooth keyboard; no worries, it'll kick in on the login screen

## Fix xdg-open error messages from Nemo
* `sudo mkdir -p /var/lib/samba/usershares/`
* `sudo chmod go+rwx /var/lib/samba/usershare`

## Install M$ fonts
* `sudo apt install -y ttf-mscorefonts-installer`

# Startup applications

* Confirm the following are listed: Guake, Ulauncher, Autokey, Rambox, Mullvad (if used)
* Log out, then log back in

# Backup!

* Timeshift > Create