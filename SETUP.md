<!-- The following section, from "ts" to "te", is an automatically-generated
  table of contents, updated whenever this file changes. Do not edit within
  this section. -->

<!--ts-->
* [First-run OS and computer setup](#first-run-os-and-computer-setup)
* [Program setup](#program-setup)
* [CLI fun](#cli-fun)
   * [General installations](#general-installations)
   * [Setup Zsh/Oh My Zsh/Powerline](#setup-zshoh-my-zshpowerline)
   * [Create SSH keys](#create-ssh-keys)
* [Online setup](#online-setup)
   * [GitHub: Add SSH key](#github-add-ssh-key)
* [Dotfile time](#dotfile-time)
   * [Checkout and clone](#checkout-and-clone)
   * [Move scripts](#move-scripts)
   * [Grab private config settings and load them](#grab-private-config-settings-and-load-them)
   * [Now finish setting up](#now-finish-setting-up)
* [Manual downloads](#manual-downloads)
   * [Applets](#applets)
   * [Firefox](#firefox)
   * [Thunderbird](#thunderbird)
      * [Installing v91+](#installing-v91)
      * [Pointing to an existing Thunderbird preferences and profile directory](#pointing-to-an-existing-thunderbird-preferences-and-profile-directory)
      * [Restoring a locally-stored profile](#restoring-a-locally-stored-profile)
   * [Other manual installs](#other-manual-installs)
* [Bluetooth setup](#bluetooth-setup)
   * [Autoconnect trusted Bluetooth devices](#autoconnect-trusted-bluetooth-devices)
   * [Connect phone-Linux-headset via Bluetooth](#connect-phone-linux-headset-via-bluetooth)
* [Setup Node and packages](#setup-node-and-packages)
* [Setup <a href="https://techviewleo.com/how-to-install-and-use-docker-in-linux-mint/" rel="nofollow">Docker</a> and <a href="https://docs.lando.dev/basics/installation.html#linux" rel="nofollow">Lando</a>](#setup-docker-and-lando)
* [Other bits and bobs](#other-bits-and-bobs)
   * [Set Sublime Text as editor for sudo commands](#set-sublime-text-as-editor-for-sudo-commands)
   * [Fix xdg-open error messages from Nemo](#fix-xdg-open-error-messages-from-nemo)
   * [Set up Zoom with Firejail](#set-up-zoom-with-firejail)
   * [Font management](#font-management)
   * [Replace bundled ImageMagick with a newer version, webp and HEIC support](#replace-bundled-imagemagick-with-a-newer-version-webp-and-heic-support)
   * [Setup logiops for Logitech devices](#setup-logiops-for-logitech-devices)
   * [Mint theme updates](#mint-theme-updates)
   * [Add some Nemo actions](#add-some-nemo-actions)
   * [Extras](#extras)
* [Startup applications](#startup-applications)
* [Backup!](#backup)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: runner, at: Sat Apr 23 00:31:44 UTC 2022 -->

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
* `sudo apt install -y git flatpak diff-so-fancy xclip zsh python python3-pip rar guake ulauncher autokey-gtk whois dconf-editor arc-theme apache2 mysql-server php libapache2-mod-php php-mysql php7.4-xml libpam-yubico yubikey-manager sublime-text font-manager nemo-font-manager imagemagick webp jpegoptim optipng nemo-image-converter strawberry chromium filezilla skypeforlinux vlc libncurses5-dev poppler-utils trimage dos2unix sublime-merge cockpit xclip xsel nemo-emblems folder-color-nemo nemo-image-converter peek pavucontrol`
* `flatpak install -y flathub org.glimpse_editor.Glimpse`
* `flatpak install -y flathub com.getferdi.Ferdi`
* `pip3 install pygithub linkchecker`
* `sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y`
* Right-click the big "A" autokey icon in the system tray and quit.
* If it exists, right-click the big "U" Ulauncher icon in the system tray and exit.

## Setup Zsh/Oh My Zsh/Powerline

* `sudo usermod -s $(which zsh) ivan`
* Log out, then log back in
* open Terminal and choose option 2
* `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
* `cd $HOME/Downloads`
* `wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf`
* `wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf`
* `wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf`
* `wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf`
* Navigate to `Downloads` and double-click on each font to install it
* Open Terminal (not Guake), right-click on the window and choose Preferences
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

## Checkout and clone

* `cd ~`
* `git clone git@github.com:rootwork/dotfiles.git`
* `cd dotfiles`
* `git checkout local-nix`
* `git submodule update --init --recursive` (to update the submodule if this is an existing clone, run `git submodule foreach --recursive git pull && git add . && git commit --signoff --message="Updating scripts submodule"`)
* `cp -r .* ~/`

## Move scripts

* `mkdir -p ~/bin`
* `cp ./scripts/**/*.sh ~/bin` (zsh-only; bash option [here](https://stackoverflow.com/questions/15617016/copy-all-files-with-a-certain-extension-from-all-subdirectories#comment22152382_15617049))
* `rm ~/bin/pre-commit.sh`
* `chmod +x ~/bin/*`

## Grab private config settings and load them

* `cd ~`
* `git clone git@github.com:rootwork/config-repo.git repos/config-repo`
* `cp -rf repos/config-repo/* ~/.config`
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
* `sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y`
* Log out and log back in

# Manual downloads

## Applets

* Weather [weather-mockturtl]
* Color Picker [icarter09]
* Timer with notifications [jake1164]

## Firefox

* Log in to Firefox Sync
* Boom! (OK, you'll have to enter the long password manually, but only once. ...And, then, you'll have to customize the toolbar to hide a bunch of extensions. But then! Boom!)
* You'll probably want to log in to Bitwarden. Then set its preferences to log out (not just lock) on exit.

## Thunderbird

### Installing v91+

Until 91+ is backported to Debian/Ubuntu, we have to remove the bundled version of Thunderbird and add the one from the Mozilla ESR PPA manually. I attempted doing this with Flatpak but had a persistant bug that refused to load Thunderbird's GUI except in safe mode (uninstalling all extensions and themes didn't help). Since the only other options were using Snap or building from source, I chose adding a new PPA as the least-bad option.

```
sudo apt remove thunderbird
sudo add-apt-repository ppa:mozillateam/ppa
sudo apt update
sudo apt install thunderbird
sudo apt upgrade -y
```

The Run **System Reports**, because you may need to install a language pack.

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

## Other manual installs

* QEMU (`sudo apt install -y qemu qemu-system-x86`) plus [QuickEmu](https://github.com/wmutschl/quickemu), in lieu of VirtualBox, if needed

# Bluetooth setup

## Autoconnect trusted Bluetooth devices

* Pair all devices using Bluetooth GUI
* `sudo bluetoothctl devices`
* By default paired devices will be trusted
* `sudo bluetoothctl untrust [device_id]` for each device you do NOT want to autoconnect
* `git clone https://github.com/jrouleau/bluetooth-autoconnect.git repos/bluetooth-autoconnect`
* `sudo cp repos/bluetooth-autoconnect/bluetooth-autoconnect.service /etc/systemd/system/`
* `sudo cp '/home/ivan/repos/bluetooth-autoconnect/bluetooth-autoconnect' /usr/bin/`
* `sudo systemctl enable bluetooth-autoconnect.service`
* `sudo systemctl start bluetooth-autoconnect.service`
* Reboot, making sure any wired mice are not connected (they'll prevent Bluetooth mice from registering clicks)
* Note you'll get a warning about no keyboard on startup if you use a Bluetooth keyboard; no worries, it'll kick in on the login screen

## Connect phone-Linux-headset via Bluetooth

Follow [this guide](https://ostechnix.com/turn-your-linux-pc-into-bluetooth-speakers-for-your-phone/):

* Start with "Pair the Linux PC with your Mobile Phone" as requirements are included with Linux Mint or installed above.
* If the computer has a standard high-def audio Intel sound card, follow additional solution 1.
* Regardless of the sound card, follow additional solution 2.
* Fully restart the system.
* Attempt to connect the phone to Linux and the headset to Linux, then test playing media from the phone over the headset.

# Setup Node and packages

[Install n and Node in one go](https://github.com/tj/n#third-party-installers):

`curl -L https://git.io/n-install | bash`

Install Node versions as necessary, e.g.

* `n install lts` (included by default in the previous command)
* `n install latest`
* `n install 14`

Install packages:

* `npm i -g alex carbon-now-cli gulp-cli np yarn`

# Setup [Docker](https://techviewleo.com/how-to-install-and-use-docker-in-linux-mint/) and [Lando](https://docs.lando.dev/basics/installation.html#linux)

* Turn off VPNs! Installation may fail with them on, sadly.
* `sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common`
* `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
* `sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable"`
* `sudo apt-get update`
* `sudo apt-get -y install docker-ce`
* `sudo usermod -aG docker $USER`
* `wget https://files.devwithlando.io/lando-stable.deb`
* `sudo dpkg -i lando-stable.deb`

# Other bits and bobs

## Set Sublime Text as editor for `sudo` commands

`sudo`-edit `/etc/environment` and add the following:

```
# Use Sublime for editing even within sudo
export EDITOR='/usr/bin/subl -w'
export VISUAL='/usr/bin/subl -w'
```

## Fix xdg-open error messages from Nemo

* `sudo mkdir -p /var/lib/samba/usershares/`
* `sudo chmod go+rwx /var/lib/samba/usershares/`

## Set up Zoom with Firejail

Sourced from [Aral Balkan](https://ar.al/2020/06/25/how-to-use-the-zoom-malware-safely-on-linux-if-you-absolutely-have-to/):

1. `sudo apt install -y firejail firejail-profiles`
2. `sudo apt install -y apparmor-utils`
3. `sudo aa-enforce firejail-default`
4. `mkdir -p ~/.config/firejail`
5. `echo "protocol unix,inet,inet6,netlink\nignore seccomp\nseccomp \x21chroot" > ~/.config/firejail/zoom.local`
6. [Download Zoom](https://zoom.us/download#client_4meeting) and install the package.
7. `mkdir -p ~/.zoom`
8. `firejail --apparmor --private=$HOME/.zoom zoom`
9. If this works, exit zoom from the menubar icon and proceed.
10. `sudo rm /usr/bin/zoom`
11. `sudo me=$HOME bash -c 'echo -e "#!/bin/bash\nfirejail --apparmor --profile=/etc/firejail/zoom.profile --private=$me/.zoom /opt/zoom/ZoomLauncher" > /usr/bin/zoom'`
12. `sudo chmod a+x /usr/bin/zoom`

This will run Zoom within Firejail anytime you enter `zoom` at the command-line
or access the shortcut from ULauncher.

To upgrade Zoom, download and install the upgrade, then run the last three steps again.

To verify that Zoom is running inside Firejail, a quick method is to log in to Zoom, click your profile icon, and click "My Profile" in the list. A jailed Zoom will show an error that Firefox is unavailable.

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

If `identify --version` at the end of the instructions still returns an old version, try running `magick --version`. If you get the updated version for the latter, then older commands in `/usr/bin` are probably overriding the newer ones in `/usr/bin/local`. Check the order of your `$PATH`, and/or `sudo rm` the versions in `/usr/bin`.

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

## Mint theme updates

For some reason not all theme settings are exported to config items.

* Run **Themes**, go to the "Settings" tab, under "Scrollbar behavior" uncheck the first item, check the next two, and set scrollbar width to 12px.
* Run and add programs to the quick launch bar, such as Nemo, Sublime Text, Firefox, Thunderbird, Ferdi.

## Add some Nemo actions

Follow the instructions at
[nemo_actions_and_cinnamon_scripts](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts).

Go to Nemo (Files) > Edit > Preferences > Plugins. It's usually easier to just disable all of the actions and then enable the ones you want selectively. Currently the following are enabled:

* Format
* Make bootable USB stick
* Set as Wallpaper...
* Change Desktop Background
* Mount archive
* Lock session now
* Bulk Rename
* [Disk Usage](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#disk-usage-action)
* [Apply Custom Emblem](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#apply-custom-emblems)
* Logout Now
* [Media Properties](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#media-info)
* [Close All Windows](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#close-windows-actions)
* [Show Metadata](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#file-metadata-action)
* [Apply Custom Icon](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#apply-custom-icon)

## Extras

* [Install Anbox for running Android apps](https://www.how2shout.com/linux/how-to-install-anbox-on-ubuntu-20-04-lts-focal-fossa/)
* [Install Signal without a smartphone (or Android emulator)](https://ctrl.alt.coop/en/post/signal-without-a-smartphone/)

# Startup Applications

* In this screen, confirm the following are listed: Guake, Ulauncher, Autokey, Ferdi, Mullvad (if used)
* Log out, then log back in

# Backup!

* Timeshift > Create
