return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
        },
        opts = {},
        config = function (_, opts)
            local icons = require('user.icons')
            local dap = require('dap')
            local dapui = require("dapui")

            dap.set_log_level('TRACE')
            dapui.setup()

            -- Signs
            vim.fn.sign_define('DapBreakpoint', {text=icons.debug.breakpoint, texthl='DapBreakpoint'})
            vim.fn.sign_define('DapBreakpointCondition', {text=icons.debug.breakpointCondition, texthl='DapBreakpointCondition'})
            vim.fn.sign_define('DapBreakpointRejected', {text=icons.debug.rejected, texthl='DapBreakpointRejected'})
            vim.fn.sign_define('DapLogPoint', {text=icons.debug.logPoint, texthl='DapLogPoint'})
            vim.fn.sign_define('DapStopped', {text=icons.debug.stopped, texthl='DapStopped'})

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            for name, config in pairs(opts) do
                dap.adapters[name] = config.adapter or {}
                dap.configurations[name] = config.configurations or {}
            end
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        optional = true,
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        }
    }
}
