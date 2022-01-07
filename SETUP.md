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
      * [Installing v91+](#installing-v91)
      * [Pointing to an existing Thunderbird preferences and profile directory](#pointing-to-an-existing-thunderbird-preferences-and-profile-directory)
      * [Restoring a locally-stored profile](#restoring-a-locally-stored-profile)
* [CLI fun](#cli-fun)
   * [General installations](#general-installations)
   * [Setup Zsh/Oh My Zsh/Powerline](#setup-zshoh-my-zshpowerline)
   * [Create SSH keys](#create-ssh-keys)
   * [Connect phone-Linux-headset via Bluetooth](#connect-phone-linux-headset-via-bluetooth)
   * [Setup Node and packages](#setup-node-and-packages)
   * [Setup <a href="https://techviewleo.com/how-to-install-and-use-docker-in-linux-mint/" rel="nofollow">Docker</a> and <a href="https://docs.lando.dev/basics/installation.html#linux" rel="nofollow">Lando</a>](#setup-docker-and-lando)
* [Online setup](#online-setup)
   * [GitHub: Add SSH key](#github-add-ssh-key)
* [Dotfile time](#dotfile-time)
   * [Checkout and clone](#checkout-and-clone)
   * [Move scripts](#move-scripts)
   * [Grab private config settings and load them](#grab-private-config-settings-and-load-them)
   * [Now finish setting up](#now-finish-setting-up)
* [Bits and bobs](#bits-and-bobs)
   * [Autoconnect trusted Bluetooth devices](#autoconnect-trusted-bluetooth-devices)
   * [Set Sublime Text as editor for sudo commands](#set-sublime-text-as-editor-for-sudo-commands)
   * [Fix xdg-open error messages from Nemo](#fix-xdg-open-error-messages-from-nemo)
   * [Set up Zoom with Firejail](#set-up-zoom-with-firejail)
   * [Font management](#font-management)
   * [Setup logiops for Logitech devices](#setup-logiops-for-logitech-devices)
   * [Add some Nemo actions](#add-some-nemo-actions)
   * [Extras](#extras)
* [Startup applications](#startup-applications)
* [Backup!](#backup)

<!-- Added by: runner, at: Thu Dec 30 22:53:54 UTC 2021 -->

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
* Color Picker [icarter09]
* Timer with notifications [jake1164]

## Manual downloads

* [Autokey](https://github.com/autokey/autokey/wiki/Installing#debian-and-derivatives)
* QEMU (`sudo apt install -y qemu qemu-system-x86`) plus [QuickEmu](https://github.com/wmutschl/quickemu), in lieu of VirtualBox, if needed

## Firefox

* Log in to Firefox Sync
* Boom!

## Thunderbird

### Installing v91+

Until 91+ is backported to Debian/Ubuntu, we have to remove the bundled version of Thunderbird and add the one from the Mozilla ESR PPA manually. I attempted doing this with Flatpak but had a persistant bug that refused to load Thunderbird's GUI except in safe mode (uninstalling all extensions and themes didn't help). Since the only other options were using Snap or building from source, I chose adding a new PPA as the least-bad option.

```
sudo apt remove thunderbird
sudo add-apt-repository ppa:mozillateam/ppa
sudo apt update
sudo install thunderbird
```

### Pointing to an existing Thunderbird preferences and profile directory

1. Open your home directory.
2. Remove `.thunderbird`.
3. Create a symlink from `.thunderbird` to the location of this same folder stored on another device.
4. Open program again and make sure everything loads.

### Restoring a locally-stored profile

1. Open Thunderbird, exit wizard/setup tab, and quit. This will initialize a default profile.
2. Open your home directory, then open `.thunderbird`.
3. Copy the _contents_ of previous profile directory into the new `*.default[-release]` directory. Remove the previous profile directory if desired.
4. Open program again and make sure everything loads.

# CLI fun

## General installations

* `sudo add-apt-repository ppa:aos1/diff-so-fancy`
* `sudo add-apt-repository ppa:agornostal/ulauncher`
* `sudo add-apt-repository ppa:yubico/stable`
* `sudo add-apt-repository ppa:font-manager/staging`
* `sudo add-apt-repository ppa:jonaski/strawberry`
* `sudo add-apt-repository ppa:costales/folder-color`
* `sudo add-apt-repository ppa:peek-developers/stable`
* `wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -`
* `sudo apt install -y apt-transport-https`
* `echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list`
* `sudo apt update`
* `sudo apt install -y git flatpak diff-so-fancy xclip zsh python python3-pip rar guake ulauncher whois dconf-editor arc-theme apache2 mysql-server php libapache2-mod-php php-mysql php7.4-xml libpam-yubico yubikey-manager sublime-text font-manager nemo-font-manager imagemagick webp jpegoptim optipng nemo-image-converter strawberry chromium filezilla skypeforlinux vlc libncurses5-dev poppler-utils trimage dos2unix sublime-merge cockpit xclip xsel nemo-emblems folder-color-nemo nemo-image-converter ferdi peek pavucontrol`
* `flatpak install -y flathub org.glimpse_editor.Glimpse`
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

## Connect phone-Linux-headset via Bluetooth

Follow [this guide](https://ostechnix.com/turn-your-linux-pc-into-bluetooth-speakers-for-your-phone/):

* Start with "Pair the Linux PC with your Mobile Phone" as requirements are included with Linux Mint or installed above.
* If the computer has a standard high-def audio Intel sound card, follow additional solution 1.
* Regardless of the sound card, follow additional solution 2.
* Fully restart the system.
* Attempt to connect the phone to Linux and the headset to Linux, then test playing media from the phone over the headset.

## Setup Node and packages

* [Install necessary Node versions](https://github.com/nodesource/distributions/blob/master/README.md#installation-instructions)
* [Install nvm](https://github.com/nvm-sh/nvm#installing-and-updating)
* `npm i -g carbon-now-cli`

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

# Online setup

## GitHub: Add SSH key

* `xclip -sel clip < ~/.ssh/id_rsa.pub`
* https://github.com/settings/ssh/new

# Dotfile time

## Checkout and clone

* `cd ~`
* `git clone git@github.com:rootwork/dotfiles.git`
* `cd dotfiles`
* `git checkout local-nix`
* `git submodule update --init --recursive` (to update the submodule if this is an existing clone, run `git submodule foreach --recursive git pull && git add . && git commit --signoff --message="Updating scripts submodule"`)
* `cp .* ~/`

## Move scripts

* `mkdir -p ~/bin`
* `cp ./scripts/**/*.sh ~/bin` (zsh-only; bash option [here](https://stackoverflow.com/questions/15617016/copy-all-files-with-a-certain-extension-from-all-subdirectories#comment22152382_15617049))
* `rm ~/bin/pre-commit.sh`
* `chmod +x ~/bin/*`

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

## Font management

* Remove non-English fonts ([source](https://easylinuxtipsproject.blogspot.com/p/clean-mint.html#ID8)): ` sudo apt remove "fonts-kacst*" "fonts-khmeros*" fonts-lklug-sinhala fonts-guru-extra "fonts-nanum*" fonts-noto-cjk "fonts-takao*" fonts-tibetan-machine fonts-lao fonts-sil-padauk fonts-sil-abyssinica "fonts-tlwg-*" "fonts-lohit-*" fonts-beng-extra fonts-gargi fonts-gubbi fonts-gujr-extra fonts-kalapi "fonts-samyak*" fonts-navilu fonts-nakula fonts-orya-extra fonts-pagul fonts-sarai "fonts-telu*" "fonts-wqy*" "fonts-smc*" fonts-deva-extra fonts-sahadeva && sudo dpkg-reconfigure fontconfig && fc-cache`
* Add M$ fonts: `sudo apt install -y ttf-mscorefonts-installer`

Font Manager (installed in general installations above) allows for quick Google Fonts installation: Run Font Manager and then click the "G" icon in the top menubar to browse, use "Download Family" button to install.

Sources of open-source fonts:

* [League of Movable Type](https://www.theleagueofmoveabletype.com/) (Open Font License)
* [Open Foundry](https://open-foundry.com/fonts) (Open Font License)
* [Font Space, Open Source category](https://www.fontspace.com/category/Open-source) (F/LOSS)
* [Fontesk, OFL category](https://fontesk.com/license/ofl-gpl/) (Open Font License)
* [Font Library](https://fontlibrary.org/en/catalogue) (various F/LOSS licenses)
* [Velvetyne](https://www.velvetyne.fr/) (F/LOSS)
* [Use & Modify](https://usemodify.com/) (F/LOSS)
* [Font Squirrel](https://www.fontsquirrel.com/fonts/list/find_fonts) (various free and "free" licenses)
* [Ralph Levien](https://www.levien.com/type/myfonts/) (Open Font License)

Some programs may not update their font lists until a system restart.

## Replace bundled ImageMagick with a newer version, webp and HEIC support
Follow [this gist](https://gist.github.com/hurricup/e14ae5bc47705fca6b1680e7a1fb6580), replacing `--branch 7.1.0-14` with the latest release of [ImageMagick](https://github.com/ImageMagick/ImageMagick/releases).

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
