function ls
    if test -f /usr/bin/eza
        /usr/bin/eza $argv
    else 
        /bin/ls --color=auto $argv
    end
end
