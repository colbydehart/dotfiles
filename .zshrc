#     "ZSHRC"
# BY COLBY DEHART
#     A NOVEL

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
autoload -U compinit promptinit bashcompinit
compinit
promptinit
bashcompinit

# Version control autocomplete
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'

# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Neovim
export EDITOR=nvr
# Beautiful Prompt
export PROMPT="%n@%~ "
export RPROMPT=\$vcs_info_msg_0_

[ -f ~/dotfiles/.bash_aliases ] && source ~/dotfiles/.bash_aliases

# Python startup
export PYTHONSTARTUP=~/dotfiles/.pythonrc
# Pyenv python manager
export PATH="$HOME/.pyenv/bin:$PATH"
export PYENV_ROOT=$HOME/.pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Automatically do stuff when entering directories
[ -x "$(command -v direnv)" ] && eval "$(direnv hook zsh)"
# Rustup stuff
[ -f ${HOME}/.cargo/env ] && source ${HOME}/.cargo/env

# asdf version manager
[ -f ${HOME}/.asdf/asdf.sh ] && source $HOME/.asdf/asdf.sh
[ -f ${HOME}/.asdf/completions/asdf.bash ] && source $HOME/.asdf/completions/asdf.bash

# America's favorite PATHs-time.
# Home bin
PATH=~/bin:${PATH}
# Local bin
PATH=~/.local/bin:${PATH}
# Always want this as the last path
export PATH=/usr/local/bin:${PATH}

# Local (nonmanaged) zsh config
[ -f ${HOME}/.zshrc.local ] && source ${HOME}/.zshrc.local
