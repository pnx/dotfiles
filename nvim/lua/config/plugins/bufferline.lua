local icons = require('config.icons')

return function()
    local highlightfunc = require("catppuccin.groups.integrations.bufferline")
    return {
        highlights = highlightfunc.get(),
        options = {
            mode = "buffers",
            themable = true,
            buffer_close_icon = icons.close,
            close_icon = icons.close,
            modified_icon = icons.modified,
            diagnostics = false,
            enforce_regular_tabs = true,
            indicator = {
                icon = "",
            },
            close_command = function(bufnum)
                vim.cmd("bprev")
                vim.api.nvim_buf_delete(bufnum, {})
            end,
            hover = {
                enabled = true,
                delay = 200,
                reveal = { 'close' }
            },
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "File Explorer",
                    text_align = "left"
                }
            },
            custom_areas = {
                left = function()
                    return {
                        {
                            text = "    ",
                            fg = "#8fff6d",
                        }
                    }
                end
            }
        }
    }
end
