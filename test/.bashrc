# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

question () {
  QUESTIONS="/etc/.questions"
  usage () {
    cat << EOF
Usage: question [nb | all] [number]

\`number\` should be between 1 and $(wc -l < "$QUESTIONS").
\`nb\` and \`all\` are flags.

Examples:
     \`question nb\` gives the number of questions 
     \`question all\` shows all the questions.
     \`question 13\` shows question no 13.
EOF
  }

  [ -z "$1" ] && { echo "unknown usage of command question"; echo "use -h or --help"; return; }

  case "$1" in
    -h|--help) usage; return;;
    all) cat "$QUESTIONS"; return;;
    nb) echo "there are $(wc -l < "$QUESTIONS") questions in total."; return;;
    *) ;;
  esac

  if [ -n "$1" ] && [ "$1" -eq "$1" ] 2>/dev/null; then
    if [ "$1" -lt 1 ] || [ "$1" -gt $(wc -l < "$QUESTIONS") ]; then
      echo "question out of range (should be between 1 and $(wc -l < "$QUESTIONS"), got '$1')"
      return
    fi
    grep "^$1\." "$QUESTIONS"
  else
    echo "number expected (got '$1')"
  fi
}

PS1="\e[32m\u@\h: \e[36m\w \e[31m>\e[39m "
clear
cat /etc/motd
echo
cat /etc/hints
echo
