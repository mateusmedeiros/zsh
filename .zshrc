# Downloads antigen if not present on ZDOTDIR
if [[ ! -f $ZDOTDIR/antigen.zsh ]]; then
  curl https://cdn.rawgit.com/zsh-users/antigen/master/bin/antigen.zsh -o $ZDOTDIR/antigen.zsh
fi

# Load antigen
source $ZDOTDIR/antigen.zsh

# Main settings
source $ZDOTDIR/zshrc/settings.zsh

# WSL specific settings
grep -q 'Microsoft' /proc/sys/kernel/osrelease && source $ZDOTDIR/zshrc/windows.zsh

# Antigen commands
antigen init $ZDOTDIR/zshrc/antigenrc.zsh

# Completions
. ${XDG_CONFIG_HOME:-$HOME/.config}/asdf/completions/asdf.bash

# Temporary hack
# Antigen does something on apply (probably related to prezto)
# that messes the ZDOTDIR variable for some reason.
#
# Note to self: debug it and try to submit a PR on antigen later
# possibly related commit: https://github.com/zsh-users/antigen/commit/da467c689d05b47af9bee7eeb330d252a07cc14a
ZDOTDIR=$HOME/.config/zsh

# Other local scripts
source $ZDOTDIR/zshrc/aliases.zsh
source $ZDOTDIR/zshrc/thefuck.zsh
source $ZDOTDIR/env.zsh
