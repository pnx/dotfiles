return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    dependencies = {
        -- "nvim-treesitter/nvim-treesitter-textobjects",
        {
            "windwp/nvim-ts-autotag",
            opts = {
                -- Filetypes to enable autotag for
                filetypes = {
                    'html',
                    'javascript',
                    'typescript',
                    'javascriptreact',
                    'typescriptreact',
                    'svelte',
                    'vue',
                    'tsx',
                    'jsx',
                    'rescript',
                    'xml',
                    'php',
                    'blade',
                    'markdown',
                },
            },
        },
    },
    opts = {
        -- A list of parser names
        ensure_installed = {
            "bash",
            "c",
            "cpp",
            "ninja",
            "cmake",
            "dockerfile",
            "make",
            "vim",
            "vimdoc",
            "query",
            "javascript",
            -- "typescript",
            "css",
            "scss",
            -- "html",
            -- "vue",
            "json",
            "jsonc",
            "yaml",
            "toml",
            "xml",
            "glsl",
            "hlsl",
            "markdown",
            "markdown_inline",
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
                generate_requires_npm = true,
                requires_generate_from_grammar = true,
            },
            filetype = "blade",
        }

        require("nvim-treesitter.configs").setup(opts)
    end,
}