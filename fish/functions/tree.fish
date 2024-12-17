function tree
    if test -f /usr/bin/eza
        /usr/bin/eza -T $argv
    else
        /bin/tree $argv
    end
end
