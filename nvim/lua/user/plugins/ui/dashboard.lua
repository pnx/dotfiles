local icons = require('user.icons')

return {
    "goolord/alpha-nvim",
    config = function()
        local alpha = require'alpha'
        local dashboard = require'alpha.themes.dashboard'

        dashboard.section.header.val = {
            [[ ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓]],
            [[ ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒]],
            [[▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░]],
            [[▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ]],
            [[▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒]],
            [[░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░]],
            [[░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░]],
            [[   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ]],
            [[         ░    ░  ░    ░ ░        ░   ░         ░   ]],
            [[                                ░                  ]]
        }

        dashboard.section.buttons.val = {
            dashboard.button("e", icons.files.text .. "  New file" , ":ene <BAR> startinsert<CR>"),
            dashboard.button("s", icons.search .. "  Search files" , ":Telescope find_files<CR>"),
            dashboard.button("o", icons.search .. "  Old files" , ":Telescope oldfiles<CR>"),
            dashboard.button("q", icons.close .. "  Quit" , ":qa<CR>"),
        }

        alpha.setup(dashboard.config)
    end
}
