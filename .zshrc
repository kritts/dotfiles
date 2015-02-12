#
## Executes commands at the start of an interactive session.
##
## Authors:
##   Sorin Ionescu <sorin.ionescu@gmail.com>
##
#
## Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
#
#  # Customize to your needs...


alias ls="ls -G"
alias ll="ls -laF"

alias grep="grep --color"
alias egrep="egrep --color"

alias attu="ssh kdsilva@attu.cs.washington.edu"
alias forkbomb="ssh kdsilva@forkbomb.cs.washington.edu"
alias wget="curl -O"
alias ..='cd ..'
alias c='clear'
alias mkdir='mkdir -pv'
alias path='echo -e ${PATH//:/\\n}'
alias vi=vim
alias ping='ping -c 5'
alias browser=chrome
 