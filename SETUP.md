# Hosted setup

## Initial configuration

* Droplet with Ubuntu 20.04
* Log in via SSH key or web console
* Initial server setup: https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04

## Web hosting configuration

### Web setup

* Apache Web Server: https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-20-04
* Install LetsEncrypt? (should be automatic with DigitalOcean DNS hosting, but...): https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu-20-04

### Check web access

* Grab the web address from the console: `hostname -I`
* Paste in browser

### Finish web setup

* `sudo mkdir /var/www/domain_name`
* Complete with Apache tutorial above.
* `nano ~/.aliases`

```bash
# Enable aliases to be sudo'd
alias sudo='sudo '
# Untar to current directory
alias untar='tar --strip-components=1 -zxvf'
# git aliases
alias pushit='git push -u origin $(git symbolic-ref --short -q HEAD)'
alias recent='git branch --sort=-committerdate'
```

### Optional: Add full LAMP stack
https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-20-04

## Server add-ons

* oh-my-zsh (skip Powerline font installation): https://kifarunix.com/install-and-setup-zsh-and-oh-my-zsh-on-ubuntu-20-04/
* `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
* `git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions`
* `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
* `git clone https://github.com/bobthecow/git-flow-completion ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-flow-completion`
* `git clone https://gist.github.com/475ee7768efc03727f21.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-auto-status`
* `git clone https://github.com/supercrabtree/k ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/k`
* `source .zshrc`

## Hugo

* Install hugo snap package (extended) -- ? or grab `*64.deb` extended from GitHub: https://gohugo.io/getting-started/installing#snap-package
