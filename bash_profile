source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PS1="\[`tput setaf 5`\]\u \[`tput sgr 0`\]on \[`tput setaf 14`\]\h\[`tput sgr 0`\] in \W → "

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=nvim

# eval "$(stack --bash-completion-script stack)"

export PATH=$PATH:/Users/milos/.local/bin
export PATH=$PATH:/Users/milos/.stack/programs/x86_64-osx/ghc-7.10.3/bin

export GOPATH=$HOME/.golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:/Library/TeX/texbin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

export ANSIBLE_VAULT_PASSWORD_FILE=~/.ansible_pass

alias ls=exa
alias http="http --style native"

