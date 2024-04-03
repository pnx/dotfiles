return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"folke/which-key.nvim",
			-- optional = true,
			opts = {
				defaults = {
					["<leader>D"] = { name = "+debug" },
				},
			},
		},
		{
			"rcarriga/nvim-dap-ui",
			-- stylua: ignore
			keys = {
				{ "<leader>Du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
				{ "<leader>De", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
			},
			opts = {},
			config = function(_, opts)
				-- setup dap config by VsCode launch.json file
				-- require("dap.ext.vscode").load_launchjs()
				local dap = require("dap")
				local dapui = require("dapui")
				dapui.setup(opts)
				dap.listeners.after.event_initialized["dapui_config"] = function()
					dapui.open({})
				end
				dap.listeners.before.event_terminated["dapui_config"] = function()
					dapui.close({})
				end
				dap.listeners.before.event_exited["dapui_config"] = function()
					dapui.close({})
				end
			end,
		},
	},
	keys = {
		{ "<leader>Dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
		{ "<leader>Db", function() require'dap'.toggle_breakpoint() end, desc = "Toggle breakpoint" },
	},
	config = function()
		vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

		local dap = require "dap"
		dap.adapters.delve = {
			type = 'server',
			port = '${port}',
			executable = {
				command = 'dlv',
				args = {'dap', '-l', '127.0.0.1:${port}'},
			}
		}

		dap.configurations.go = {
			{
				type = "delve",
				name = "Debug",
				request = "launch",
				program = "${file}"
			},
			{
				type = "delve",
				name = "Debug test", -- configuration for debugging test files
				request = "launch",
				mode = "test",
				program = "${file}"
			},
			-- works with go.mod packages and sub packages 
			{
				type = "delve",
				name = "Debug test (go.mod)",
				request = "launch",
				mode = "test",
				program = "./${relativeFileDirname}"
			}
		}
		-- local Config = require("lazyvim.config")


		-- for name, sign in pairs(Config.icons.dap) do
		-- 	sign = type(sign) == "table" and sign or { sign }
		-- 	vim.fn.sign_define(
		-- 		"Dap" .. name,
		-- 		{ text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
		-- 	)
		-- end
	end,
}
