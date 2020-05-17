#some color define
BLACK='\[\e[30m\]'
RED='\[\e[31m\]'
GREEN='\[\e[32m\]'
YELLOW='\[\e[33m\]'
BLUE='\[\e[34m\]'
MAGENTA='\[\e[35m\]'
CYAN='\[\e[36m\]'
WHITE='\[\e[37m\]'
NORMAL='\[\e[0m\]'

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# change terminal type to support 256 colors
# [ "x$TERM" = "xxterm" -a -e /usr/share/terminfo/x/xterm-256color ] && TERM='xterm-256color'
[ "$TERM" = "xterm" ] && TERM='xterm-256color'

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
*256color)
    if [ "x$UID" != "x0" ]; then
        PS1="${GREEN}[${CYAN}\u${YELLOW}@${GREEN}\h ${YELLOW}\w${GREEN}]\n\$ ${NORMAL}"
        #PS1="${GREEN}[${CYAN}\u${YELLOW}@${GREEN}\h ${YELLOW}\W${GREEN}]\$ ${NORMAL}"
    else
        PS1="${GREEN}[${RED}\u@\h ${YELLOW}\W${GREEN}]\$ ${NORMAL}"
    fi
    ;;
*)
    PS1='[\u@\H \W]\$ '
    ;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# display man infor colorful
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export GROFF_NO_SGR=yes

# enable java
export PATH=$PATH:/home/tony.he/jre/jre1.8.0_161/bin

# eable z.sh
. $HOME/bin/z-1.9/z.sh

#undefine color
unset BLACK
unset RED
unset GREEN
unset YELLOW
unset BLUE
unset MAGENTA
unset CYAN
unset WHITE
unset NORMAL

# ls colors
eval `dircolors ~/.dir_colors`

# alias
alias ls='ls --color=auto'
alias la='ls -a'
alias l='ls -al'
alias rm='rm -i'
alias cd1='cd ..'
alias cd2='cd ../..'
alias cd3='cd ../../..'
alias cd4='cd ../../../..'
alias ctags='~/bin/ctags/bin/ctags'
alias grep='~/bin/grep/bin/grep --color=auto'
## git
alias gp='git push'
alias gpl='git pull'
alias gr='git remote -v'
alias gb='git branch'
alias gba='git branch -a'
alias gst='git status'
alias gcs='git commit -sv'
alias gco='git checkout'
alias gd='git diff'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
