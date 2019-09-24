# get back up the tree faster
alias ..=' cd ..'
alias ...=' cd ../..'
alias ....=' cd ../../..'
alias .....=' cd ../../../..'
alias ......=' cd ../../../../..'
# git stuff
alias gs='git status'
alias gl='git log --oneline --graph --decorate $argv'
grs () {
    git rebase source/${1:-master};
}
alias grc='git rebase --continue'
alias gri='git rebase -i'
alias ga='git add -p'
alias gc='git commit -m'
alias gca='git commit --amend --no-edit'
alias gco='git checkout'
alias gf='git fetch --all --prune'
alias gpf='git push --force-with-lease'
alias gpr='hub pull-request -b NavitasLease:master'
alias gps='git pull source master'
alias grhh='git reset --hard HEAD'
# git submodule stuff
alias gsuu='git submodule update --remote --rebase'
alias gsup='git push --recurse-submodules=on-demand'
# no time to type "nvim"
alias nv="nvim"
# easier xclipping
alias xclip="xclip -selection c"
# clear the screen
alias cl=clear
# list everything
alias la='ls -la'
# git grep
alias gag="git --no-pager grep --heading --break --line-number"
# give me my ip
alias haz="curl -4 icanhazip.com"
# copy local ip
alias myip="ifconfig | grep en0 -A 3 | grep \"inet \" | cut -d \" \" -f 2"
# Docker stuff
alias dc="docker-compose"
alias dm="docker-machine"
alias dcl="docker container ls"
# react native
alias rn="react-native"
# tmux in color mode with unicode
alias tmux="tmux -u2"
# arduino CLI tool
alias arduino='/Applications/Arduino.app/Contents/MacOS/Arduino'
# iex with mix
alias ism="iex -S mix"
# open phoenix server
alias imps="iex -S mix phx.server"
# killall zsh
alias killzsh="ps ax -o pid,command,ppid | grep 'zsh' | awk '{print $1}' | xargs kill -9"
# Open localhost
olh () {
    open http://localhost:$1;
}
