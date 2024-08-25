-- Helper functions for dealing with buffers
local M = {}

function M.Close(buf)
    -- check if mini is installed.
    local hasmini, mini = pcall(require,"mini.bufremove")
    if hasmini then
        local bd = mini.delete
        if vim.bo[buf].modified then
            local bufname = vim.fn.bufname(buf)
            local choice = vim.fn.confirm(("Save changes to %q?"):format(bufname), "&Yes\n&No\n&Cancel")
            if choice == 1 then -- Yes
                vim.cmd(("%i,%ibufdo w"):format(buf, buf))
                bd(buf)
            elseif choice == 2 then -- No
                bd(buf, true)
            end
        else
            bd(buf)
        end
        -- fallback to native nvim api
    else
        vim.api.nvim_buf_delete(buf, {})
    end
end

-- Close current buffer
function M.CloseCurrent()
    M.Close(vim.api.nvim_get_current_buf())
end

-- Close all but current buffer
function M.CloseOthers()
    for _, i in ipairs(vim.api.nvim_list_bufs()) do
        if i ~= vim.api.nvim_get_current_buf() then
            M.Close(i)
        end
    end
end

-- Close all open buffers
function M.CloseAll()
    for _, i in ipairs(vim.api.nvim_list_bufs()) do
        M.Close(i)
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
