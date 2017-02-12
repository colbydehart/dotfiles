# get back up the tree faster
alias ..=" cd ..$argv"
alias ...=" cd ../..$argv"
alias ....=" cd ../../..$argv"
alias .....=" cd ../../../..$argv"
alias ......=" cd ../../../../..$argv"
# git stuff
alias gs="git status"
alias gl="git log --oneline --graph --decorate $argv"
alias gri="git rebase -i source/development"
alias grs="git rebase source/development"
alias ga="git add -p"
alias gc="git commit -m $argv"
alias gf="git fetch --all --prune"
# no time to type "nvim"
alias nv="nvim"
# serve current directory
alias srvdir="python -m SimpleHTTPServer 8000"
# easier xclipping
alias xclip="xclip -selection c"
# clear the screen
alias cl=clear
# list everything
alias la='ls -la'
# git grep
alias gag="git --no-pager grep --heading --break --line-number"
# give me my ip
alias haz="http icanhazip.com"
# copy local ip
alias myip="ifconfig | grep en0 -A 3 | grep \"inet \" | cut -d \" \" -f 2 | pbcopy"
# docker compose
alias dc="docker-compose"
# react native
alias rn="react-native"
# kill every tmux alive
alias kill-tmux="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"
# arduino CLI tool
alias arduino='/Applications/Arduino.app/Contents/MacOS/Arduino'
