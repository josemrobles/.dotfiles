# General
alias cc='clear'
#alias ls='ls --color=auto'
#alias ll='ls -lah'
alias grep='grep --color=auto'

# Git
alias gs='git status'
alias gb='git branch'
alias ga='git add .'

# Servers
alias chef='ssh jrobles@i.chef.realtimeprocess.net'
alias jmr='ssh jrobles@jrobles.net -p 2222'

# Docker
#alias startDocker='docker-machine start default && eval "$(docker-machine env default)" && docker images && docker ps'
function initDocker () { docker-machine start "$1" && eval \"$(docker-machine env "$1")\" && docker images && docker ps -a;} 
#alias evalDocker='eval "$(docker-machine env default)"'
function sshDocker () { docker exec -it "$1" /bin/bash; } 
alias stopDocker='docker stop $(docker ps -q)'
alias nukeDocker='docker stop $(docker ps -a) && docker rm $(docker ps -aq) && docker rmi $(docker images -aq) && docker images && docker ps'

export -f sshDocker
export -f initDocker
