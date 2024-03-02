return {
	'nvimdev/dashboard-nvim',
	name = 'dashboard',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	event = 'VimEnter',
	opts = {
		config = {
			header = {
				':::::::::  ::::    ::: :::    :::',
				':+:    :+: :+:+:   :+: :+:    :+:',
				'+:+    +:+ :+:+:+  +:+  +:+  +:+ ',
				'+#++:++#+  +#+ +:+ +#+   +#++:+  ',
				'+#+        +#+  +#+#+#  +#+  +#+ ',
				'#+#        #+#   #+#+# #+#    #+#',
				'###        ###    #### ###    ###',
				'',
			},
			shortcut = {
				{ desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' }
			},
			footer = {}
		}
	}
}

