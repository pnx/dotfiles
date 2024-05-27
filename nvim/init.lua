local setup = require('setup')

-- config
require("config.options")
require("config.filetypes")
setup.keymaps('config.keymaps')
require('config.autocmd')

-- plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup('plugins', {
    dev = {
        path = "~/code/nvim_plugins",
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "netrwPlugin",
                -- "tutor"
            }
        }
    }
})
