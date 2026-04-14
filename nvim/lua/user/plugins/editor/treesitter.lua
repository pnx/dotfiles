return {
    "nvim-treesitter/nvim-treesitter",
    commit = "4916d6592ede8c07973490d9322f187e07dfefac",
    pin = true,
    dependencies = {
        'windwp/nvim-ts-autotag',
        'nvim-treesitter/nvim-treesitter-textobjects'
    },
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    opts_extend = { "install" },
    opts = {
        -- Default parsers.
        install = {
            -- VIM stuff
            "vim",
            "vimdoc",
            "query",

            -- Common config languages
            "json",
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
    },
    config = function(_, opts)
        local ts = require("nvim-treesitter")
        vim.api.nvim_create_autocmd('User', { pattern = 'TSUpdate', callback = function ()
            require("nvim-treesitter.parsers").dotenv = {
                install_info = {
                    url = "https://github.com/pnx/tree-sitter-dotenv",
                    branch = "main",
                    files = { "src/parser.c", "src/scanner.c" },
                }
            }
        end})

        -- vim.filetype.add({
        --     pattern = {
        --         ['%.env'] = 'dotenv',
        --         ['%.env%..+'] = 'dotenv',
        --     }
        -- })
        vim.treesitter.language.register('dotenv', { 'env' })

        for _, value in pairs(opts.install) do
            vim.treesitter.language.register(value, value)
        end

        vim.api.nvim_create_autocmd('FileType', {
            callback = function(ev)
                local lang = vim.treesitter.language.get_lang(ev.match)
                if vim.list_contains(ts.get_installed(), lang) then
                    vim.treesitter.start(ev.buf)
                end
                -- local all_langs = vim.treesitter.language._complete()
                -- local lang = vim.treesitter.language.get_lang(ev.match)
                -- vim.print(ev.match, all_langs, vim.tbl_contains(all_langs, lang))
                -- if vim.tbl_contains(all_langs, lang) then
                --     vim.treesitter.start(ev.buf)
                -- end
            end,
        })

        ts.install(opts.install)
        ts.setup(opts)
    end
}
