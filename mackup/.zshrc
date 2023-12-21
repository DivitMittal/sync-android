#!/usr/bin/env zsh
################################################################################################################################################
# Variables & Environment variables (variables exported to child processes)
################################################################################################################################################
## Environment variables
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export TERM="xterm-256color"
        
PROMPT="%~ %# "

# Preferred editor for remote and local sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi
export VISUAL='vim'

## PATH environment variable
################################################################################################################################################
# Antidote - zsh plugin manager
################################################################################################################################################
source $HOME/.antidote/antidote.zsh
antidote load

################################################################################################################################################
# Oh-my-zsh - zsh framework & plugin manager, also a dependency for many of the plugins instlled via Antidote
################################################################################################################################################
export ZSH="$HOME/.cache/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh"
plugins=()

################################################################################################################################################
# Aliases
################################################################################################################################################
alias v='vim'
# eza command-line utility (gnu-ls alternative)
eza_params=('--all' '--icons=always' '--classify' '--group-directories-first' '--time-style=long-iso' '--group' '--color-scale' '--hyperlink')
alias ls="eza $eza_params"
alias ll="eza -lbhHigUmuSa@ $eza_params"
alias lt="eza --tree --level=2 $eza_params"

# Navigation aliases
alias dl="cd $HOME/storage/downloads"

# Other aliases
alias magisk-backup="sudo env ls -D /data/adb/modules/ 1> $HOME/sync-android/misc/root/magisk_modules.txt"
alias apt-backup="apt-mark showmanual 1> $HOME/sync-android/misc/apt_bundle.txt"
alias apps-backup="sudo pm list packages -3 | sed 's/package://' 1> $HOME/sync-android/misc/apps_list.txt"
alias apt-ultimate='apt update; apt upgrade; apt autoremove; apt autoclean; apt-backup'
alias android-ultimate='apt-ultimate; apps-backup; magisk-backup'

################################################################################################################################################
# Initializations
################################################################################################################################################
if [[ -o interactive ]]; then
	# secure shell daemon
	sshd -p 2222
fi

