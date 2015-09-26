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
alias ack=ack-grep
alias cl=clear
alias pydb="python3 -S /usr/bin/py3_dbgp -d localhost:9000 $1"
