local config = require('config.plugins.conform')

return {
	'stevearc/conform.nvim',
	dependencies = {
		"williamboman/mason.nvim",
		"zapling/mason-conform.nvim"
	},
	cmd = { "ConformInfo", "Format" },
	keys = config.keys or {},
	opts = config.opts or {},
	config = function (_, opts)

		-- Create command to format a buffer or range.
		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end

			local opt = opts.format_options
			if range ~= nil then
				opt = vim.tbl_deep_extend("force", opt, { range = range })
			end

			require("conform").format(opt)
		end, { range = true })

		require('conform').setup(opts)

		-- setup mason-conform to autmagically install formatters.
		require('mason-conform').setup()
	end
}
