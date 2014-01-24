source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PS1="\u at \[`tput setaf 16`\]\h\[`tput sgr 0`\] in \W > "

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export PATH=/usr/local/bin:$PATH
