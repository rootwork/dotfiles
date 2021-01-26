Test.

<!--ts-->
<!--te-->

# Hosted setup

## Initial configuration

* Droplet with Ubuntu 20.04
* Log in via SSH key or web console
* Initial server setup: https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04

## Web hosting configuration

### Web setup

* Apache Web Server: https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-20-04
  * Set docroot as `/home/ivan/[domain]/public`
* Install LetsEncrypt? (should be automatic with DigitalOcean DNS hosting, but...): https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu-20-04

### Check web access

* Grab the web address from the console: `hostname -I`
* Paste in browser

### Finish web setup

* `mkdir public`
* `sudo nano /etc/apache2/apache2.conf` and find `<Directory /var/www/>`. Change that line to `<Directory /home/[domain]/ivan/public>`
* `sudo systemctl restart apache2`
* Complete with Apache tutorial above, remembering docroot is `/home/ivan/[domain]/public`.

### Optional: Add full LAMP stack
https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-20-04

## Server add-ons

* Copy over dotfiles: https://github.com/rootwork/dotfiles/tree/hosted
* (Next three steps contingent on [this release](https://github.com/so-fancy/diff-so-fancy/issues/383); if not possible then modify dotfiles.)
* `sudo add-apt-repository ppa:aos1/diff-so-fancy`
* `sudo apt update`
* `sudo apt install diff-so-fancy`
* oh-my-zsh (skip Powerline font installation): https://kifarunix.com/install-and-setup-zsh-and-oh-my-zsh-on-ubuntu-20-04/
* `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
* `git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions`
* `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
* `git clone https://github.com/bobthecow/git-flow-completion ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-flow-completion`
* `git clone https://gist.github.com/475ee7768efc03727f21.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-auto-status`
* `git clone https://github.com/supercrabtree/k ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/k`
* `source .zshrc`

## Hugo

Two options:

* On servers (e.g. Ubuntu) with Snap already installed, run `snap install hugo --channel=extended`
* Otherwise, get the `hugo_extended_VERSION_Linux-64bit.deb` [package from GitHub releases](https://github.com/gohugoio/hugo/releases).
