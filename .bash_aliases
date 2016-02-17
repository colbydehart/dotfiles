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

alias la='ls -la'
# git grep
alias gag="git --no-pager grep --heading --break --line-number"

alias haz="http icanhazip.com"
alias myip="ifconfig | grep en0 -A 3 | grep \"inet \" | cut -d \" \" -f 2 | pbcopy"

alias em="emacsclient -nw"
