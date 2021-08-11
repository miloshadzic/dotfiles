source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

export LC_ALL=en_US.UTF-8

if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  BASH_COMPLETION="$(brew --prefix)/etc/bash_completion"
  . "$(brew --prefix)/etc/bash_completion"
fi

if [ -f /usr/local/share/bash-completion/bash_completion ]; then
    . /usr/local/share/bash-completion/bash_completion
fi


export PS1="\[`tput setaf 10`\]\u\[`tput sgr 0`\]\[`tput sgr 0`\] in \[\e[1;02m\]\w\[\e[0m\]\n§ "

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=nvim
export BASH_SILENCE_DEPRECATION_WARNING=1

# eval "$(stack --bash-completion-script stack)"

export PATH=$PATH:/Users/milos/.local/bin

export PATH=/usr/local/opt/mysql@5.7/bin:$PATH

export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/bin

export ANSIBLE_VAULT_PASSWORD_FILE=~/.ansible_pass
export FZF_DEFAULT_COMMAND='fd --type f'
export BAT_THEME="TwoDark"

alias ls=exa
alias http="http --style native"

export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/milos/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

# opam configuration
test -r /Users/milos/.opam/opam-init/init.sh && . /Users/milos/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
