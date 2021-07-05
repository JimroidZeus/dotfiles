#!/bin/bash
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    ./etc/bashrc
fi

export LC_ALL=en_CA.UTF-8
export LANG=en_CA.UTF-8
export LANGUAGE=en_CA.UTF-8

#Set directory colors
eval `dircolors ~/.dir_colors`

PROMPT_COMMAND='exit_code; __prompt_command; history -a'

errorcolor=''
function exit_code() {
    exitcode=$?

    if [[ exitcode -ne 0 ]]; then
        errorcolor='[0;31m'
        exitprompt='\[\e${errorcolor}\][${exitcode}] '
    else
        errorcolor='[01;36m'
        exitprompt='\[\e${errorcolor}\]'
    fi
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#Solaried Name      #ANSI Colour Codes
#Base02             # 30
#Red                # 31
#Green              # 32
#Yellow             # 33
#Blue               # 34
#Magenta            # 35
#Cyan               # 36
#Base2              # 37
#Base03             # 01:30
#Orange             # 01;31
#Base01             # 01;32
#Base00             # 01;33
#Base0              # 01;34
#Violet             # 01;35
#Base1              # 01;36
#Base3              # 01;37

usercolor='[0;35m'
inputcolor='[01;36m'    #Base1
branchcolor='[0;36m'
atcolor='[01;36m'
hostcolor='[01;35m'
cwdcolor='[0;34m'
timecolor='[0;32m'
bracketcolor='[01;34m'  #Base0
promptcolor='[0;33m'
prompt_char='∯'

function __prompt_command(){
    PS1=''
    PS1="$PS1"'\n'                                                                                      #start prompt on a new line
    PS1="$PS1"'\[\e${bracketcolor}\][\[\e${timecolor}\]\T\[\e${bracketcolor}\]] '                       #bracket color
    PS1="$PS1""$exitprompt"                                                                             #error code from last command
    PS1="$PS1"'\[\e${bracketcolor}\][\[\e${usercolor}\]\u\[\e${bracketcolor}\]] '                      #username
    PS1="$PS1"'\[\e${atcolor}\]@ \[\e${bracketcolor}\][\[\e${hostcolor}\]\h\[\e${bracketcolor}\]] '     #@
    PS1="$PS1"'[\[\e${cwdcolor}\]\w\[\e${bracketcolor}\]]'                                              #hostname
    PS1="$PS1"'\[\e${branchcolor}\]$(parse_git_branch) '                                                #git branch info
    PS1="$PS1"'\[\e${promptcolor}\]∯\[\e${inputcolor}\] '                                              #prompt character
}
export PS1

function sublime(){
    /c/Program\ Files/Sublime\ Text\ 3/sublime_text "$1" &
}

alias subl="C:/Program\ Files/Sublime\ Text\ 3/sublime_text.exe"

alias otto='cd ~/Documents/Connected\ Factory/Otto'
alias cf='cd ~/Documents/Connected\ Factory/'

alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd..'
alias cd..='cd ..'

alias q='exit'

alias ls='ls -l --color'
alias la='ls -la --color'

alias grep='grep -n --color'
alias cd..='cd ..'
alias plz='sudo'

alias gs='git status'
alias gc='git commit -m'
alias gf='git fetch'
alias gfo='git fetch origin'
alias gp='git pull'
alias gpo='git pull origin'
alias gpsh='git push'
alias gpsho="git push origin"