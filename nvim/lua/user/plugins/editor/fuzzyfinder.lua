local icons = require("user.icons")

local border = {
    prompt = { " " },
    results = { " " },
    preview = { " " },
}

local dropdown_opts = {
    previewer = false,
    prompt_title = false,
    layout_strategy = "horizontal",
    layout_config = {
        prompt_position = "top",
    },
    borderchars = border,
}

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-ui-select.nvim",
        "sharkdp/fd",
    },
    cmd = "Telescope",
    opts = function()
        local utils = require("user.utils.telescope")
        local actions = require("telescope.actions")
        return {
            defaults = {
                path_display = { truncate = 1 },
                prompt_prefix = " ",
                selection_caret = icons.current .. " ",
                multi_icon = icons.selected .. " ",
                file_ignore_patterns = {
                    ".git",
                    "node_modules",
                },
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                    },
                },
                borderchars = border,
                preview = {
                    filesize_limit = 0.1
                },
                layout_config = {
                    horizontal = {
                        preview_cutoff = 200,
                    }
                }
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                buffers = vim.tbl_deep_extend("force", dropdown_opts, {
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
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(dropdown_opts),
                },
            }
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
