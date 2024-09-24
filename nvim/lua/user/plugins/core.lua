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
