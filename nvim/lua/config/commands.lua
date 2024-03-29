
-- Nice command that creates all directores in the path
-- then creates the file and opens it.
vim.api.nvim_create_user_command('CreateFile',
	function(opts)
		local dir = vim.fs.dirname(opts.fargs[1])
		vim.cmd(string.format("!mkdir -p %s\n !touch %s", dir, opts.fargs[1]))
		vim.cmd.e(opts.fargs)
	end,
	{ nargs = 1, complete = "file" }
)

vim.cmd("ca cf CreateFile")
