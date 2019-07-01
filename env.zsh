# default editor used by things like a git commit
export EDITOR="nvim"

# used by certain java applications
# export JAVA_HOME="/usr/lib/jvm/java-8-jdk"

# cdpath modifications
# basically $PATH for cd
# more info on http://zsh.sourceforge.net/Doc/Release/Parameters.html
export CDPATH="$HOME/Workspace:$CDPATH"
export CDPATH="$HOME/Workspace/Ecostage:$CDPATH"
export CDPATH="$HOME/Workspace/Thémata:$CDPATH"
export CDPATH="$HOME/Workspace/Personal:$CDPATH"
export CDPATH="$HOME/Workspace/rust:$CDPATH"
export CDPATH=".:$CDPATH" # This must always be the last one

# gradle
# export PATH="$HOME/gradle-2.5/bin:$PATH"

# heroku
# export PATH="/usr/local/heroku/bin:$PATH"

# perl
# export PATH="/usr/bin/core_perl:$PATH"

# composer
# export PATH="$HOME/.composer/vendor/bin:$PATH"

export PATH="/opt/local/sbin:$PATH"
export PATH="/opt/local/bin:$PATH"
export PATH="/opt/brew/bin:$PATH"
export PATH="/usr/local/git/bin:$PATH"

# asdf
# TODO
# source ${XDG_CONFIG_HOME:-$HOME/.config}/asdf/asdf.sh

# rustup
if [[ -f $HOME/.cargo/env ]]; then
  source $HOME/.cargo/env
fi

# locales
export LANG=pt_BR.UTF-8
export LC_ALL=pt_BR.UTF-8

# https://github.com/robbyrussell/oh-my-zsh/issues/5874
export ZSH_CACHE_DIR=$ZDOTDIR/.cache

# Android development
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/tools/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

# todo.txt config file on XDG_CONFIG_HOME
export TODOTXT_CFG_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/todo/config"

# The standard dictates that the default should be this if this variable is not
# set but not everything plays nice with that
export XDG_CONFIG_HOME="$HOME/.config"

export KUBECONFIG=${XDG_CONFIG_HOME:-$HOME/.config}/kube/config
