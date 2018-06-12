#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# prepend path
export PATH=/home/schellsn/miniconda3/bin:/home/schellsn/bin:$PATH

alias ll='ls --color=auto -l'
alias la='ls --color=auto -a'
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export EDITOR=vim

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
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

# This binds Ctrl-O to ranger-cd:
# bind '"\C-o":"ranger-cdC-m"'
alias cdr="ranger-cd"


# Vim key bindings
set -o vi

# autocompletion settings
#bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# alias for dotfile handling
alias config='/usr/bin/git --git-dir=$HOME/vcs/dotfiles/ --work-tree=$HOME'
