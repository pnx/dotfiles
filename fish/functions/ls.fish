function ls
    if command -q eza
        eza $argv
    else 
        /bin/ls --color=auto $argv
    end
end
