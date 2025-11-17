
local servers = {
    laravel_ls = {
        mason = false,
        cmd = { "/home/pnx/code/go/laravel-ls/start.sh", "--log-level", "trace" }
    },
    phpactor = require 'user.plugins.lang.php.lsp.phpactor',
    -- Use intelephense as main server.
    intelephense = {
        settings = {
            intelephense = {
                -- files = {
                --     maxSize = 10000000
                -- }
            }
        }
    }
}

return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = servers
    },
}
