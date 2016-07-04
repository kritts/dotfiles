## Executes commands at the start of an interactive session.

## Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

PATH=${PATH}:/usr/local/texlive/2015/bin/x86_64-darwin

# Aliases
alias ls="ls -G"
alias ll="ls -laF"
alias serve='python -m SimpleHTTPServer 8888'
alias grep="grep --color"
alias egrep="egrep --color"
alias attu="ssh kdsilva@attu.cs.washington.edu"
alias ..='cd ..'
alias c='clear'
alias mkdir='mkdir -pv'
alias path='echo -e ${PATH//:/\\n}'
alias vi=vim
alias ping='ping -c 5'
alias browser=chrome
alias dna='ssh kdsilva@sampa-gw.cs.washington.edu'
alias roomba='ssh cse@roomba'

# Trying new aliases for tmux 
alias tl='tmux ls'
alias tn='tmux -2 new -s'
alias ta='tmux -2 attach -t'

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
