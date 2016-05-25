# Run tmux if outside NEOVIM(set manually on init.vim) and not root
# This will also make sure the first session is called hobby
# and the second session is called work. After that, the sessions
# will be named just by its count
if [[ $USER != root && $+NEOVIM != 1 ]]; then
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
fi
