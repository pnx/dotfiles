local icons = require("user.icons")

return {
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
    {
        'kevinhwang91/nvim-ufo',
        dependencies = {
            'kevinhwang91/promise-async',
        },
        opts = {
            fold_virt_text_handler = require("user.utils.ufo").foldtext
        }
    },
    {
        "luukvbaal/statuscol.nvim",
        opts = function()
            local builtin = require("statuscol.builtin")
            return {
                -- Align current relative number to the right.
                relculright = true,
                segments = {
                    {
                        click = "v:lua.ScSa",
                        sign = {
                            namespace = { "gitsigns" },
                            maxwidth = 1,
                            colwidth = 1,
                        }
                    },
                    {
                        click = "v:lua.ScSa",
                        sign = {
                            namespace = { "diagnostic/signs" },
                            maxwidth = 1,
                            colwidth = 3,
                            -- auto = true,
                        }
                    },
                    {
                        text = { builtin.lnumfunc, " " },
                        click = "v:lua.ScLa",
                    },
                    { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
                    { text = { "│ " } },
                }
            }
        end,
    },
    -- File explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        opts = {
            -- hide_root_node = true,
            popup_border_style = 'solid',
            default_component_configs = {
                indent = {
                    with_markers = false,
                    indent_marker = icons.tree.node,
                    last_indent_marker = icons.tree.nodelast,
                    indent_size = 2,
                },
                icon = {
                    folder_closed = icons.folder.closed,
                    folder_open = icons.folder.open,
                    folder_empty = icons.folder.empty,
                    folder_empty_open = icons.folder.empty_open,
                    -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
                    -- then these will never be used.
                    default = icons.files.default,
                },
                modified = {
                    symbol = icons.modified,
                },
                name = {
                    highlight_opened_files = true,
                },
                git_status = {
                    symbols = icons.gitsigns,
                    align = "right",
                },
            },
            sources = {
                "filesystem",
                "buffers",
                "git_status",
                "document_symbols",
            },
            source_selector = {
                winbar = true, -- toggle to show selector on winbar
                show_scrolled_off_parent_node = false,                    -- boolean
                sources = {                                               -- table
                    {
                        source = "filesystem",                                -- string
                        display_name = " 󰉓 Files "                            -- string | nil
                    },
                    {
                        source = "buffers",                                   -- string
                        display_name = " 󰈚 Buffers "                          -- string | nil
                    },
                    {
                        source = "git_status",                                -- string
                        display_name = " 󰊢 Git "                              -- string | nil
                    },
                    {
                        source = "document_symbols",                                -- string
                        display_name = " 󰊢 Docments "                              -- string | nil
                    },
                },
                content_layout = "center",
                separator = { left = "", right= "", override = "active" },
                -- show_separator_on_edge = true,
            },
            window = {
                popup = {
                    size = {
                        height = "100%",
                        width = "100%",
                    },
                    position = "50%",
                    relative = "editor",
                },
            },
            filesystem = {
                follow_current_file = {
                    enabled = true,
                },
                use_libuv_file_watcher = true,
            },
            event_handlers = {
                {
                    event = "neo_tree_buffer_enter",
                    handler = function ()
                        vim.opt_local.statuscolumn = ''
                        vim.opt_local.foldcolumn = "0"
                    end
                },
            },
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    }
}
