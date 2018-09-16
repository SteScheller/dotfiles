#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ll='ls --color=auto -l'
alias la='ls --color=auto -a'
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
alias vim='nvim'

export EDITOR=nvim

# Powerline
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh
fi

alias config='/usr/bin/git --git-dir=$HOME/vcs/dotfiles/ --work-tree=$HOME'
