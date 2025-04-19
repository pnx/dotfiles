local icons = require("user.icons")

local options = {
    -- weird bug
    -- hide_root_node = true,
    popup_border_style = 'solid',
    default_component_configs = {
        indent = {
            with_markers = true,
            indent_marker = icons.tree.vertical,
            last_indent_marker = icons.tree.nodelast,
            indent_size = 2,
        },
        icon = {
            folder_closed = icons.folder.closed,
            folder_open = icons.folder.open,
            folder_empty = icons.folder.empty,
            folder_empty_open = icons.folder.empty_open,
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
        -- "buffers",
        -- "git_status",
        -- "document_symbols",
    },
    source_selector = {
        winbar = true, -- toggle to show selector on winbar
        show_scrolled_off_parent_node = false,                    -- boolean
        sources = {                                               -- table
            {
                source = "filesystem",
                display_name = " 󰉓 Files "
            },
            {
                source = "buffers",
                display_name =  "  Buffers "
            },
            {
                source = "git_status",
                display_name = " 󰊢 Git "
            },
            {
                source = "document_symbols",
                display_name = "  Document Symbols "
            },
        },
        content_layout = "center",
        separator = { left = "", right= "" },
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
        mappings = {
            ["<space>"] = "noop",
        }
    },
    filesystem = {
        follow_current_file = {
            enabled = true,
        },
        use_libuv_file_watcher = true,
        window = {
            mappings = {
                ["."] = "noop", -- unbind set_root. I never use it but always hit the key :P
                ["~"] = "toggle_hidden",
            }
        },
    },
    buffers = {
        window = {
            mappings = {
                ["."] = "noop",
            }
        }
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
}

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    opts = options
}

