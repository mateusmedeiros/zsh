# Downloads antigen if not present on ZDOTDIR
if [[ ! -f $ZDOTDIR/antigen.zsh ]]; then
  curl https://cdn.rawgit.com/zsh-users/antigen/master/bin/antigen.zsh -o $ZDOTDIR/antigen.zsh
fi

# Load antigen
source $ZDOTDIR/antigen.zsh

# Main settings
source $ZDOTDIR/zshrc/settings.zsh

# WSL specific settings
if [[ -d /proc/sys/kernel/osrelease ]]; then
  grep -q 'Microsoft' /proc/sys/kernel/osrelease && source $ZDOTDIR/zshrc/wsl.zsh
fi

# macOS specific settings
if [[ -d /Library ]]; then
  source $ZDOTDIR/zshrc/macos.zsh
fi

# Antigen commands
antigen init $ZDOTDIR/zshrc/antigenrc.zsh

# Load direnv
eval "$(direnv hook zsh)"

# Completions
. ${XDG_CONFIG_HOME:-$HOME/.config}/asdf/completions/asdf.bash

# Other local scripts
source $ZDOTDIR/zshrc/aliases.zsh
source $ZDOTDIR/zshrc/thefuck.zsh
source $ZDOTDIR/zshrc/functions.zsh

# fzf (only if installed)
if ( hash fzf 1>/dev/null 2>&1 ); then
  source $ZDOTDIR/zshrc/fzf-widgets.zsh
fi
