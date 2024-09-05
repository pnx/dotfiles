return {
    { import = "user.plugins.core.colorscheme" },
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
                },
                -- ["composer.json"] = {
                --     icon = "",
                --     color = "#9e9e9e",
                --     name = "Composer"
                -- }
            };
        }
    },
}
