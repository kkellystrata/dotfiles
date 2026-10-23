# Shared aliases for WSL host and every Dev Container.
alias ll='ls -alFh --group-directories-first'
alias ..='cd ..'
alias g='git'
alias gs='git status -sb'
alias gl='git log --oneline --graph --decorate -20'
alias gd='git diff'
alias gco='git switch'
alias gcb='git switch -c'
alias dc='docker compose'
alias k='kubectl'
command -v batcat >/dev/null && alias bat='batcat'
command -v fdfind >/dev/null && alias fd='fdfind'

export HISTSIZE=50000
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
