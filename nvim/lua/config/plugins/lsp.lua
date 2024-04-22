return {
    mappings = {
        ["<leader>rs"] = { vim.lsp.buf.rename, { desc = "Rename symbol" } },
        ["<leader>ca"] = { vim.lsp.buf.code_action, { desc = "Code action" } },
        ["<leader>ff"] = { vim.lsp.buf.format, { desc = "Format file" } },
        K = { vim.lsp.buf.hover, { desc = "Hover" } },
        gd = { vim.lsp.buf.definition, { desc = "Goto definition" } },
        gi = { vim.lsp.buf.implementation, { desc = "Goto implementation" } },
        gr = { vim.lsp.buf.references, { desc = "Goto references" } },
    },
    servers = {
        -- PHP
        phpactor = {
            settings = {
                init_options = {
                    ["language_server_phpstan.enabled"] = true,
                    ["language_server_psalm.enabled"] = false,
                }
            }
        },
        --
        --
        -- JS,TS,VUE
        volar = {
            filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
        },
        -- TailwindCSS
        tailwindcss = {},
        -- GO
        gopls = {
            -- format_on_save = true,
            on_save = function()
                local params = vim.lsp.util.make_range_params()
                params.context = { only = { "source.organizeImports" } }
                local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
                for cid, res in pairs(result or {}) do
                    for _, r in pairs(res.result or {}) do
                        if r.edit then
                            local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                            vim.lsp.util.apply_workspace_edit(r.edit, enc)
                        end
                    end
                end
                vim.lsp.buf.format({ async = false })
            end,
            settings = {
                gopls = {
                    analyses = {
                        unusedvariable = true,
                        unusedwrite = true,
                        useany = true
                    },
                    gofumpt = true,
                },
            },
        },
        -- Lua
        lua_ls = {
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT'
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                        }
                    }
                },
            },
        },
    },
}
