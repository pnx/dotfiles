if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x GPG_TTY (tty)
end

# Disable greeting
set -g fish_greeting
