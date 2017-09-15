. ~/.bash_aliases
. ~/.git-prompt.sh

# let me open a bunch of files
ulimit -n 4096

#Neovim is editor
export EDITOR=nvim

#Cool prompt
export LP_PS1_POSTFIX="\n🙇  "
. ~/liquidprompt/liquidprompt

#Fix nvim cursor
#export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

#Update PATH
NPM_BIN_PATH=$(npm -g bin) # Add node_modules to PATH
if [ -d $NPM_BIN_PATH ]; then
  export PATH="$PATH:$NPM_BIN_PATH"
fi

#Haskell executables
export PATH="$HOME/Library/Haskell/bin:$PATH"
#Python executables
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

export ANDROID_HOME="$HOME/Library/Android/sdk"
if [ -d $ANDROID_HOME ]; then
  export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
fi
export PATH="$PATH:$HOME/go/bin"

# brew completions
BREW_COMPLETIONS=$(brew --prefix)
if [ -f $BREW_COMPLETIONS/etc/bash_completion ]; then
  . $BREW_COMPLETIONS/etc/bash_completion
fi

# fzf settings
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# use for neovim alias and atom
complete -F _fzf_file_completion -o default -o bashdefault nv
complete -F _fzf_file_completion -o default -o bashdefault atom
# respect gitignore
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# set erlang flags for elixir history
export ERL_AFLAGS="-kernel shell_history enabled"

# added by travis gem
[ -f /Users/colbydehart/.travis/travis.sh ] && source /Users/colbydehart/.travis/travis.sh
