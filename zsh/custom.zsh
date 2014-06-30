# skips dupes when using up/down arrows to look through your history
setopt HIST_FIND_NO_DUPS

export EDITOR=vim

# human readable sizes
alias df="df -H"

# human readable sizes and a total
alias du="du -hc"

# create sub directories all at once
alias mkdir="mkdir -p"

# list with human readable sizes
alias ll='ls -oh'

# list only dot files/directories
alias l.='ll -Ad \.*'

# ignore case when searching
alias less='less -i'

# man is supposed to default to this but case insensitive search isn't working
alias man='man -P "less -is"'

# make directory and change
mdc() {
  mkdir $1
  cd $1
}

# cat with colorize (requires pygments: sudo easy_install Pygments)
alias c='colorize'
