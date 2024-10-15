return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
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

            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        -- Functions/Methods
                        ["af"] = { query = "@function.outer", desc = "outer function" },
                        ["if"] = { query = "@function.inner", desc = "inner function" },
                        -- Class
                        ["ac"] = { query = "@class.outer", desc = "around class" },
                        ["ic"] = { query = "@class.inner", desc = "inner class" },
                        -- Parameters/arguments
                        ["av"] = { query = "@parameter.outer", desc = "around parameter" },
                        ["iv"] = { query = "@parameter.inner", desc = "inner parameter" },
                    }
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>]"] = { query = "@parameter.inner", desc = "Swap next parameter with the one under cursor" },
                    },
                    swap_previous = {
                        ["<leader>["] = { query = "@parameter.inner", desc = "Swap previous parameter with the one under cursor" },
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]f"] = { query = "@function.outer", desc = "Goto the beginning of the next function" },
                        ["]c"] = { query = "@class.outer", desc = "Goto the beginning of the next class" },
                        ["]v"] = { query = "@parameter.inner", desc = "Goto the beginning of the next parameter" },
                    },
                    goto_next_end = {
                        ["]F"] = { query = "@function.outer", desc = "Goto the end of the next function" },
                        ["]C"] = { query = "@class.outer", desc = "Goto the end of the next class" },
                        ["]V"] = { query = "@parameter.inner", desc = "Goto the end of the next parameter" },
                    },
                    goto_previous_start = {
                        ["[f"] = { query = "@function.outer", desc = "Goto the beginning of the previous function" },
                        ["[c"] = { query = "@class.outer", desc = "Goto the beginning of the previous class" },
                        ["[v"] = { query = "@parameter.inner", desc = "Goto the beginning of the previous parameter" },
                    },
                    goto_previous_end = {
                        ["[F"] = { query = "@function.outer", desc = "Goto the end of the previous function" },
                        ["[C"] = { query = "@class.outer", desc = "Goto the end of the previous class" },
                        ["[V"] = { query = "@parameter.inner", desc = "Goto the end of the previous parameter" },
                    },
                }
            }
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
