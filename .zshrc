ZSH=$HOME/.config/zsh/oh-my-zsh
ZSH_CUSTOM=$HOME/.config/zsh/custom

source $ZDOTDIR/zshrc/functions.sh

# If outside a tty
if [[ $(tty) != *tty* ]]; then
	export TERM="screen-256color"
	source $ZDOTDIR/zshrc/tmux.sh
	source $ZDOTDIR/zshrc/theme.sh
	source $ZDOTDIR/zshrc/plugins.sh
fi

source $ZDOTDIR/zshrc/env.sh
source $ZDOTDIR/zshrc/settings.sh

source $ZSH/oh-my-zsh.sh
source $ZDOTDIR/zshrc/aliases.sh
