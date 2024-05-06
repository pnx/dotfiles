local conf = require("config.plugins.trouble") or {}

return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = conf.keys or {},
    opts = conf.opts or {},
}
