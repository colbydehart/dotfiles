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
[ -x direnv ] && eval "$(direnv hook zsh)"

# America's favorite PATHs-time.
# Home bin
PATH=~/bin:${PATH}
# Pyenv should work yeah?
PATH=${PYENV_ROOT}/bin:${PATH}
# Always want this as the last path
export PATH=/usr/local/bin:${PATH}

[ -f ${HOME}/.zshrc.local ] && source ${HOME}/.zshrc.local
