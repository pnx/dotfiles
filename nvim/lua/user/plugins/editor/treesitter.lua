return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        'windwp/nvim-ts-autotag',
        'nvim-treesitter/nvim-treesitter-textobjects'
    },
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

            -- misc
            "comment",
            "regex",
            "re2c",
            "xresources",
            "sql",
            "csv",
            "ssh_config",
            "printf",
            "nginx",
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

        parser_config.dotenv = {
            install_info = {
                url = "https://github.com/pnx/tree-sitter-dotenv",
                branch = "main",
                files = { "src/parser.c", "src/scanner.c" },
            },
            filetype = "dotenv",
        }

        vim.filetype.add({
            pattern = {
                ['%.env'] = 'dotenv',
                ['%.env%..+'] = 'dotenv',
            }
        })

        require("nvim-treesitter.configs").setup(opts)
    end,
}
