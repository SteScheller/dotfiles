#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# prepend path
export PATH="$PATH:/home/schellsn/bin:/usr/local/cuda/bin:/home/schellsn/.local/bin"
export LD_LIBRARY_PATH="LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/lib"

# choose specific version of gcc in order to make nvcc working
#export PYCUDA_DEFAULT_NVCC_FLAGS="--compiler-bindir /opt/rh/devtoolset-4/root/usr/bin/gcc"
#export PYCUDA_DEFAULT_NVCC_FLAGS="-std=c++11"

alias ll='ls --color=auto -l'
alias la='ls --color=auto -a'
alias ls='ls --color=auto'
PS1='\[\u@\h \W\]\$ '

export EDITOR=nvim

# Ranger
#alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'

# Automatically change the directory in bash after closing ranger
#
# This is a bash function for .bashrc to automatically change the directory to
# the last visited one after ranger quits.
# To undo the effect of this function, you can type "cd -" to return to the
# original directory.
# 
# On OS X 10 or later, replace `usr/bin/ranger` with `/usr/local/bin/ranger`.

function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

# This binds Ctrl-O to ranger-cd:
# bind '"\C-o":"ranger-cdC-m"'
alias cdr="ranger-cd"

# Powerline
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bindings/bash/powerline.sh
fi

# Vim key bindings
set -o vi

# autocompletion settings
#bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# alias for dotfile handling
alias config='/usr/bin/git --git-dir=$HOME/vcs/dotfiles/ --work-tree=$HOME'

# mount drives from skynet
# skynet_mount

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/mnt/data/schellsn/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/mnt/data/schellsn/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/mnt/data/schellsn/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/mnt/data/schellsn/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

