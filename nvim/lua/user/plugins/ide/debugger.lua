return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            {
                "rcarriga/nvim-dap-ui",
                dependencies = {
                    "nvim-neotest/nvim-nio"
                }
            }
        },
        config = function ()
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

            vim.keymap.set("n", "<leader>Dr", dap.run_last, { silent = true })
            vim.keymap.set("n", "<leader>Dc", dap.continue, { silent = true })
            vim.keymap.set("n", "<leader>Do", dap.step_over, { silent = true })
            vim.keymap.set("n", "<leader>Di", dap.step_into, { silent = true })
            vim.keymap.set("n", "<leader>Db", dap.step_out, { silent = true })
            vim.keymap.set("n", "<leader>Dt", dap.toggle_breakpoint, { silent = true })

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

            dap.adapters.php = {
                type = 'executable',
                command = 'node',
                args = { '/home/pnx/vscode-php-debug/out/phpDebug.js' }
            }

            dap.configurations.php = {
                {
                    name = "PHP: Listen for Xdebug",
                    port = 9003,
                    request = "launch",
                    type = "php",
                    breakpoints = {
                        exception = {
                            Notice = false,
                            Warning = false,
                            Error = false,
                            Exception = false,
                            ["*"] = false,
                        },
                    },
                    pathMappings = {
                        ["/app"] = "${workspaceFolder}"
                    }
                },
            }
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        }
    }
}
