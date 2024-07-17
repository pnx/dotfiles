function ll --wraps=ls --wraps='eza -l --git' --wraps='eza --icons=always -l --git' --description 'alias ll eza --icons=always -l --git'
    eza --icons=always -l --git $argv
end
