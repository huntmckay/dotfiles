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
alias vim='nvim'
alias e='nvim'
#alias ve='source .env/bin/activate'
alias s='ls -CF'
alias a='ls -lA'
alias f='fg'
alias g='git'
alias gc='git -C'
alias h='man'
alias i='invoke'
# alias functions
alias m='make'
alias p='python3'
alias t='tree'
alias r='rm'
alias rf='rm -rf'
alias rd='rmdir'
alias rkde='kquitapp5 plasmashell && kstart5 plasmashell'
alias dot='e ~/dotfiles/.bashrc'
