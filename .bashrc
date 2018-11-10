[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.git-prompt.sh ] && source ~/.git-prompt.sh

# let me open a bunch of files
ulimit -n 4096

#Neovim is editor
export EDITOR=nvim
#Neovim colors
export NVIM_TUI_ENABLE_TRUE_COLOR=1

#Cool prompt
export LP_PS1_POSTFIX="\n🙇  "
[ -f ~/liquidprompt/liquidprompt ] && source ~/liquidprompt/liquidprompt

#NPM executables
NPM_BIN_PATH=$(npm -g bin) # Add node_modules to PATH
[ -d $NPM_BIN_PATH ] && export PATH="$PATH:$NPM_BIN_PATH"
#Python executables
PYTHON3_BIN_PATH="$HOME/Library/Python/2.7/bin"
[ -d $PYTHON_BIN_PATH ] && export PATH="$PYTHON_BIN_PATH:$PATH"
PYTHON3_BIN_PATH="$HOME/Library/Python/3.7/bin"
[ -d $PYTHON3_BIN_PATH ] && export PATH="$PYTHON3_BIN_PATH:$PATH"
#Android executables
export ANDROID_HOME="$HOME/Library/Android/sdk"
[ -d $ANDROID_HOME ] && export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
#Haskell executables
[ -d "$HOME/Library/Haskell/bin" ] && export PATH="$HOME/Library/Haskell/bin:$PATH"
#Go executables
[ -d "$HOME/go/bin" ] && export PATH="$PATH:$HOME/go/bin"

# brew completions
BREW_COMPLETIONS=$(brew --prefix)
if [ -f $BREW_COMPLETIONS/etc/bash_completion ]; then
  source $BREW_COMPLETIONS/etc/bash_completion
fi

# -- ASDF
[ -f /usr/local/opt/asdf/asdf.sh ] && source /usr/local/opt/asdf/asdf.sh

# -- FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# use for neovim alias and atom
complete -F _fzf_file_completion -o default -o bashdefault nvim
complete -F _fzf_file_completion -o default -o bashdefault nv
complete -F _fzf_file_completion -o default -o bashdefault atom
# respect gitignore
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# set erlang flags for iex history
export ERL_AFLAGS="-kernel shell_history enabled"

# Set up Travis
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# added by travis gem
[ -f /Users/colbydehart/.travis/travis.sh ] && source /Users/colbydehart/.travis/travis.sh
