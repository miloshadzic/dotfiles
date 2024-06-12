set -gx EDITOR nvim

set -gx GOPATH ~/go/
set -gx GOBIN ~/go/bin

set -gx HOMEBREW_AUTO_UPDATE_SECS 604800

set -gx CPATH /opt/homebrew/include
set -gx LIBRARY_PATH /opt/homebrew/lib

fish_add_path $GOPATH/bin

if status is-interactive
  # Commands to run in interactive sessions can go here
end

