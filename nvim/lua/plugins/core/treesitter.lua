return {
    'nvim-treesitter/nvim-treesitter',
    build = function()
        require('nvim-treesitter.install').update({ with_sync = true })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'nvim-treesitter/playground'
    },
    opts = require('config.plugins.treesitter'),
    config = function(_, opts)
        local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

        parser_config.blade = {
            install_info = {
                url = 'https://github.com/EmranMR/tree-sitter-blade',
                branch = "main",
                files = { 'src/parser.c' },
                generate_requires_npm = true,
                requires_generate_from_grammar = true,
            },
            filetype = 'blade',
        }

        require("nvim-treesitter.configs").setup(opts)
    end,
}
