export PATH="/home/milos/.local/share/solana/install/active_release/bin:$PATH"
. "$HOME/.cargo/env"

if [[ "$OSTYPE" == "darwin"* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"

  if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    BASH_COMPLETION="$(brew --prefix)/etc/bash_completion"
    . "$(brew --prefix)/etc/bash_completion"
  fi

  export PATH=/usr/local/opt/mysql@5.7/bin:$PATH

  export LC_ALL=en_US.UTF-8

  export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
  export GOPATH="/Users/mh/src/go"
  export PATH="$PATH:/usr/local/mysql/bin/"
fi

if [[ "$OSTYPE" == "linux-gnu"* || ! -z "$IS_WSL" || ! -z "$WSL_DISTRO_NAME" ]]; then
  if [ -f /usr/bin/keychain ]; then
    /usr/bin/keychain --nogui --quiet $HOME/.ssh/id_ed25519
    source $HOME/.keychain/$HOSTNAME-sh
  fi
fi

export PS1="\[`tput setaf 10`\]\u\[`tput sgr 0`\]\[`tput sgr 0`\] in \[\e[1;02m\]\w\[\e[0m\]\n§ "

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=nvim
export BASH_SILENCE_DEPRECATION_WARNING=1

# eval "$(stack --bash-completion-script stack)"

export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/bin
export PATH=$PATH:~/.rbenv/bin

export FZF_DEFAULT_COMMAND='fd --type f'
export BAT_THEME="TwoDark"

alias ls=exa
alias http="http --style native"
export PATH=$PATH:$GOPATH/bin

eval "$(rbenv init - bash)"

. "$HOME/.cargo/env"

export PATH="/Users/mh/.local/share/solana/install/active_release/bin:$PATH"
export PATH="/usr/local/opt/node@16/bin:$PATH"

export SHELL="/bin/bash"
