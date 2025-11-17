
return {
    "nvim-neotest/neotest",
    optional = true,
    ft = { "php" },
    dependencies = {
        "pnx/neotest-phpunit",
        'V13Axel/neotest-pest',
    },
    opts = {
        adapters = {
            ["neotest-phpunit"] = {},
            ["neotest-pest"] = {},
        }
    },
}
