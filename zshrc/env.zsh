# default editor used by things like a git commit
export EDITOR="nvim"

# used by certain java applications
export JAVA_HOME="/usr/lib/jvm/java-8-jdk"

# path modifications
export PATH="$HOME/.rvm/bin:$PATH"
export PATH="$HOME/gradle-2.5/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/bin/core_perl:$PATH"
export PATH="${HOME}/.cargo/bin:$PATH"

# cdpath modifications
# basically PATH for cd
# more info on http://zsh.sourceforge.net/Doc/Release/Parameters.html
export CDPATH="$HOME/workspace"
export CDPATH="$HOME/workspace/saites:$CDPATH"
export CDPATH="$HOME/workspace/eclipse:$CDPATH"
export CDPATH="$HOME/workspace/ecostage:$CDPATH"
export CDPATH="$HOME/workspace/rust:$CDPATH"
export CDPATH="$HOME/.config:$CDPATH"

# asdf (Elixir and Erlang version manager)
. ${XDG_CONFIG_HOME:-$HOME/.config}/asdf/asdf.sh
. ${XDG_CONFIG_HOME:-$HOME/.config}/asdf/completions/asdf.bash

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
