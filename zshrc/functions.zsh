function heroku() {
    local forceit=false
    if [[ $1 == 'force-it' ]]; then
        shift
        forceit=true
    fi

    local volume_mountings
    case $1 in
        themata)
            shift

            volume_mountings=(
                -v heroku-cli:/usr/local/lib/node_modules
                -v $HOME/.config/heroku/netrc/mateus@themata.com.br:/root/.netrc
                -v $HOME/.config/heroku/config.json/mateus@themata.com.br:/root/.local/share/heroku/config.json
                -v $HOME/.config/heroku/.cache/mateus@themata.com.br:/root/.cache/heroku
                -v "$(pwd):/directory"
                -v $HOME/.local/share/binaries-for-heroku-container:/usr/local/sbin
                -v $HOME/.local/share/mateus@themata.com.br/node_modules:/root/.local/share/heroku/node_modules
                -v /var/run/docker.sock:/var/run/docker.sock
            )
            ;;
        ecostage)
            shift

            ;&
        *)

            volume_mountings=(
                -v heroku-cli:/usr/local/lib/node_modules
                -v $HOME/.config/heroku/netrc/mateus.medeiros@ecostage.com.br:/root/.netrc
                -v $HOME/.config/heroku/config.json/mateus.medeiros@ecostage.com.br:/root/.local/share/heroku/config.json
                -v $HOME/.config/heroku/.cache/mateus.medeiros@ecostage.com.br:/root/.cache/heroku
                -v "$(pwd):/directory"
                -v $HOME/.local/share/binaries-for-heroku-container:/usr/local/sbin
                -v $HOME/.local/share/mateus.medeiros@ecostage.com.br/node_modules:/root/.local/share/heroku/node_modules
                -v /var/run/docker.sock:/var/run/docker.sock
            )
            ;;
    esac

    if [[ $1 == 'run' ]] || $forceit; then
        docker run -it --rm --init $volume_mountings -w /directory node:9 /usr/local/lib/node_modules/heroku/bin/run $@
    else
        docker run --rm --init $volume_mountings -w /directory node:9 /usr/local/lib/node_modules/heroku/bin/run $@
    fi
}

function dpostgres() {
  local interactive=false
  local interactive_only=false
  if [[ $1 == 'psql' ]]; then
    interactive=true
  fi

  if [[ $1 == 'force-i' ]]; then
    shift
    interactive_only=true
  fi

  if [[ $1 == 'force-it' ]]; then
    shift
    interactive=true
  fi

  if [[ $1 == 'force-not-it' ]]; then
    shift
    interactive=false
  fi

  if $interactive_only; then
    docker run --rm -i -v "$(pwd):/directory" -w /directory postgres:11.2-alpine $@
  elif $interactive; then
    docker run --rm -it -v "$(pwd):/directory" -w /directory postgres:11.2-alpine $@
  else
    docker run --rm -v "$(pwd):/directory" -w /directory postgres:11.2-alpine $@
  fi
}
