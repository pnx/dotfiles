local ui = require("user.ui.telescope")
local icons = require('user.icons')

return {
    { import = "user.plugins.ui.dashboard" },

    { import = "user.plugins.ui.editor" },

    { import = "user.plugins.ui.colorscheme" },
    { import = "user.plugins.ui.statusline" },
    { import = "user.plugins.ui.statuscolumn" },
    { import = "user.plugins.ui.gitsigns" },
    -- File explorer
    -- { import = "user.plugins.ui.neotree" },
    { import = "user.plugins.ui.nvimtree" },

    { "folke/which-key.nvim", event = "VeryLazy" },

    -- Icons
    {
        'nvim-tree/nvim-web-devicons',
        opts = {
            override = {
                php = {
                    icon = icons.filetypes.php,
                    color = "#4F5B93",
                    name = "Php"
                }
            },
            override_by_filename = {
                ["artisan"] = {
                    icon = icons.filetypes.laravel,
                    color = "#f05340",
                    name = "LaravelArtisan"
                },
                ["phpunit.xml"] = {
                    icon = icons.filetypes.phpunit,
                    color = "#0d6efd",
                    name = "PhpUnit"
                }
            }
        }
    },
    {
        'stevearc/dressing.nvim',
        opts = {
            input = {
                border = { " " },
                relative = "editor",
                title_pos = "center",
                mappings = {
                    n = {
                        ["<Esc>"] = "Close",
                        ["<CR>"] = "Confirm",
                    },
                    i = {
                        ["<Esc>"] = "Close",
                        ["<CR>"] = "Confirm",
                        ["<Up>"] = "HistoryPrev",
                        ["<Down>"] = "HistoryNext",
                    },
                },
            },
            select = {
                backend = { "telescope" },
                telescope = require("telescope.themes").get_dropdown(ui.dropdown),
            }
        },
    },
    -- Nicer notifications
    {
        "j-hui/fidget.nvim",
        opts = {
            notification = {
                window = {
                    normal_hl = "Pmenu",
                    winblend = 5,
                    border = { " " }
                }
            },
            progress = {
                display = {
                    done_ttl = 2,
                }
            }
        }
    },
}
