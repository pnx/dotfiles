function vim --wraps=nvim --description 'alias vim nvim'
    if command -q nvim
        nvim $argv
    else if command -q vim
        command vim $argv
    else
        echo "fish: unknown command: vim"
        return 127
    end
end
