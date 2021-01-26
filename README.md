<!-- The following section, from "ts" to "te", is an automatically-generated
  table of contents, updated whenever this file changes. Do not edit within
  this section. -->

<!--ts-->
<!--te-->

Various dotfiles created/customized by Ivan Boothe. One branch for local
terminal, one branch for hosted terminal (e.g. DigitalOcean console), each with
setup instructions.

No guarantees to anyone that these work, are safe, will be maintained, etc.

See [the setup file](SETUP.md) for the good stuff.

# Troubleshooting failing installations

By far the most common issue is an installation failing because of a VPN, for instance with Docker and Lando. Annoying, but turn off the VPN for the first install and then proceed.

# Keymapping (keybinding, keyboard shortcuts, etc.)

Because this comes up a lot, some useful resources:

* "Keyboard" settings, "Shortcuts" tab. See especially "Custom Shortcuts" at the bottom.
* "Keyboard" settings, "Layouts" tab, "Options...": control common keymapping/key swaps.
* `sudo showkey` will give you the code for any key on your keyboard. [xev](https://askubuntu.com/questions/466646/how-to-get-the-name-of-the-key-combination-keybind-key-for-the-openbox-confi/466660#466660) is another option.
* <kbd>fn</kbd> on keyboards usually modify what code is sent by another key (i.e. it's a dead key), so use `showkey` to see what the modified key is actually sending. For instance, <kbd>fn</kbd>+<kbd>backspace</kbd> often sends <kbd>delete</kbd>.
* [A guide to using xmodmap](https://blacketernal.wordpress.com/set-up-key-mappings-with-xmodmap/).
* [A guide to using dconf-editor](https://www.linux.org/threads/dconf-explained.11316/) (note dconf includes key:value pairs of all types, but including keyboard-key mappings).
* If you want to change keyboard shortcuts for Nemo (the default file manager in Linux Mint), [you have to turn the ability on first](https://wiki.archlinux.org/index.php/Nemo#Set_keyboard_shortcut_for_%22Open_in_terminal%22). Shortcuts are stored in either `~/.config/nemo/accels` or `~/.gnome2/accels/nemo`. [More information.](https://forums.linuxmint.com/viewtopic.php?p=1696073#p1696073)