local spec = require('user.utils.lang_spec')

return {
    spec.treesitter("css", "scss"),
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                tailwindcss = {},
            }
        },
    }
}
