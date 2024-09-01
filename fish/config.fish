if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x GPG_TTY (tty)
end

set -g fish_greeting

# Path stuff
if command -q go
    fish_add_path (go env GOPATH)/bin
end

fish_add_path $HOME/bin
fish_add_path $HOME/.local/bin

set -x EDITOR /usr/local/bin/nvim

# Colors
set fish_color_user normal
set fish_color_host blue
set fish_color_host_remote blue
set fish_color_command blue
set fish_color_quote purple
set fish_color_keyword yellow
set fish_color_option normal
set fish_color_param normal
set fish_color_valid_path green
set fish_color_comment gray
set fish_color_operator cyan
set fish_color_cancel red
