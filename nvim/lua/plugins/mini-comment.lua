return {
	'echasnovski/mini.comment',
	version = '*',
	opts = {
		options = {
			custom_commentstring = function() return vim.bo.commentstring end
		}
	}
}
