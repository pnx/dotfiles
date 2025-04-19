local icons = require("user.icons")
local ui = require("user.ui.telescope")

return {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "sharkdp/fd",
    },
    cmd = "Telescope",
    opts = function()
        local utils = require("user.utils.telescope")
        local actions = require("telescope.actions")
        return {
            defaults = {
                path_display = { "filename_first", truncate = 1 },
                prompt_prefix = " ",
                selection_caret = icons.current .. " ",
                multi_icon = icons.selected .. " ",
                file_ignore_patterns = {
                    ".git/",
                    "node_modules/",
                },
                mappings = {
                    i = {
                        ['<C-p>'] = require('telescope.actions.layout').cycle_layout_next,
                        ["<esc>"] = actions.close,
                    },
                },
                borderchars = ui.border,
                preview = {
                    enabled = false,
                    filesize_limit = 0.1
                },
                layout_strategy = "vertical",
                cycle_layout_list = { "horizontal", "vertical" },
                layout_config = {
                    vertical = {
                        width = utils.width(0.5, { min = 80, max = 100, padding = 10}),
                        height = utils.height(0.6, { min = 15, max = 50, padding = 2}),
                        preview_height = 0.0
                    },
                    horizontal = {
                        width = utils.width(0.95, { min = 80, max = 180, padding = 10 }),
                        height = utils.height(0.95, { min = 15, max = 34, padding = 2 }),
                        preview_width = 0.5,
                    }
                }
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                buffers = vim.tbl_deep_extend("force", ui.dropdown, {
                    theme = "dropdown",
                    mappings = {
                        i = {
                            ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
                        },
                    },
                    sort_mru = true, -- sort by most recent used.
                    ignore_current_buffer = true, -- Don't show current buffer in results.
                    entry_maker = utils.buffer_view({
                        indicators = {
                            modified = {
                                icon = icons.file_status.modified,
                            },
                            readonly = {
                                icon = icons.file_status.readonly,
                            },
                            hidden = {
                                icon = icons.file_status.hidden,
                            }
                        }
                    })
                }),
            },
        }
    end,
    config = function(_, opts)
        local telescope = require("telescope")

        telescope.setup(opts)
        for name, _ in pairs(opts.extensions or {}) do
            telescope.load_extension(name)
        end
    end,
}
