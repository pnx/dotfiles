local M = {}

function M.CloseOthers()
	for _, i in ipairs(vim.api.nvim_list_bufs()) do
		if i ~= vim.api.nvim_get_current_buf() then
			vim.api.nvim_buf_delete(i, {})
		end
	end
end

function M.CloseAll()
    for _, i in ipairs(vim.api.nvim_list_bufs()) do
        vim.api.nvim_buf_delete(i, {})
    end
end

return M