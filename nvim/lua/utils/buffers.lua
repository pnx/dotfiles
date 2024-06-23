-- Helper functions for dealing with buffers
local M = {}

-- Close all but current buffer
function M.CloseOthers()
	for _, i in ipairs(vim.api.nvim_list_bufs()) do
		if i ~= vim.api.nvim_get_current_buf() then
			vim.api.nvim_buf_delete(i, {})
		end
	end
end

-- Close all open buffers
function M.CloseAll()
    for _, i in ipairs(vim.api.nvim_list_bufs()) do
        vim.api.nvim_buf_delete(i, {})
    end
end

function M.GetLoaded()
    local loaded = {}
    for i, hnd in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(hnd) then
            loaded[i] = hnd
        end
    end
    return loaded
end

return M
