local icons = require('user.icons')

local options = {
    hijack_cursor = true,
    select_prompts = true,
    update_focused_file = {
        enable = true,
    },
    view = {
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        width = 40,
    },
    filters = {
        dotfiles = true,
        exclude = {
            ".env",
        }
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = icons.diagnostics.hint,
            info = icons.diagnostics.info,
            warning = icons.diagnostics.warn,
            error = icons.diagnostics.error
        }
    },
    modified = {
        enable = true,
    },
    renderer = {
        root_folder_label = ":t",
        hidden_display = "simple",
        highlight_opened_files = "name",
        highlight_hidden = "name",
        -- special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "composer.json" },
        special_files = {},
        icons = {
            git_placement = "right_align",
            diagnostics_placement = "right_align",
            modified_placement = "right_align",
            show = {
                folder_arrow = false
            },
            glyphs = {
                default = icons.files.default,
                symlink = icons.files.symlink,
                bookmark = icons.file_status.bookmarked,
                modified = icons.file_status.modified,
                hidden = icons.file_status.hidden,
                folder = {
                    arrow_closed = icons.folder.arrow_closed,
                    arrow_open = icons.folder.arrow_open,
                    default = icons.folder.closed,
                    open = icons.folder.open,
                    empty = icons.folder.empty,
                    empty_open = icons.folder.empty_open,
                    symlink = icons.folder.symlink,
                    symlink_open = icons.folder.symlink_open,
                },
                git = {
                    unstaged = icons.gitsigns.unstaged,
                    staged = icons.gitsigns.staged,
                    unmerged = icons.gitsigns.unmerged,
                    renamed = icons.gitsigns.renamed,
                    untracked = icons.gitsigns.untracked,
                    deleted = icons.gitsigns.deleted,
                    ignored = icons.gitsigns.ignored,
                },
            },
        },
        indent_markers = {
            enable = false,
            inline_arrows = false,
            icons = {
                corner = icons.tree.nodelast,
                edge = icons.tree.vertical,
                item = icons.tree.node,
                bottom = icons.tree.horizontal,
            },
        }
    },
    actions = {
        change_dir = {
            enable = true,
            global = true,
            restrict_above_cwd = true,
        },
    }
}

return {
    'nvim-tree/nvim-tree.lua',
    opts = options,
    config = function (_, opts)
        require('nvim-tree').setup(opts)

        local augroup = vim.api.nvim_create_augroup("nvim-tree", {})

        vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
            group = augroup,
            pattern = "*",
            callback = function(args)
                if vim.bo[args.buf].filetype == 'NvimTree' then
                    vim.opt_local.fillchars:append("vert:▕")
                    vim.opt_local.statuscolumn = ''
                end
            end
        })
    end
}
