#alias startDocker='docker-machine start default && eval "$(docker-machine env default)" && docker images && docker ps'
alias nukeDocker='docker rm $(docker ps -aq) && docker rmi $(docker images -aq) && docker images && docker ps'
alias poop='unset ${!DOCKER*}'

