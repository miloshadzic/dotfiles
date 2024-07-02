set -gx EDITOR nvim

set -gx GOPATH ~/go/
set -gx GOBIN ~/go/bin

set -gx HOMEBREW_AUTO_UPDATE_SECS 604800
set -gx ODIN_ROOT /opt/homebrew/opt/odin/libexec

set -gx CPATH /opt/homebrew/include
set -gx LIBRARY_PATH /opt/homebrew/lib

fish_add_path $GOPATH/bin
fish_add_path ~/bin
fish_add_path usr/local/opt/llvm/bin

if status is-interactive
  # Commands to run in interactive sessions can go here
end

