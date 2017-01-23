# Enables Antigen caching
_ANTIGEN_CACHE_ENABLED="true"

# Display red dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files under VCS as dirty
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Number of maximum lines your histfile when session begins
HISTSIZE=10000

# Number of lines appended on histfile at the end of session
SAVEHIST=9000

# Histfile path
HISTFILE=$ZDOTDIR/.zsh_history 

# Time to wait before interpreting an ESC escape code as an ESC (in 10ms steps)
KEYTIMEOUT=1

# Skip a line when navigating history if that line was shown before 
setopt HIST_FIND_NO_DUPS

# Don't save consecutive duplicates on the history
setopt HIST_IGNORE_DUPS 

# Don't keep history on memory, always access the files directly, on writing and reading
setopt inc_append_history
setopt share_history

# Turn off automatically pushing the last directory to the directory stack
unsetopt AUTOPUSHD

# Turn on bash completion compatibility mode
autoload bashcompinit
bashcompinit

# Emacs style bindings
bindkey -e
