# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias s='ls -CF --color=auto'
  alias a='ls -lA --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# alias
alias vim='echo "Type e"'
alias e='nvim'
alias s='ls -CF'
alias l='ls -lA'
alias f='fg'
alias g='git'
alias ga='git add . && gc"'
alias h='history | fzf -e'
alias i='invoke'
alias m='make'
alias p='python3'
alias t='tree'
alias rf='rm -rf'
alias dot='e ~/dotfiles/bashrc'

alias xx='cp ~/dotfiles/bashrc ~/.bashrc; cp ~/dotfiles/bash_aliases ~/.bash_aliases'

alias ss='source ~/.bashrc'
# make a function here that cps bashrc and sources
