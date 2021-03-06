alias ç='~'
alias realias="source $ZDOTDIR/zshrc/aliases.zsh"
alias refun="source $ZDOTDIR/zshrc/functions.zsh"
# alias çs='ls -A --color=always'
# alias sl='ls -A --color=always'
# alias ls='ls -A --color=always'

alias i='yaourt -S'
alias ir='yaourt -R'

alias vimt='vim +NERDTreeTabsToggle'
alias nvimt='nvim +NERDTreeTabsToggle'

alias bi='brew install'
alias bci='brew cask install'
alias bs='brew search'

alias dc='docker-compose'
alias dcrun='docker-compose run --rm'

alias gcloudupdate='docker rmi google/cloud-sdk:alpine; docker pull google/cloud-sdk:alpine'

alias ls='ls -Ah'

alias mv='mv -i'

alias rcp='rsync -a --executability'

alias startinator='tmuxinator start local'
alias stopinator='tmuxinator stop local'

alias tmux="tmux -f ~/.config/tmux/tmux.conf"
alias tmuxnew="tmux new -A -s"

alias todo="todo.sh -c"
