
-- Highlight on yank
if user.highlight_yank.enable or false then
    require('user.utils.misc').highlight_yank(user.highlight_yank)
end

-- Default formatter. will select the whole file and use formatexpr to format the file.
-- this is slow and ugly, but works.
if user.formatter == nil then
    user.formatter = [[mfgggqG`f=zz]]
end

vim.api.nvim_create_user_command('Format', function()
    if type(user.formatter) == "string" then
        local cmd = vim.api.nvim_replace_termcodes(user.formatter, true, false, true)
        vim.api.nvim_feedkeys(cmd, 'n', false)
    elseif type(user.formatter) == "function" then
        user.formatter()
    else
        vim.api.nvim_err_writeln("No formatter found")
    end
end, {})
