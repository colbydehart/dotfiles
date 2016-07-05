. ~/.bash_aliases
. ~/.git-prompt.sh

# Docker World
eval `docker-machine env 2>/dev/null`

# Keep logged in on lpass
export LPASS_AGENT_TIMEOUT=0

# nvm setup
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

LP_PS1_POSTFIX="🙇 \n" source ~/liquidprompt/liquidprompt

eval "$(direnv hook bash)"

#Android stuff
export ANDROID_HOME="/Users/colbydehart/Library/Android/sdk"

#Update PATH
export PATH=$PATH:$HOME/.cargo/bin
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:/Users/colbydehart/Library/Android/sdk/tools:/Users/colbydehart/Library/Android/sdk/platform-tools"
