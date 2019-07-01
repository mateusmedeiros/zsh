# TODO
# fix indentation
# TODO
# Remove the duplication around the force-it force-i fiasco
function heroku() {
    if [[ -z "$(docker images -q heroku-cli)" ]]; then
        docker build -t heroku-cli - < "${XDG_DATA_HOME:-$HOME/.local/share}/heroku/Dockerfile"
    fi

    local forceit=false
    if [[ $1 == 'force-it' ]]; then
        shift
        forceit=true
    fi

    local volume_mountings
    case $1 in
        themata)
            shift

            # volume_mountings=(
            #     -v heroku-cli:/usr/local/lib/node_modules
            #     -v $HOME/.config/heroku/netrc/mateus@themata.com.br:/root/.netrc
            #     -v $HOME/.ssh:/root/.ssh
            #     -v $HOME/.config/heroku/config.json/mateus@themata.com.br:/root/.local/share/heroku/config.json
            #     -v $HOME/.config/heroku/.cache/mateus@themata.com.br:/root/.cache/heroku
            #     -v "$(pwd):/directory"
            #     -v $HOME/.local/share/binaries-for-heroku-container:/usr/local/sbin
            #     -v $HOME/.local/share/mateus@themata.com.br/node_modules:/root/.local/share/heroku/node_modules
            #     -v /var/run/docker.sock:/var/run/docker.sock
            # )
            #
            
            mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/mateus@themata.com.br/heroku
            touch ${XDG_CONFIG_HOME:-$HOME/.config}/mateus@themata.com.br/heroku/netrc
            touch ${XDG_CONFIG_HOME:-$HOME/.config}/mateus@themata.com.br/heroku/config.json

            volume_mountings=(
                -v ${XDG_CONFIG_HOME:-$HOME/.config}/mateus@themata.com.br/heroku/netrc:/root/.netrc
                -v ${XDG_CONFIG_HOME:-$HOME/.config}/mateus@themata.com.br/heroku/config.json:/root/.local/share/heroku/config.json
                -v $HOME/.ssh:/root/.ssh
                -v /var/run/docker.sock:/var/run/docker.sock
                -v "$(pwd):/directory"
            )
            ;;
        ecostage)
            shift

            ;&
        *)

            mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/mateus.medeiros@ecostage.com.br/heroku
            touch ${XDG_CONFIG_HOME:-$HOME/.config}/mateus.medeiros@ecostage.com.br/heroku/netrc
            touch ${XDG_CONFIG_HOME:-$HOME/.config}/mateus.medeiros@ecostage.com.br/heroku/config.json

            volume_mountings=(
                -v ${XDG_CONFIG_HOME:-$HOME/.config}/mateus.medeiros@ecostage.com.br/heroku/netrc:/root/.netrc
                -v ${XDG_CONFIG_HOME:-$HOME/.config}/mateus.medeiros@ecostage.com.br/heroku/config.json:/root/.local/share/heroku/config.json
                -v $HOME/.ssh:/root/.ssh
                -v /var/run/docker.sock:/var/run/docker.sock
                -v "$(pwd):/directory"
            )
            # volume_mountings=(
            #     -v heroku-cli:/usr/local/lib/node_modules
            #     -v $HOME/.config/heroku/netrc/mateus.medeiros@ecostage.com.br:/root/.netrc
            #     -v $HOME/.ssh:/root/.ssh
            #     -v $HOME/.config/heroku/config.json/mateus.medeiros@ecostage.com.br:/root/.local/share/heroku/config.json
            #     -v $HOME/.config/heroku/.cache/mateus.medeiros@ecostage.com.br:/root/.cache/heroku
            #   	-v "$(pw d):/directory"
            #   	-v $HOME /.local/share/binaries-for-heroku-container:/usr/local/sbin
            #     -v $HOME/.local/share/mateus.medeiros@ecostage.com.br/node_modules:/root/.local/share/heroku/node_modules
            #     -v /var/run/docker.sock:/var/run/docker.sock
            # )
            ;;
    esac

    if [[ $1 == 'run' ]] || $forceit; then
        docker run -it --rm --init $volume_mountings -w /directory heroku-cli heroku $@
    else
        docker run --rm --init $volume_mountings -w /directory heroku-cli heroku $@
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

function gcloud() {
    local it=false
    if [[ $1 == 'it' ]]; then
        shift
        it=true
    fi

    local volume_mountings
    case $1 in
        personal)
            shift

            volume_mountings=(
              -v "$(pwd):/directory"
              -v ${XDG_CONFIG_HOME:-$HOME/.config}/mateusbbmedeiros@gmail.com/gcloud:/root/.config/gcloud
              -v "${XDG_CONFIG_HOME:-$HOME/.config}/gcloud/kubectl/config:/kubeconfig/config"
              -v "${XDG_DATA_HOME:-$HOME/.local/share}/gcloud/kubectl-binary:/usr/local/bin/kubectl"
            )
            ;;
        ecostage)
            shift

            ;&
        *)

            volume_mountings=(
              -v "$(pwd):/directory"
              -v ${XDG_CONFIG_HOME:-$HOME/.config}/mateus.medeiros@ecostage.com.br/gcloud:/root/.config/gcloud
              -v "${XDG_CONFIG_HOME:-$HOME/.config}/gcloud/kubectl/config:/kubeconfig/config"
              -v "${XDG_DATA_HOME:-$HOME/.local/share}/gcloud/kubectl-binary:/usr/local/bin/kubectl"
            )
            ;;
    esac

    if $it; then
        docker run -it --rm --init $volume_mountings -w /directory google/cloud-sdk:alpine env KUBECONFIG=/kubeconfig/config gcloud $@
    else
        docker run --rm --init $volume_mountings -w /directory google/cloud-sdk:alpine env KUBECONFIG=/kubeconfig/config gcloud $@
    fi
}

function kubectl() {
    local it=false
    if [[ $1 == 'it' ]]; then
        shift
        it=true
    fi

    local volume_mountings
    case $1 in
        personal)
            shift

            volume_mountings=(
              -v "$(pwd):/directory"
              -v ${XDG_CONFIG_HOME:-$HOME/.config}/mateusbbmedeiros@gmail.com/gcloud:/root/.config/gcloud
              -v "${XDG_CONFIG_HOME:-$HOME/.config}/gcloud/kubectl/config:/kubeconfig/config"
              -v "${XDG_DATA_HOME:-$HOME/.local/share}/gcloud/kubectl-binary:/usr/local/bin/kubectl"
            )
            ;;
        ecostage)
            shift

            ;&
        *)

            volume_mountings=(
              -v "$(pwd):/directory"
              -v ${XDG_CONFIG_HOME:-$HOME/.config}/mateus.medeiros@ecostage.com.br/gcloud:/root/.config/gcloud
              -v "${XDG_CONFIG_HOME:-$HOME/.config}/gcloud/kubectl/config:/kubeconfig/config"
              -v "${XDG_DATA_HOME:-$HOME/.local/share}/gcloud/kubectl-binary:/usr/local/bin/kubectl"
            )
            ;;
    esac

    if $it; then
        docker run -it --rm --init $volume_mountings -w /directory google/cloud-sdk:alpine env KUBECONFIG=/kubeconfig/config kubectl $@
    else
        docker run --rm --init $volume_mountings -w /directory google/cloud-sdk:alpine env KUBECONFIG=/kubeconfig/config kubectl $@
    fi
}

function gsutil() {
    local it=false
    if [[ $1 == 'it' ]]; then
        shift
        it=true
    fi

    local volume_mountings
    case $1 in
        personal)
            shift

            volume_mountings=(
		-v "$(pwd):/directory"
                -v ${XDG_CONFIG_HOME:-$HOME/.config}/mateusbbmedeiros@gmail.com/gcloud:/root/.config/gcloud
            )
            ;;
        ecostage)
            shift

            ;&
        *)

            volume_mountings=(
		-v "$(pwd):/directory"
                -v ${XDG_CONFIG_HOME:-$HOME/.config}/mateus.medeiros@ecostage.com.br/gcloud:/root/.config/gcloud
            )
            ;;
    esac

    if $it; then
        docker run -it --rm --init $volume_mountings -w /directory google/cloud-sdk:alpine gsutil $@
    else
        docker run --rm --init $volume_mountings -w /directory google/cloud-sdk:alpine gsutil $@
    fi
}
