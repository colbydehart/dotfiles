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
  eval "$(pyenv virtualenv-init -)"
fi

# Node Version Manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# Automatically do stuff when entering directories
[ -x "$(command -v direnv)" ] && eval "$(direnv hook zsh)"
# Rustup stuff
[ -f ${HOME}/.cargo/env ] && source ${HOME}/.cargo/env

# Doom
export DOOMDIR=$HOME/.doom.d

# America's favorite PATHs-time.
# Home bin
PATH=~/bin:${PATH}
# Local bin
PATH=~/.local/bin:${PATH}
# Always want this as the last path
export PATH=/usr/local/bin:${PATH}

# Local (nonmanaged) zsh config
[ -f ${HOME}/.zshrc.local ] && source ${HOME}/.zshrc.local
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
