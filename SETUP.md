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

* `sudo apt-get install xclip`

## Create SSH keys

* `ssh-keygen -t rsa -b 4096 -C "ivan@rootwork.org"`
* `eval "$(ssh-agent -s)"`
* `ssh-add ~/.ssh/id_rsa`

# Online setup

## GitHub: Add SSH key

* `xclip -sel clip < ~/.ssh/id_rsa.pub`
* https://github.com/settings/ssh/new

# Backup!

* Timeshift > Create