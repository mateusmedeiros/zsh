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

# Other local scripts
source $ZDOTDIR/zshrc/aliases.zsh
source $ZDOTDIR/zshrc/env.zsh
source $ZDOTDIR/zshrc/thefuck.zsh
source $ZDOTDIR/zshrc/tmux.zsh
