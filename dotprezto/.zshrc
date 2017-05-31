#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# alias google chrome
alias chrome='open -a "Google Chrome"' 

# alias quickframe
alias ssh-qf='ssh ec2-user@52.5.75.219'

# android_home
export ANDROID_HOME=/Users/Young/Library/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
