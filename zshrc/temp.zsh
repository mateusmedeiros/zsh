# TODO MOVE FROM HERE
SPACESHIP_JOBS_AMOUNT_PREFIX=" "
SPACESHIP_JOBS_AMOUNT_SUFFIX=" jobs"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_DIR_TRUNC_PREFIX="…/"

SPACESHIP_KUBECONTEXT_NAMESPACE_SHOW=false
SPACESHIP_KUBECONTEXT_SYMBOL="* "

SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  # docker        # Docker section
  aws           # Amazon Web Services section
  terraform     # Terraform workspace section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  exec_time     # Execution time
  vi_mode       # Vi-mode indicator
  line_sep      # Line break
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  battery       # Battery level and status
  jobs          # Background jobs indicator
  # kubecontext will be bad with the docker solution (slow)
  # kubecontext   # Kubectl context section
)

SPACESHIP_VI_MODE_SHOW=true
SPACESHIP_VI_MODE_SUFFIX=""
SPACESHIP_VI_MODE_INSERT=""
SPACESHIP_VI_MODE_NORMAL="[NORMAL] "
spaceship_vi_mode_enable

bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char
bindkey '^[[Z' reverse-menu-complete
