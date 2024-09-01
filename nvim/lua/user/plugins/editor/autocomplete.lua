return {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer", -- autocomplete from buffer
        "hrsh7th/cmp-path", -- autocomplete from filesystem
        "f3fora/cmp-spell",
    },
    opts = function()
        local cmp = require("cmp")
        local utils = require("user.utils.cmp")
        local format = require("user.utils.cmp_format")
        -- local lspkind = require("user.utils.lspkind")
        local icons = require("user.icons")

        local selectPrev = utils.selectPrev({ behavior = cmp.SelectBehavior.Insert })
        local selectNext = utils.selectNext({ behavior = cmp.SelectBehavior.Insert })

        return {
            preselect = false,
            completion = {
                completeopt = "menu,menuone,longest,popup",
            },
            view = {
                entries = { name = "custom", selection_order = "near_cursor" },
            },
            window = {
                documentation = {
                    border = { "", "", "", "", "", "", "", " " },
                },
                completion = {
                    scrolloff = 4,
                },
            },
            mapping = {
                ["<Up>"] = selectPrev,
                ["<S-Tab>"] = selectPrev,
                ["<Down>"] = selectNext,
                ["<Tab>"] = selectNext,
                ["<C-c>"] = cmp.mapping.abort(),
                ["<CR>"] = utils.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
            },
            -- snippet = {
            -- 	expand = function(args)
            -- 		require("luasnip").lsp_expand(args.body)
            -- 	end,
            -- },
            formatting = {
                fields = { "abbr", "kind", "menu" },
                format = format({
                    symbol_map = icons.symbols,
                    widths = {
                        menu = 0,
                    }
                }),
            },
            sources = {
                { name = "nvim_lsp" },
                { name = 'nvim_lsp_signature_help' },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
                {
                    name = "spell",
                    keyword_length = 3,
                    option = {
                        keep_all_entries = false,
                        enable_in_context = function()
                            return require('cmp.config.context').in_treesitter_capture('spell')
                        end,
                        preselect_correct_word = true,
                    },
                },
            },
            -- experimental = {
            -- 	ghost_text = {
            -- 		hl_group = "NonText",
            -- 	},
            -- },
        }
    end,
    config = function(_, opts)
        local cmp = require("cmp")
        cmp.setup(opts)

        -- insert () on function completion using autopairs
        local has_autopair, autopair = pcall(require, "nvim-autopairs.completion.cmp")
        if has_autopair then
            cmp.event:on("confirm_done", autopair.on_confirm_done())
        end
    end,
}
