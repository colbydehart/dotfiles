# get back up the tree faster
alias ..=' cd ..'
alias ...=' cd ../..'
alias ....=' cd ../../..'
alias .....=' cd ../../../..'
alias ......=' cd ../../../../..'
# git stuff
alias gs='git status'
alias gl='git log --oneline --graph --decorate $argv'
alias grc='git rebase --continue'
alias gri='git rebase -i'
alias grs='git rebase source/master'
alias grsd='git rebase source/development'
alias ga='git add -p'
alias gc='git commit -m'
alias gca='git commit --amend --no-edit'
alias gco='git checkout -b $argv'
alias gf='git fetch --all --prune'
alias gpf='git push --force-with-lease'
alias gpr='hub pull-request -h master -b NavitasLease:master'
alias gps='git pull source master'
# git submodule stuff
alias gsuu='git submodule update --remote --rebase'
alias gsup='git push --recurse-submodules=on-demand'
# no time to type "nvim"
alias nv="nvim"
# serve current directory
alias srvdir="live-server"
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
# docker compose
alias dc="docker-compose"
# react native
alias rn="react-native"
# newsbeueter
alias nb="newsbeuter"
# tmux in color mode with unicode
alias tmux="tmux -u2"
# arduino CLI tool
alias arduino='/Applications/Arduino.app/Contents/MacOS/Arduino'
# do work
alias dw="cd ~/dev/work"
# mix testing
alias mixtest="mix-test-watch"
# Open localhost
olh () {
    open http://localhost:$1;
}
