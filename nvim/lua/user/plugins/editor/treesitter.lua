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
            "json",
            "yaml",
            "toml",
            "dtd",
            "xml",
            "kdl",

            -- git
            "git_rebase",
            "git_config",
            "gitattributes",
            "gitignore",

            -- misc
            "comment",
            "regex",
            "re2c",
            "xresources",
            "sql",
            "tsv",
            "csv",
            "ssh_config",
            "printf",
            "nginx",
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
