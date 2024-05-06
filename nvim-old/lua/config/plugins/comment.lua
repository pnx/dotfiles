return {
	options = {
		custom_commentstring = function() return vim.bo.commentstring end
	},
	mappings = {
		-- Toggle comment (like `gcip` - comment inner paragraph) for both
		-- Normal and Visual modes
		comment = '<leader>/',

		-- Toggle comment on current line
		comment_line = '<leader>//',

		-- Toggle comment on visual selection
		comment_visual = '<leader>/',

		-- Define 'comment' textobject (like `dg/` - delete whole comment block)
		-- Works also in Visual mode if mapping differs from `comment_visual`
		textobject = 'g/',
	}
}
