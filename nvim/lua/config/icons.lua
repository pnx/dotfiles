return {
    prompt = '',
    current = ' ',
    selected = '',
    close = '󰅖',
    modified = '',
    pinned = '',
    separator = '│',
    edit = '',
    buffer = '',
    fold = {
        open = '',
        close = '',
        sep = ' ',
    },
    tree = {
        node = '│',
        nodelast = '└',
    },
    files = {
        text = "",
        symlink = "",
    },
    folder = {
        closed = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = "",
    },
    diff = {
        added = '',
        modified = '',
        removed = '',
    },
    diff_gutter = {
        add = '▍',
        change = '▍',
        delete = '',
        untracked = '+'
    },
    gitsigns = {
        -- Change type
        added     = "",
        modified  = "",
        deleted   = "",
        renamed   = "➜",
        -- Status type
        untracked = "★",
        ignored   = "◌",
        unstaged  = "",
        staged    = "✓",
        conflict  = "",
    },
    todo = {
        default = '',
        warn = '',
        perf = '',
        bug =  '',
        hack = '',
        test = '󰄉',
    },
    diagnostics = {
        error = '',
        warn = '',
        info = '',
        hint = ''
    },
    test = {
        ok = '',
        failed = '',
        running = '',
        skipped = '',
        watch = '',
        unknown = '',
    },
    symbols = {
        Text = "TXT",
        Method = "",
        Function = "󰊕",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "󰑭",
        Value = "",
        Number = "",
        NumberHex = "󱊧",
        Enum = "",
        Keyword = "",
        Snippet = "󰘦",
        Color = "",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "",
    },
}
