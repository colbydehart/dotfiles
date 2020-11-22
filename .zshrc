#     "ZSHRC"
# BY COLBY DEHART
#     A NOVEL

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/colbydehart/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Version control autocomplete
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'

# The shell, the glorious, glorious shell
SHELL=/bin/zsh

# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Neovim
export EDITOR=/usr/local/bin/nvim
# Beautiful Prompt
export PROMPT="%n@%~ "
export RPROMPT=\$vcs_info_msg_0_

[ -f ~/dotfiles/.bash_aliases ] && source ~/dotfiles/.bash_aliases

# Python startup
export PYTHONSTARTUP=~/dotfiles/.pythonrc
# Pyenv python manager
export PYENV_ROOT=~/.pyenv
if command -v pyenv 1>/dev/null 2>&1; then
   eval "$(pyenv init -)"
fi

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Automatically do stuff when entering directories
eval "$(direnv hook zsh)"

# --- --- ---
# Star development
function starconfig () {
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_ACCESS_KEY
  export AWS_PROFILE=star
  export AWS_DEFAULT_REGION=us-east-1
  aws --region us-east-1 ecr get-login-password | docker login --username AWS --password-stdin https://298433512871.dkr.ecr.us-east-1.amazonaws.com
}
# TODO: remove when i work on health
export AWS_PROFILE=star

# --- --- ---

# America's favorite PATHs-time.
# Home bin
PATH=~/bin:${PATH}
# Pyenv should work yeah?
PATH=${PYENV_ROOT}/bin:${PATH}
# Postgres or PostgreSQL? PSQL? Postgres Sequel SQL? 2 Postgres 2 Furious?
PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:${PATH}
# Add Visual Studio Code (code) bin
PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:${PATH}"
# Always want this as the last path
export PATH=/usr/local/bin:${PATH}

# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH
# added by tfenv
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/Cellar/tfenv/2.0.0/versions/0.13.2/terraform terraform
