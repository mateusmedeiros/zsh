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
export CDPATH="$HOME/Workspace/rust:$CDPATH"

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
source ${XDG_CONFIG_HOME:-$HOME/.config}/asdf/asdf.sh
# asdf global erlang 20 > /dev/null 2>&1
# asdf global elixir 1.5.2 > /dev/null 2>&1
# asdf global nodejs 7.10.0 > /dev/null 2>&1
# asdf global ruby 2.4.1 > /dev/null 2>&1

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
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
