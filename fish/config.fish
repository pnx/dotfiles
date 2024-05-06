if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g GPG_TTY (tty)
end

set PATH $HOME/bin $HOME/.local/bin (go env GOPATH)/bin $PATH
set -g fish_greeting

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
