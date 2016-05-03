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

alias ls="ls -G"
alias ll="ls -laF"
alias serve='python -m SimpleHTTPServer 8888'
alias grep="grep --color"
alias egrep="egrep --color"
# https://github.com/nvbn/thefuck
alias fuck='$(thefuck $(fc -ln -1))'
alias sing_sam="say -v Good 'Sam smells like poop'"
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
alias dna='ssh kdsilva@sampa-gw.cs.washington.edu'
alias roomba='ssh cse@roomba'
# Setting Default Editor
export EDITOR=/usr/local/bin/vim

# Adding in Android SDK
export ANDROID_SDK_ROOT="/usr/local/Cellar/android-sdk/23.0.2"
export ANDROID_HOME=/usr/local/opt/android-sdk

# Adding in Android NDK 
export ANDROID_NDK=/usr/local/Cellar/android-ndk/r10b
export NDK_ROOT=/user/local/Cellar/android-ndk/r10b
export PATH=$PATH:$NDK_ROOT

export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
export GOPATH=~/Dropbox/_winter_2016/DISTRIBUTED_SYSTEMS/labs/452-labs
