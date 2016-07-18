. ~/.bash_aliases
. ~/.git-prompt.sh

export EDITOR=vim

# Docker World
eval `docker-machine env 2>/dev/null`

# Keep logged in on lpass
export LPASS_AGENT_TIMEOUT=0

# nvm setup
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

LP_PS1_POSTFIX="🙇 \n" source ~/liquidprompt/liquidprompt

eval "$(direnv hook bash)"

#Update PATH
export PATH="$PATH:./node_modules/.bin"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# brew completions
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi
