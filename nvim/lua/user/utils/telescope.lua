
local M = {}

function M.all_files() require("telescope.builtin").find_files({no_ignore=true, prompt_title = "Find All Files"}) end
function M.find_in_current_dir() require("telescope.builtin").find_files({ cwd = vim.fn.expand('%:p:h') }) end
function M.find_workspace_symbols() require("telescope.builtin").lsp_dynamic_workspace_symbols({
    entry_maker = M.lsp_symbol_entry_maker()
}) end
function M.find_classes() require("telescope.builtin").lsp_dynamic_workspace_symbols({
    symbols = "class",
    prompt_title = "Search Classes",
    entry_maker = M.lsp_symbol_entry_maker()
}) end
function M.find_functions() require("telescope.builtin").lsp_dynamic_workspace_symbols({
    query = "",
    symbols = "function",
    prompt_title = "Search Functions",
    entry_maker = M.lsp_symbol_entry_maker(),
}) end

function M.lsp_symbol_entry_maker(opts)
    local symbol_icons = require("user.icons").symbols
    local entry_display = require("telescope.pickers.entry_display")
    local make_entry = require("telescope.make_entry")

    local displayer = entry_display.create {
        separator = " ",
        items = {
            { width = 1 },
            { remaining = true },
            { remaining = true },
        },
    }

    local make_display = function (entry)
        return displayer {
            { entry.icon or "?", "TelescopeResults" .. entry.symbol_type },
            entry.symbol_name,
            { entry.filename, "TelescopeResultsComment" },
        }
    end

    return function(entry)
        local filename = vim.fn.fnamemodify(entry.filename, ":.")
        local symbol_msg = entry.text
        local symbol_type, symbol_name = symbol_msg:match "%[(.+)%]%s+(.*)"
        local ordinal = symbol_name .. filename
        local icon = symbol_icons[symbol_type] or symbol_icons["Unknown"]
        return make_entry.set_default_entry_mt({
            value = entry,
            ordinal = ordinal,
            display = make_display,
            filename = filename,
            lnum = entry.lnum,
            col = entry.col,
            symbol_name = symbol_name,
            symbol_type = symbol_type,
            icon = icon,
            icon_hl = 'DiffDelete',
            start = entry.start,
            finish = entry.finish,
        }, opts)
    end
end

function M.buffer_view(opts)
    local devicons = require("nvim-web-devicons")
    local entry_display = require("telescope.pickers.entry_display")

    local defaults = {
        indicators = {
            modified = {
                icon = "+",
                higroup = "TelescopeIndicatorModified",
            },
            readonly = {
                icon = "=",
                higroup = "TelescopeIndicatorReadonly",
            },
            hidden = {
                icon = "h",
                higroup = "TelescopeIndicatorHidden",
            }
        }
    }

    opts = vim.tbl_deep_extend('force', defaults, opts)
    local default_icons, _ = devicons.get_icon("file", "", {default = true})

    -- local bufnrs = filter(function(b)
    --     return 1 == vim.fn.buflisted(b)
    -- end, vim.api.nvim_list_bufs())
    --
    -- local max_bufnr = math.max(unpack(bufnrs))
    -- local bufnr_width = #tostring(max_bufnr)

    local displayer = entry_display.create {
        separator = "",
        items = {
            -- { width = bufnr_width },
            { width = 2 },
            { width = 2 },
            -- { width = 2 },
            { width = vim.fn.strwidth(default_icons) + 1 },
            { remaining = true },
        },
    }

    local make_display = function(entry)
        return displayer {
            -- {entry.bufnr, "TelescopeResultsNumber"},
            {entry.indicator.readonly.icon, entry.indicator.readonly.highlight},
            {entry.indicator.changed.icon, entry.indicator.changed.highlight},
            -- {entry.indicator.hidden.icon, entry.indicator.hidden.highlight},
            {entry.file_icon, entry.file_highlight},
            entry.file_name,
        }
    end

    return function(entry)
        local bufname = entry.info.name ~= "" and entry.info.name or "[No Name]"
        local file_name = vim.fn.fnamemodify(bufname, ":.")
        local file_icon, file_highlight = devicons.get_icon(bufname, string.match(bufname, "%a+$"), { default = true })

        return {
            valid = true,

            value = bufname,
            ordinal = entry.bufnr .. " : " .. bufname,
            display = make_display,

            bufnr = entry.bufnr,

            lnum = entry.info.lnum ~= 0 and entry.info.lnum or 1,
            indicator = {
                -- hidden = {
                --     icon = entry.info.hidden == 1 and opts.indicators.hidden.icon or " ",
                --     highlight = opts.indicators.hidden.higroup
                -- },
                changed = {
                    icon = entry.info.changed == 1 and opts.indicators.modified.icon or " ",
                    highlight = opts.indicators.modified.higroup
                },
                readonly = {
                    icon = vim.api.nvim_get_option_value("readonly", {buf = entry.bufnr}) and opts.indicators.readonly.icon or " ",
                    highlight = opts.indicators.readonly.higroup
                }
            },
            file_icon = file_icon,
            file_highlight = file_highlight,

            file_name = file_name,
        }
    end
end

return M
