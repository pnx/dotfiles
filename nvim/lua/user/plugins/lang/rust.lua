local spec = require('user.utils.lang_spec')

local lspservers = {
    rust_analyzer = {
        -- settings = {
        --     ["rust-analyzer"] = {
        --         imports = {
        --             granularity = {
        --                 group = "module",
        --             },
        --             prefix = "self",
        --         },
        --         cargo = {
        --             buildScripts = {
        --                 enable = true,
        --             },
        --         },
        --         procMacro = {
        --             enable = true
        --         },
        --     }
        -- }
    }
}

return {
    spec.treesitter("rust", "toml"),
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = lspservers
        },
    }
}
