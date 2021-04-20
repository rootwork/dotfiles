<!-- The following section, from "ts" to "te", is an automatically-generated
  table of contents, updated whenever this file changes. Do not edit within
  this section. -->

<!--ts-->
   * [First-run OS and computer setup](#first-run-os-and-computer-setup)
   * [Program setup](#program-setup)
      * [Applets](#applets)
      * [Manual downloads](#manual-downloads)
      * [Firefox](#firefox)
      * [Thunderbird](#thunderbird)
   * [CLI fun](#cli-fun)
      * [General installations](#general-installations)
      * [Setup Zsh/Oh My Zsh/Powerline](#setup-zshoh-my-zshpowerline)
      * [Setup <a href="https://techviewleo.com/how-to-install-and-use-docker-in-linux-mint/" rel="nofollow">Docker</a> and <a href="https://docs.lando.dev/basics/installation.html#linux" rel="nofollow">Lando</a>](#setup-docker-and-lando)
      * [Setup <a href="https://github.com/lastpass/lastpass-cli">LastPass CLI</a>](#setup-lastpass-cli)
      * [Create SSH keys](#create-ssh-keys)
   * [Online setup](#online-setup)
      * [GitHub: Add SSH key](#github-add-ssh-key)
   * [Dotfile time](#dotfile-time)
      * [Grab private config settings and load them](#grab-private-config-settings-and-load-them)
      * [Now finish setting up](#now-finish-setting-up)
   * [Bits and bobs](#bits-and-bobs)
      * [Autoconnect trusted Bluetooth devices](#autoconnect-trusted-bluetooth-devices)
      * [Set Sublime Text as editor for sudo commands](#set-sublime-text-as-editor-for-sudo-commands)
      * [Fix xdg-open error messages from Nemo](#fix-xdg-open-error-messages-from-nemo)
      * [Install M$ fonts](#install-m-fonts)
      * [Setup logiops for Logitech devices](#setup-logiops-for-logitech-devices)
      * [Add some Nemo actions](#add-some-nemo-actions)
      * [Extras](#extras)
   * [Startup applications](#startup-applications)
   * [Backup!](#backup)

<!-- Added by: runner, at: Thu Apr  1 18:34:21 UTC 2021 -->

<!--te-->

This was created using Linux Mint. Other Debian-based distros should work just
as well, though the directions to parts of the UI will be different.

**This assumes a SINGLE-USER machine with root access.** In a multiuser environment, this setup must be *audited first* to ensure a reasonable level of security!

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

## Applets

* Weather [weather-mockturtl]
* Color Picker

## Manual downloads

* [Autokey](https://github.com/autokey/autokey/wiki/Installing#debian-and-derivatives)
* [Rambox](https://github.com/ramboxapp/community-edition/releases) (get the most recent `-linux-amd64.deb` file)
* QEMU (`sudo apt install -y qemu qemu-system-x86`) plus [QuickEmu](https://github.com/wmutschl/quickemu), in lieu of VirtualBox, if needed

## Firefox

* Log in to Firefox Sync
* Boom!

## Thunderbird

* Open program, quit wizard, quit program
* Open `.thunderbird` in home directory
* Copy over extensions, preferences, etc from previous profile directory into new `*.default-release` directory

# CLI fun

## General installations

* `sudo add-apt-repository ppa:aos1/diff-so-fancy`
* `sudo add-apt-repository ppa:agornostal/ulauncher`
* `sudo add-apt-repository ppa:yubico/stable`
* `sudo add-apt-repository ppa:font-manager/staging`
* `sudo add-apt-repository ppa:jonaski/strawberry`
* `sudo add-apt-repository ppa:costales/folder-color`
* `wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -`
* `sudo apt install -y apt-transport-https`
* `echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list`
* `sudo apt update`
* `sudo apt install -y git diff-so-fancy xclip zsh python python3-pip rar guake ulauncher whois dconf-editor arc-theme apache2 mysql-server php libapache2-mod-php php-mysql php7.4-xml libpam-yubico yubikey-manager sublime-text font-manager nemo-font-manager imagemagick webp jpegoptim optipng nemo-image-converter strawberry chromium filezilla gimp skypeforlinux vlc libncurses5-dev poppler-utils trimage dos2unix sublime-merge cockpit xclip xsel nemo-emblems folder-color-nemo nemo-image-converter`
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

## Setup [Docker](https://techviewleo.com/how-to-install-and-use-docker-in-linux-mint/) and [Lando](https://docs.lando.dev/basics/installation.html#linux)
* Turn off VPNs! Installation may fail with them on, sadly.
* `sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common`
* `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
* `sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable"`
* `sudo apt-get update`
* `sudo apt-get -y install docker-ce`
* `sudo usermod -aG docker $USER`
* `wget https://files.devwithlando.io/lando-stable.deb`
* `sudo dpkg -i lando-stable.deb`

## Setup [LastPass CLI](https://github.com/lastpass/lastpass-cli)

* `sudo apt-get --no-install-recommends -yqq install bash-completion build-essential cmake libcurl4 libcurl4-openssl-dev libssl-dev libxml2 libxml2-dev libssl1.1 pkg-config ca-certificates xclip`
* `git clone git@github.com:lastpass/lastpass-cli.git`
* `cd lastpass-cli && make`
* `sudo make install`

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
* `git clone https://github.com/Xfennec/progress.git ~/progress && cd ~/progress && make && sudo make install && cd ~ && rm -rf ~/progress`
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

## Set Sublime Text as editor for `sudo` commands
`sudo`-edit `/etc/environment` and add the following:

```
# Use Sublime for editing even within sudo
export EDITOR='/usr/bin/subl -w'
export VISUAL='/usr/bin/subl -w'
```

## Fix xdg-open error messages from Nemo
* `sudo mkdir -p /var/lib/samba/usershares/`
* `sudo chmod go+rwx /var/lib/samba/usershare`

## Set up Zoom with Firejail

Sourced from [Aral Balkan](https://ar.al/2020/06/25/how-to-use-the-zoom-malware-safely-on-linux-if-you-absolutely-have-to/):

1. `sudo apt install firejail firejail-profiles`
2. `sudo apt install apparmor-utils`
3. `sudo aa-enforce firejail-default`
4. `mkdir -p ~/.config/firejail`
5. `echo "protocol unix,inet,inet6,netlink\nignore seccomp\nseccomp \x21chroot" > ~/.config/firejail/zoom.local`
6. [Download Zoom](https://zoom.us/download#client_4meeting)
7. `mkdir -p ~/.zoom`
8. `firejail --apparmor --private=$HOME/.zoom zoom`
9. If this works, exit zoom from the menubar icon and proceed.
10. `sudo rm /usr/bin/zoom`
11. `sudo me=$HOME bash -c 'echo -e "#!/bin/bash\nfirejail --apparmor --profile=/etc/firejail/zoom.profile --private=$me/.zoom /opt/zoom/ZoomLauncher" > /usr/bin/zoom'`
12. `sudo chmod a+x /usr/bin/zoom`

This will run Zoom within Firejail anytime you enter `zoom` at the command-line
or access the shortcut from ULauncher.

## Install M$ fonts
* `sudo apt install -y ttf-mscorefonts-installer`

## Setup logiops for Logitech devices

Configuration is located at `~/.logid.cfg` (included here). We're using a
[forked version](https://github.com/abraha2d/logiops) of
[the original](https://github.com/PixlOne/logiops) until
[this PR](https://github.com/PixlOne/logiops/pull/161) is committed.

* `sudo apt install cmake libevdev-dev libudev-dev libconfig++-dev build-essential`
* `git clone https://github.com/abraha2d/logiops.git`
* `cd logiops && mkdir build && cd build && cmake .. && make`
* `sudo make install`
* `sudo rm -rf /etc/logid.cfg && sudo ln -s /home/ivan/.logid.cfg /etc/logid.cfg`
* `sudo systemctl enable --now logid`
* While the final command _should_ start logid at boot, if it isn't working add
launch "Startup Applications" and add
`sudo systemctl start logid && sudo systemctl restart logid` (yes, start and
then restart) as a custom command.

## Add some Nemo actions

Follow the instructions at
[nemo_actions_and_cinnamon_scripts](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts).
Currently the following are installed:

* [Close windows](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#close-windows-actions)
* [Disk usage](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#disk-usage-action)
* [File metadata](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#file-metadata-action)
* [Apply custom emblems](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#apply-custom-emblems)
* [Apply custom icon](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#apply-custom-icon)
* [Media info](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#media-info)

## Extras
* [Install Anbox for running Android apps](https://www.how2shout.com/linux/how-to-install-anbox-on-ubuntu-20-04-lts-focal-fossa/)
* [Install Signal without a smartphone (or Android emulator)](https://ctrl.alt.coop/en/post/signal-without-a-smartphone/)

# Startup applications

* Confirm the following are listed: Guake, Ulauncher, Autokey, Rambox, Mullvad (if used)
* Log out, then log back in

# Backup!

* Timeshift > Create
