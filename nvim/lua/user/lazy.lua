
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "user.plugins.core" },
        { import = "user.plugins.ui" },
        { import = "user.plugins.editor" },
        { import = "user.plugins.lsp" },

        -- Language specific
        { import = "user.plugins.lang.lua" },
        { import = "user.plugins.lang.bash" },
        { import = "user.plugins.lang.clangd" },
        { import = "user.plugins.lang.go" },
        { import = "user.plugins.lang.rust" },
        { import = "user.plugins.lang.php" },
        { import = "user.plugins.lang.css" },
        { import = "user.plugins.lang.typescript" },
        { import = "user.plugins.lang.vue" },
    },
    pkg = {
        sources = {
            "lazy",
            -- "rockspec",
            -- "packspec",
        },
    },
    dev = {
        path = "~/code/nvim_plugins",
    },
    checker = {
        enabled = false
    },
    change_detection = {
        enabled = false,
        notify = false
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        }
    }
})
