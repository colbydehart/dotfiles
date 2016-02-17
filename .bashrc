. ~/.bash_aliases
. ~/.git-prompt.sh

export EDITOR="emacs"
export WORKON_HOME=~/envs
export GTAGSLABEL="ctags"
export GTAGSCONF=~/.globalrc

# Android stuff
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Elixir mix autocomplete
. ~/.mix_ac.sh
# virtual envs for python
. /usr/local/bin/virtualenvwrapper.sh

LP_PS1_POSTFIX="🙇🏻 \n"
. ~/liquidprompt/liquidprompt

#if [[ ! $TERM =~ screen ]]; then
#  tmux
#fi
eval "$(direnv hook bash)"
