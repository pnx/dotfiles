function tree
    if command -q eza
        eza -T $argv
    else
        /bin/tree $argv
    end
end
