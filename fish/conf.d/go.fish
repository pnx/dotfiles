if command -q go
    fish_add_path (go env GOPATH)/bin
end
