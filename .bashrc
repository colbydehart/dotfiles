. ~/.bash_aliases
. ~/.git-prompt.sh

export EDITOR="nvim"
export WORKON_HOME=~/envs
export GTAGSLABEL="ctags"
export GTAGSCONF=~/.globalrc

# Docker World
eval `docker-machine env 2>/dev/null`

# Keep logged in on lpass
export LPASS_AGENT_TIMEOUT=0

# Android stuff
export ANDROID_HOME=/usr/local/opt/android-sdk


# Elixir mix autocomplete
. ~/.mix_ac.sh
# virtual envs for python
. /usr/local/bin/virtualenvwrapper.sh

LP_PS1_POSTFIX="🙇 \n"
. ~/liquidprompt/liquidprompt
PS1='[\u@\h \W$(__docker_machine_ps1)]\$ '

#if [[ ! $TERM =~ screen ]]; then
#  tmux
#fi
eval "$(direnv hook bash)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

#Update PATH
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.composer/vendor/bin
