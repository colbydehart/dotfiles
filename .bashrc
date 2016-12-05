. ~/.bash_aliases
. ~/.git-prompt.sh

# asdf version manager
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# let me open a bunch of files
ulimit -n 2048

#Neovim is editor
export EDITOR=nvim

#Cool prompt
export LP_PS1_POSTFIX="\n🙇  "
. ~/liquidprompt/liquidprompt

#Fix nvim cursor
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

#Update PATH
YARN_BIN_PATH=$(yarn global bin) # Add node_modules to PATH
if [ -d $YARN_BIN_PATH ]; then
  export PATH="$PATH:$YARN_BIN_PATH"
fi

export ANDROID_HOME="$HOME/Library/Android/sdk"
if [ -d $ANDROID_HOME ]; then
  export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
fi

# git completion
# brew completions
BREW_COMPLETIONS=$(brew --prefix)
if [ -f $BREW_COMPLETIONS/etc/bash_completion ]; then
  . $BREW_COMPLETIONS/etc/bash_completion
fi
