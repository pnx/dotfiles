function ll
    if test -f /usr/bin/eza
        /usr/bin/eza --icons=always -l --git $argv
    else
        /bin/ls --color=auto -l $argv
    end
end
