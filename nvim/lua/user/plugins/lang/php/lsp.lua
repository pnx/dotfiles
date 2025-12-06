
local servers = {
    laravel_ls = {
        mason = false,
        cmd = { "/home/pnx/code/go/laravel-ls/start.sh", "--log-level", "trace" }
    },
    phpactor = require 'user.plugins.lang.php.lsp.phpactor',
    -- Use intelephense as main server.
    intelephense = require 'user.plugins.lang.php.lsp.intelephense',
}

return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = servers
    },
}
