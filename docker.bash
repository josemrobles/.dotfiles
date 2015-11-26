#alias startDocker='docker-machine start default && eval "$(docker-machine env default)" && docker images && docker ps'
function initDocker () { docker-machine start "$1" && eval \"$(docker-machine env "$1")\" && docker images && docker ps -a;} 
alias evalDocker='eval "$(docker-machine env default)"'
alias upDocker='docker-compose up -d'
function sshDocker () { docker exec -it "$1" /bin/bash; } 
alias stopDocker='docker stop $(docker ps -q)'
alias nukeDocker='docker rm $(docker ps -aq) && docker rmi $(docker images -aq) && docker images && docker ps'
export -f sshDocker
export -f initDocker
