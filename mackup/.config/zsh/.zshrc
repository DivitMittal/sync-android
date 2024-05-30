#!/usr/bin/env zsh
################################################################################################################################################
# Variables & Environment variables (variables exported to child processes)
################################################################################################################################################
# Options
setopt re_match_pcre

## Environment variables
export LANG=en_US.UTF-8
export TERM="xterm-256color"

PROMPT="%F{cyan}%~%f %# "

# Preferred editor for remote and local sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi
export VISUAL='nvim'

## PATH environment variable
export PATH="$PATH:/data/data/com.termux/files/home/.local/bin"

###################################################################################
# Antidote - zsh plugin manager
###################################################################################
source $HOME/.antidote/antidote.zsh
antidote load

####################################################################################
# Oh-my-zsh - zsh framework & plugin manager (managed by Antidote)
#####################################################################################
export ZSH="$HOME/.cache/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh"
plugins=()

#####################################################################################
# Aliases
#####################################################################################
# Utilitiy aliases
alias v='vim'
alias nv='nvim'
alias ff='fastfetch --logo android-small --logo-separate false \
					--title-color-user magenta --title-color-at blue --title-color-host red \
					--structure Title:OS:Kernel:Uptime:Display:Terminal:CPU:CPUUsage:GPU:Memory:Swap:LocalIP'

# eza command-line utility (gnu-ls alternative)
eza_params=('--all' '--icons=always' '--classify' '--group-directories-first' '--time-style=long-iso' '--group' '--color-scale' '--hyperlink')
alias ls="eza $eza_params"
alias ll="eza -lbhHigUmuSa@ $eza_params"
alias lt="eza --tree --level=2 $eza_params"

# Navigation aliases
alias dl="cd $HOME/storage/downloads"
alias doc="cd $HOME/storage/shared/Documents"

# Other aliases
# alias magisk-backup="sudo env ls -D /data/adb/modules/ 1> $HOME/sync-android/misc/root/magisk_modules.txt"
# alias apps-backup="sudo pm list packages -3 | sed 's/package://' 1> $HOME/sync-android/misc/apps_list.txt"

alias apt-backup="apt-mark showmanual 1> $HOME/sync-android/misc/apt_bundle.txt"
alias apt-ultimate='apt update; apt upgrade; apt autoremove; apt autoclean'
alias nala-ultimate='nala update; nala upgrade; nala autopurge; nala clean'
alias android-ultimate='nala-ultimate; apt-backup;'

# Root utilities
# alias magisk='su -c magisk'
# alias isodrive='su -c isodrive'
# alias strpmenu='su -c strpmenu'
# alias detach='su -c detach'

#################################################################################
# Additional Programs
#################################################################################
# Load bash completions
autoload -U bashcompinit
bashcompinit

#################################################################################
# Functions
#################################################################################
# Yazi - TUI file manager
function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

###################################################################################
# Initializations
###################################################################################
if [[ -o interactive ]]; then
	# secure shell daemon
	sshd -p 2222

	# Pipx completions
	eval "$(register-python-argcomplete pipx)"

	# zoxide
	eval "$(zoxide init --cmd cd zsh)"

	# starship prompt
	eval "$(starship init zsh)"

	# fetch
	ff

	# atuin shell history
	eval "$(atuin init zsh)"
fi

