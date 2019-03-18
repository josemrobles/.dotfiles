# Git
alias gs='git status'
alias ga='git add .'
alias gb='git branch'
alias gc='git commit -m "WIP"'
alias gpm='git push origin master'

# Misc
export PS1="[\w] "
alias cc='clear'
alias ccl='clear & ls'
alias grep='grep --color=auto'
alias ls='ls -l'
unset ${!DOCKER*}

# Terraform
alias tfp='terraform plan'
alias tfa='terraform apply'
