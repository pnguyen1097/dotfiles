pmodload 'helper'

# cd into repo's root
function prt {
  cd "$(git rev-parse --show-toplevel)"
}

# function serve {
#   local port
#   [[ -n $1 ]] && port=$1 || port=3000
#
#   if is-callable 'ruby'; then
#     ruby -run -ehttpd . -p $port
#   elif is-callable 'python'; then
#     python -m http.server $port
#   elif is-callable 'php'; then
#     php -S localhost:$port
#   fi
# }

alias ls='ls --group-directories-first --human-readable --color=auto --classify'
alias l="$aliases[ls]"
alias ll="$aliases[ls] -l"
alias la="$aliases[ll] -a"

function docker-harvest {
  docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")
}

alias fig='docker-compose'
alias figdie='fig stop && fig rm -f --all'
alias figreload='figdie && fig build && fig up -d'
alias vim=nvim
