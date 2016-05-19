# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby archlinux bundler command-not-found copydir copyfile heroku jruby npm sublime vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# -------------------------------------------------------------------
# compressed file expander
# (from https://github.com/myfreeweb/zshuery/blob/master/zshuery.sh)
# -------------------------------------------------------------------
ex() {
	if [[ -f $1 ]]; then
		case $1 in
			*.tar.bz2) tar xvjf $1;;
			*.tar.gz) tar xvzf $1;;
			*.tar.xz) tar xvJf $1;;
			*.tar.lzma) tar --lzma xvf $1;;
			*.bz2) bunzip $1;;
			*.rar) unrar $1;;
			*.gz) gunzip $1;;
			*.tar) tar xvf $1;;
			*.tbz2) tar xvjf $1;;
			*.tgz) tar xvzf $1;;
			*.zip) unzip $1;;
			*.Z) uncompress $1;;
			*.7z) 7z x $1;;
			*.dmg) hdiutul mount $1;; # mount OS X disk images
		*) echo "'$1' cannot be extracted via >ex<";;
		esac
	else
		echo "'$1' is not a valid file"
	fi
} 

function detect_node_modules() {
	emulate -L zsh

	local current_dir="$(pwd)"
	local has_node_modules=false

	while [[ $current_dir != "/" ]]; do
		if [[ -d node_modules ]]; then
			has_node_modules=true
			break
		fi

		current_dir=$(dirname $current_dir)
	done

	if [[ $current_dir != "/" ]]; then
		if [[ ! -n $___OLD_PATH || $___OLD_PATH != $PATH ]]; then
			export ___OLD_PATH="$PATH"
		fi
		export PATH="$(pwd)/node_modules/.bin:$PATH"
	else
		if [[ -n $___OLD_PATH ]]; then
			export PATH="$___OLD_PATH"
		fi
	fi
}

#chpwd_functions=(${chpwd_functions[@]} "detect_node_modules")

HISTSIZE=10000
SAVEHIST=9000
HISTFILE=~/.zsh_history 

bindkey -e
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[3~' delete-char

# ALIASES

# alias sudo='sudo '
alias ç='~'
alias çs='ls'
alias i='yaourt -S'
alias ir='yaourt -R'
alias l='ls -ag'
alias vimt='vim +NERDTreeTabsToggle'

##

autoload -U colors && colors

export EDITOR="vim"
export JAVA_HOME="/usr/lib/jvm/java-8-jdk"
#export PROMPT="%{$fg[magenta]%}[%U%l%u - %*] %{$reset_color%}%{$fg[yellow]%}%n%{$reset_color%}%B@%b%{$fg[blue]%}%B%d > %b%{$reset_color%}" 

setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS                                                                                                                                                                                                            
setopt HIST_IGNORE_DUPS 

export rvm_ignore_gemrc_issues=1

#experimental 
#
#ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
#ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_CLEAN=""

#
#parse_git_branch() {
#	(command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
#}

#parse_git_dirty() {
#	if command git diff-index --quiet HEAD 2> /dev/null; then
#		echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
#	else
#		echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
#	fi
#}

#git_custom_status() {
#	local git_where="$(parse_git_branch)"
#	[ -n "$git_where" ] && echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX${git_where#(refs/heads/|tags/)}$ZSH_THEME_GIT_PROMPT_SUFFIX"
#}

#pyenv_version_status() {
#	local ver=$(pyenv version-name)
#	[ "$(pyenv global)" != "$ver" ] && echo "[$ver]"
#}

#if which pyenv &> /dev/null; then
#	RPS1='$(git_custom_status)%{$fg[red]%}$(pyenv_version_status)%{$reset_color%} $EPS1'
#else
#	RPS1='$(git_custom_status) $EPS1'
#fi

## experimental end ##

DEFAULT_USER="doodad"
KEYTIMEOUT=0

# change font for tty
if [[ $(tty) == *tty* ]]; then
	sh $HOME/solarized-console.sh
	setfont /usr/share/kbd/consolefonts/ter-powerline-v14n.psf.gz
else
	export TERM="screen-256color"
fi

### tmux ### { 
if [[ $USER != root ]]; then
	tmux_count=`tmux ls | wc -l`
	if [[ "$tmux_count" == "0" ]]; then
		tmux -2 new-session -s 'hobby'
	else
		if [[ -z "$TMUX" ]]; then
			if [[ "$tmux_count" == "1" ]]; then
				session_name='work'
			else
				session_name=`echo $tmux_count`
			fi

			tmux -2 new-session -d -s $session_name
			tmux -2 attach-session -t $session_name
		fi
	fi
else
fi
unsetopt autopushd

source ~/.profile
source ~/.path

# final

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
