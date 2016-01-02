alias ..=" cd ..$*"
alias ...=" cd ../..$*"
alias ....=" cd ../../..$*"
alias .....=" cd ../../../..$*"
alias ......=" cd ../../../../..$*"

# Git stuff
alias gs="git status"
alias gl="git log --oneline --all --graph --decorate $*"
alias ga="git add -p"
alias gc="git commit -m $*"

alias xclip="xclip -selection c"
alias cl=clear

# Use vim 7.4
alias vim="nvim"
alias la='ls -la'
# git grep
alias gag="git --no-pager grep --heading --break --line-number"

alias haz="http icanhazip.com"
