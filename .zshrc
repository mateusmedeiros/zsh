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

# Loads some useful stuff from oh-my-zsh lib
antigen bundle robbyrussell/oh-my-zsh lib/completion.zsh
antigen bundle robbyrussell/oh-my-zsh lib/grep.zsh
antigen bundle robbyrussell/oh-my-zsh lib/key-bindings.zsh

# Also provide some aliases for bundler commands   
antigen bundle bundler

# Add color to manpages (you don't say?)
antigen bundle colored-man-pages

# Navigate through visited directories with alt+left and alt+right
antigen bundle dirhistory

# Add a lot of aliases and some useful functions for git   
antigen bundle git

# Autocomplete for heroku tools commands   
antigen bundle heroku

# Add leiningen completion
antigen bundle lein

# This one... uh... 
# just https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/lol/lol.plugin.zsh
antigen bundle lol

# Autocomplete for npm and some aliases   
antigen bundle npm

# Highlighting of commands as they are typed   
antigen bundle zsh-users/zsh-syntax-highlighting

# pure theme
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply

# Other local scripts
source $ZDOTDIR/zshrc/aliases.zsh
source $ZDOTDIR/zshrc/env.zsh
source $ZDOTDIR/zshrc/thefuck.zsh
source $ZDOTDIR/zshrc/tmux.zsh
