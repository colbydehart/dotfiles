. ~/.bash_aliases
. ~/.git-prompt.sh

export EDITOR="emacs"
export ANDROID_HOME=/usr/local/opt/android-sdk
export WORKON_HOME=~/envs
export GTAGSLABEL="ctags"
export GTAGSCONF=~/.globalrc

export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
# Elixir mix autocomplete
. ~/.mix_ac.sh
# virtual envs for python
# . /usr/local/bin/virtualenvwrapper.sh

#borrowed from Jason Meyers who borrowed from MITSUHIKO
MY_DEFAULT_COLOR="[97m"
MY_GRAY_COLOR="[90m"
MY_BLUE_COLOR="[34m"
MY_ORANGE_COLOR="[1m"

export MY_BASEPROMPT='\e${MY_DEFAULT_COLOR}\u\
\e${MY_GRAY_COLOR}@\e${MY_ORANGE_COLOR}\h \
\e${MY_GRAY_COLOR}in \e${MY_BLUE_COLOR}\w \
\e${MY_ORANGE_COLOR}$(__git_ps1)\e${MY_DEFAULT_COLOR}'
export PS1="${MY_BASEPROMPT}
$ "

# export PYTHONPATH=/lib/python2.7/site-packages/

eval "$(direnv hook bash)"
