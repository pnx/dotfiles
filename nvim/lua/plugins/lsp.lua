return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',

        -- completion
        {
            'hrsh7th/nvim-cmp',
            version = false,
            event = "InsertEnter",
            dependencies = {
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-nvim-lsp',
                'L3MON4D3/LuaSnip',
                'onsails/lspkind-nvim',
            },
            opts = require('config.cmp'),
            config = function(_, opts)
                local cmp = require('cmp')
                cmp.setup(opts)

                -- insert () on function completion using autopairs
                cmp.event:on(
                    'confirm_done',
                    require('nvim-autopairs.completion.cmp').on_confirm_done()
                )
            end
        },
    },
    opts = require('config.lsp'),
    config = function(_, opts)
        local lsp_zero = require('lsp-zero')
        local lsp_config = require('lspconfig')
        local augroup = vim.api.nvim_create_augroup("Lsp", {})
        local map = require('utils.keys')

        lsp_zero.on_attach(function(_, bufnr)
            for _, v in ipairs(require('config.keymaps').lsp or {}) do
                map(v, { buffer = bufnr })
            end
        end)

        for name, server_opt in pairs(opts.servers) do
            local on_attach = function(_, bufnr)
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

                if server_opt.on_save then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = server_opt.on_save,
                    })
                end
            end

            server_opt = vim.tbl_deep_extend("force", {on_attach = on_attach}, server_opt or {})
                
            lsp_config[name].setup(server_opt)
        end
    end,
}
