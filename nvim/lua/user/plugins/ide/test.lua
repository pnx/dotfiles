local icons = require('user.icons')

return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter"
    },
    opts = {
        floating = {
            border = "none",
        },
        output = {
            enabled = true,
            open_on_run = true,
        },
        icons = {
            child_indent = icons.tree.vertical,
            child_prefix = icons.tree.node,
            collapsed = icons.tree.horizontal,
            non_collapsible = icons.tree.horizontal,
            expanded = icons.tree.expanded,
            final_child_indent = " ",
            final_child_prefix = icons.tree.nodelast,
            running_animated = { "⠋", "⠙", "⠚", "⠞", "⠖", "⠦", "⠴", "⠲", "⠳", "⠓" },
            passed = icons.test.ok,
            failed = icons.test.failed,
            running = icons.test.running,
            skipped = icons.test.skipped,
            unknown = icons.test.unknown,
            watching = icons.test.watch,
        },
    },
    config = function(_, opts)
        local adapters = {}
        for name, adapter_opts in pairs(opts.adapters or {}) do
            table.insert(adapters, require(name)(adapter_opts))
        end
        opts.adapters = adapters
        require('neotest').setup(opts)
    end
}

