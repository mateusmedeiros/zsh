# Prints the current ruby version from rvp-prompt
# if there's a Gemfile anywhere in the tree
# This is supposed to be called by powerlevel9k
rvm_version() {
  if hash rvm 2>/dev/null; then
    local current_dir="$(pwd)"
    local has_gemfile=false
    while [[ $current_dir != "/" ]]; do
      if [[ -f $current_dir/Gemfile ]]; then
        has_gemfile=true
        break
      fi

      current_dir=$(dirname $current_dir)
    done

    if $has_gemfile; then
       print "$(rvm-prompt i v p)"
    fi
  fi
}


# Be all end all function to extract a file correctly
# calling the correct program with the correct parameters
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
