function ll
    if command -q eza
        eza --icons=always -l --git $argv
    else
        /bin/ls --color=auto -l $argv
    end
end
