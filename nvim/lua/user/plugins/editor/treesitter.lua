return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        opts_extend = { "ensure_installed" },
        opts = {
            -- Default parsers.
            ensure_installed = {
                -- VIM stuff
                "vim",
                "vimdoc",
                "query",

                -- Common config languages
                "json",
                "jsonc",
                "yaml",
                "toml",
                "xml",
                "kdl",
            },

            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            indent = {
                enable = true,
            },
        },
        config = function(_, opts)
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

            parser_config.blade = {
                install_info = {
                    url = "https://github.com/EmranMR/tree-sitter-blade",
                    branch = "main",
                    files = { "src/parser.c" },
                },
                filetype = "blade",
            }

            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        event = "InsertEnter",
        opts = {}
    },
}
