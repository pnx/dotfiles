return {
    "romus204/tree-sitter-manager.nvim",
    dependencies = {
        'windwp/nvim-ts-autotag',
        'nvim-treesitter/nvim-treesitter-textobjects'
    },
    opts_extend = { "ensure_installed", "alias" },
    opts = {
        -- Default parsers.
        ensure_installed = {
            -- VIM stuff
            "vim",
            "vimdoc",
            "query",

            -- Common data formats
            "ini",
            "json",
            "yaml",
            "toml",
            "dtd",
            "xml",
            "kdl",
            "tsv",
            "csv",

            -- git
            "git_rebase",
            "git_config",
            "gitattributes",
            "gitignore",

            -- build systems
            "make",
            "cmake",
            "ninja",

            -- configs
            "xresources",
            "ssh_config",
            "nginx",
            "dockerfile",

            -- misc
            "comment",
            "regex",
            "re2c",
            "sql",
            "printf",
            "javascript",
            "javadoc",
        },
        languages = {
            dotenv = {
                install_info = {
                    url = "https://github.com/pnx/tree-sitter-dotenv",
                    branch = "main",
                    files = { "src/parser.c", "src/scanner.c" }
                }
            }
        },
    },
    config = function(_, opts)
        for k, v in pairs(opts.alias or {}) do
            vim.treesitter.language.register(v, k)
        end
        require("tree-sitter-manager").setup(opts)
    end
}
