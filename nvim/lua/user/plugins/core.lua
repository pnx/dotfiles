return {
    { import = "user.plugins.core.colorscheme" },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = "Mason",
        opts_extend = { "ensure_installed" },
        opts = {},
        config = function(_, opts)
            require("mason").setup(opts)
        end
    },
    -- Dashboard
    {
        "goolord/alpha-nvim",
        config = function()
            local icons = require'user.icons'
            local alpha = require'alpha'
            local dashboard = require'alpha.themes.dashboard'

            dashboard.section.header.val = {
                [[                               __                ]],
                [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
                [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
                [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
                [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
                [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
            }

            dashboard.section.buttons.val = {
                dashboard.button("e", icons.files.text .. "  New file" , ":ene <BAR> startinsert<CR>"),
                dashboard.button("s", icons.search .. "  Search files" , ":Telescope find_files<CR>"),
                dashboard.button("o", icons.search .. "  Old files" , ":Telescope oldfiles<CR>"),
                dashboard.button("q", icons.close .. "  Quit" , ":qa<CR>"),
            }

            alpha.setup(dashboard.config)
        end,
    },
    -- Icons
    {
        'nvim-tree/nvim-web-devicons',
        opts = {
            override = {
                php = {
                    icon = "󰌟",
                    color = "#4F5B93",
                    name = "Php"
                }
            },
            override_by_filename = {
                ["artisan"] = {
                    icon = "",
                    color = "#f05340",
                    name = "LaravelArtisan"
                },
                ["phpunit.xml"] = {
                    icon = "󰙨",
                    color = "#0d6efd",
                    name = "PhpUnit"
                }
            }
        }
    }
}
