
-- Highlight on yank
if user.highlight_yank.enable or false then
    require('user.utils.misc').highlight_yank(user.highlight_yank)
end
