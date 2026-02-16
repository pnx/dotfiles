if [ -d "$HOME/.cargo/bin" ]
    fish_add_path $HOME/.cargo/bin
end

if [ -f "$HOME/.cargo/env.fish" ]
    source "$HOME/.cargo/env.fish"
end
