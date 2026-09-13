# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/mh/.docker/bin"
# End of Docker Desktop section.

set -gx EDITOR nvim

set -gx GOPATH ~/go/
set -gx GOBIN ~/go/bin

set -gx HOMEBREW_AUTO_UPDATE_SECS 604800
set -gx ODIN_ROOT /opt/homebrew/opt/odin/libexec

set -gx CPATH /opt/homebrew/include
set -gx LIBRARY_PATH /opt/homebrew/lib

fish_add_path $GOPATH/bin
fish_add_path usr/local/opt/llvm/bin
fish_add_path ~/bin

source "$HOME/.cargo/env.fish"

if status is-interactive
  # Commands to run in interactive sessions can go here
end

set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path

if status is-interactive
  mise activate fish | source
else
  mise activate fish --shims | source
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
