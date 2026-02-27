#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\[\e[1;33m\]{\[\e[1;34m\]\u\[\e[1;33m\]; \[\e[1;32m\]\A\[\e[1;33m\]}[\[\e[0;33m\]\W\[\e[1;33m\]]$ \[\e[0;37m\]'

export PATH="${PATH}:/home/matlosh/scripts"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Uncomment this later when conda is needed
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/matlosh/apps/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/matlosh/apps/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/matlosh/apps/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/matlosh/apps/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

term="$(cat /proc/$PPID/comm)"

if [[ $term = "st" ]]; then
    transset-df "0.85" --id "$WINDOWID" >/dev/null
fi

# nvm automatically set Node.js version based on .nvmrc file
enter_directory() {
  if [[ $PWD == $PREV_PWD ]]; then
    return
  fi

  if [[ "$PWD" =~ "$PREV_PWD" && ! -f ".nvmrc" ]]; then
    return
  fi

  PREV_PWD=$PWD
  if [[ -f ".nvmrc" ]]; then
    nvm use
    NVM_DIRTY=true
  elif [[ $NVM_DIRTY = true ]]; then
    nvm use default
    NVM_DIRTY=false
  fi
}

# Make nvm work
if [ -z "${NVM_DIR:-}" ]; then
  NVM_DIR="$HOME/.nvm"
  [ -n "${XDG_CONFIG_HOME:-}" ] && NVM_DIR="$XDG_CONFIG_HOME/nvm"
fi
export NVM_DIR

# "nvm exec" and certain 3rd party scripts expect "nvm.sh" and "nvm-exec" to
# exist under $NVM_DIR
[ ! -e "$NVM_DIR" ] && mkdir -vp "$NVM_DIR"
[ ! -e "$NVM_DIR/nvm.sh" ] && ln -vs /usr/share/nvm/nvm.sh "$NVM_DIR/nvm.sh"
[ ! -e "$NVM_DIR/nvm-exec" ] && ln -vs /usr/share/nvm/nvm-exec "$NVM_DIR/nvm-exec"

. /usr/share/nvm/nvm.sh
. /usr/share/nvm/bash_completion

export PROMPT_COMMAND="enter_directory"
export _JAVA_AWT_WM_NONREPARENTING=1
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
