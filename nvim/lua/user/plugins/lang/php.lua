local lspservers = {
    --- @type LSPServerOptions
    phpactor = {
        inlay_hints = {
            enabled = false
        },
        codelens = {
            enabled = false
        },
        document_highlight = {
            enabled = false
        },
        diagnostics = false,
        hover = false,
        definition = false,
        init_options = {
            -- Only interested in code actions. Disable everything else!
            ["completion_worse.completor.doctrine_annotation.enabled"] = false,
            ["completion_worse.completor.imported_names.enabled"] = false,
            ["completion_worse.completor.worse_parameter.enabled"] = false,
            ["completion_worse.completor.named_parameter.enabled"] = false,
            ["completion_worse.completor.constructor.enabled"] = false,
            ["completion_worse.completor.class_member.enabled"] = false,
            ["completion_worse.completor.scf_class.enabled"] = false,
            ["completion_worse.completor.local_variable.enabled"] = false,
            ["completion_worse.completor.subscript.enabled"] = false,
            ["completion_worse.completor.declared_function.enabled"] = false,
            ["completion_worse.completor.declared_constant.enabled"] = false,
            ["completion_worse.completor.declared_class.enabled"] = false,
            ["completion_worse.completor.expression_name_search.enabled"] = false,
            ["completion_worse.completor.use.enabled"] = false,
            ["completion_worse.completor.class_like.enabled"] = false,
            ["completion_worse.completor.type.enabled"] = false,
            ["completion_worse.completor.keyword.enabled"] = false,
            ["completion_worse.completor.docblock.enabled"] = false,
            ["completion_worse.completor.attribute.enabled"] = false,
            ["completion_worse.completor.constant.enabled"] = false,
            ["completion_worse.snippets"] = false,
            ["completion.limit"] = 0,
            ["language_server.diagnostics_on_open"] = false,
            ["language_server.diagnostics_on_save"] = false,
            ["language_server.diagnostics_on_update"] = false,
            ["language_server_worse_reflection.diagnostics.enable"] = false,
            ["language_server_worse_reflection.inlay_hints.enable"] = false,
            ["language_server_php_cs_fixer.enabled"] = false,
            ["language_server_phpstan.enabled"] = false,
            ["language_server_psalm.enabled"] = false,
            ["code_transform.refactor.generate_accessor.prefix"] = "get",
            ["code_transform.refactor.generate_accessor.upper_case_first"] = true,
            ["code_transform.refactor.generate_mutator.prefix"] = "set",
            ["code_transform.refactor.generate_mutator.upper_case_first"] = true,
            ["code_transform.refactor.generate_mutator.fluent"] = true,
        }
    },
    -- Use intelephense for as main server.
    intelephense = {}
}

return {
    -- Include HTML because you prob always write some html with php :)
    { import = "user.plugins.lang.html" },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "php", "php_only", "phpdoc", "blade" }
        }
    },
    {
        "windwp/nvim-ts-autotag",
        optional = true,
        opts = {
            filetypes = {
                'php',
                'blade',
            }
        }
    },
    -- Formatting
    {
        'stevearc/conform.nvim',
        optional = true,
        opts = {
            formatters_by_ft = {
                blade = { 'blade-formatter' },
            }
        }
    },
    -- Linting
    {
        'mfussenegger/nvim-lint',
        optional = true,
        opts = {
            linters_by_ft = {
                php = { 'phpstan' },
            },
        },
    },
    -- LSP
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = lspservers
        },
    },
    -- Testing
    {
        "nvim-neotest/neotest",
        optional = true,
        ft = { "php" },
        dependencies = {
            "olimorris/neotest-phpunit",
            'V13Axel/neotest-pest',
        },
        opts = {
            adapters = {
                ["neotest-phpunit"] = {},
                ["neotest-pest"] = {},
            }
        },
    },
    {
        "adalessa/laravel.nvim",
        version = "v2.2.2",
        dependencies = {
            "tpope/vim-dotenv",
            "MunifTanjim/nui.nvim",
            "nvimtools/none-ls.nvim",
        },
        ft = { "php" },
        cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
        opts = {
            features = {
                null_ls = {
                    enable = true,
                },
                route_info = {
                    enable = true,
                    position = 'right',
                    middlewares = true,
                    method = true,
                    uri = true
                },
            },
        },
    }
}
