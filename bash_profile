export PS1="\u in \W > "

eval "$(rbenv init -)"

PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH

alias ls="ls -G"
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias be="bundle exec"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
