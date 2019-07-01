export HOMEBREW_NO_AUTO_UPDATE=1

# macOS has a utility called path_helper and it is called by the default in the
# /etc/zprofile provided by the OS.
# 
# The problem is that it prepends the generated PATH into the current PATH and
# we need it to be appended. zprofile is also run after zshenv, so we can't
# change the PATH after it is run from zshenv.
#
# As a workaround, we once again source the env.zsh file but from the zshrc and
# only on macOS.
if [[ -d /Library ]]; then
  source $ZDOTDIR/env.zsh
fi
