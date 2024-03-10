
local logo = [[
	:::::::::  ::::    ::: :::    :::
	:+:    :+: :+:+:   :+: :+:    :+:
	+:+    +:+ :+:+:+  +:+  +:+  +:+ 
	+#++:++#+  +#+ +:+ +#+   +#++:+  
	+#+        +#+  +#+#+#  +#+  +#+ 
	#+#        #+#   #+#+# #+#    #+#
	###        ###    #### ###    ###
]]

logo = string.rep("\n", 8) .. logo .. "\n\n"

return {
	'nvimdev/dashboard-nvim',
	name = 'dashboard',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	event = 'VimEnter',
	opts = {
		theme = 'doom',
		config = {
			header = vim.split(logo, "\n"),

			center = {
				{ action = function() require('telescope.builtin').find_files() end,	desc = " Find file",       icon = " ", key = "f" },
				{ action = "ene | startinsert",											desc = " New file",        icon = " ", key = "n" },
				{ action = function() require('telescope.builtin').oldfiles() end,		desc = " Recent files",    icon = " ", key = "r" },
				{ action = function() require('telescope.builtin').live_grep() end,		desc = " Find text",       icon = " ", key = "g" },
				{ action = "Lazy",														desc = " Lazy",            icon = "󰒲 ", key = "l" },
				{ action = "qa",														desc = " Quit",            icon = " ", key = "q" }
			},
			footer = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				return { "Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
			end,
		}
	}
}

