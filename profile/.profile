# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# for caps lock
setxkbmap -option caps:backspace
setxkbmap -option shift:both_capslock
xmodmap -e "clear Lock"

# M2_home and path
M2_HOME='/opt/apache-maven-3.6.3'
PATH="$M2_HOME/bin:$PATH"
export PATH

export EDITOR=/snap/bin/nvim

# xrandr
#~/.screenlayout/layout.sh

# Added by Toolbox App
export PATH="$PATH:~/.local/share/JetBrains/Toolbox/scripts"
export PATH="$PATH:~/.local/share/JetBrains/Toolbox/scripts"
export TERM="alacritty"
# export TERM="/usr/bin/fish"

alias vi="nvim":
alias f="fzf"

if [ -e /home/morgan/.nix-profile/etc/profile.d/nix.sh ]; then . /home/morgan/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
