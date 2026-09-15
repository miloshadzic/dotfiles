set -gx EDITOR nvim

set -gx GOPATH ~/go/
set -gx GOBIN ~/go/bin

# fish_add_path skips directories that don't exist, so this list is safe on every machine
fish_add_path -g $GOPATH/bin ~/bin ~/.local/bin

switch (uname)
    case Darwin
        set -gx HOMEBREW_AUTO_UPDATE_SECS 604800
        set -gx ODIN_ROOT /opt/homebrew/opt/odin/libexec
        set -gx CPATH /opt/homebrew/include
        set -gx LIBRARY_PATH /opt/homebrew/lib

        fish_add_path -g /opt/homebrew/bin /opt/homebrew/sbin /usr/local/opt/llvm/bin
        fish_add_path -ga ~/.docker/bin

        # Added by OrbStack: command-line tools and integration
        source ~/.orbstack/shell/init2.fish 2>/dev/null || :
    case Linux
end

# eza only checks XDG_CONFIG_HOME, which is unset on macOS
set -gx EZA_CONFIG_DIR ~/.config/eza

set -g hydro_color_pwd bryellow
set -g hydro_symbol_prompt →

# Subdirectories of functions/ (e.g. dj_scripts) are autoloaded too
set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path

if type -q mise
    if status is-interactive
        mise activate fish | source
    else
        mise activate fish --shims | source
    end
end

zoxide init fish | source

# Machine-specific settings and secrets; not committed
test -f $__fish_config_dir/local.fish; and source $__fish_config_dir/local.fish
