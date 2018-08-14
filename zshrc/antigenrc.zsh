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

# fish-like autosuggestion
# See https://github.com/zsh-users/zsh-autosuggestions for configuration
antigen bundle zsh-users/zsh-autosuggestions

# fzf (only if installed)
if ( hash fzf 1>/dev/null 2>&1 ); then
  # antigen bundle junegunn/fzf
  antigen bundle ytet5uy4/fzf-widgets
fi

# spaceship theme
antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship

antigen apply
