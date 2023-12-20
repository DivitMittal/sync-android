#!/usr/bin/env zsh
################################################################################################################################################
# Variables & Environment variables (variables exported to child processes)
################################################################################################################################################
## Environment variables
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export TERM="xterm-256color"
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

alias apt-ultimate='apt update; apt upgrade; apt autoremove; apt autoclean'

