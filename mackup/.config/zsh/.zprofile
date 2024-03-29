# .zprofile -*- mode: sh -*-

# Place for hosting Git repos
export GIT_HOSTING='git@github.com:DivitMittal'

# Don't check mail when opening terminal.
unset MAILCHECK

# Set Xterm/screen/Tmux title with only a short hostname.
export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
export SHORT_TERM_LINE=true

