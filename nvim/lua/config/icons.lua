return {
	prompt = '',
	current = ' ',
	selected = '',
	close = '✖',
	pinned = '',
	diff = {
		added = '',
		modified = '',
		removed = '',
	},
	filetree = {
		basic = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "󰜌",
		},
		git = {
			-- Change type
			added     = "",
			modified  = "",
			deleted   = "✖",
			renamed   = "󰁕",
			-- Status type
			untracked = "",
			ignored   = "",
			unstaged  = "",
			staged    = "",
			conflict  = "",
		},
	},
	diff_gutter = {
		add = '▌',
		change = '▌',
		delete = '',
		untracked = '+'
	},
	diagnostics = {
		error = '',
		warn = '',
		info = '',
		hint = ''
	},
	test = {
		ok = '',
		failed = '',
		running = '',
		skipped = '',
		watch = '',
		unknown = '',
	}
}
