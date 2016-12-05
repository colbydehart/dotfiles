alias ..=" cd ..$*"
alias ...=" cd ../..$*"
alias ....=" cd ../../..$*"
alias .....=" cd ../../../..$*"
alias ......=" cd ../../../../..$*"

# Git stuff
alias gs="git status"
alias gl="git log --oneline --all --graph --decorate $*"
alias gr="git rebase -i"
alias ga="git add -p"
alias gc="git commit -m $*"

alias nv="nvim"

alias xclip="xclip -selection c"
alias cl=clear

alias la='ls -la'
# git grep
alias gag="git --no-pager grep --heading --break --line-number"
# asdf for colemak
alias arst="asdf"

alias haz="http icanhazip.com"
alias myip="ifconfig | grep en0 -A 3 | grep \"inet \" | cut -d \" \" -f 2 | pbcopy"

alias dc="docker-compose"
alias rn="react-native"

alias kill-tmux="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"
