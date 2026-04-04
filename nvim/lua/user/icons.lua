local iconset = {
    middle_dot = "·",
    check = "✓",
    close = "󰅖",

    question_mark = "",
    info_circle_outline = "",
    exclamation_circle = "",
    exclamation_triangle = "",

    chat = "",
    pen = "",
    magnifying_glass = "",
    thumbtack = "",
    eye = "",
    eye_disabled = "󰛑",
    lock = "",
    clock = "",
    stopwatch = "󰄉",
    bug = "",
    fire = "",

    whitespace = {
        newline = "",
    },

    star = "★",
    ignored = "◌",
    vcs = {
        branch = "",
    },

    -- Arrows
    arrow = {
        right = "➜",
    },
    caret = {
        right = "",
        down = "",
    },
    chevron = {
        double = {
            right = "»"
        }
    },

    file = {
        default = "",
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

    -- Shapes
    circle = "",
    circle_dot = "",
    circle_dotted = "◌",
    plus = "",
    minus = "",
    minus_square = "",
    square = "󰝤",
    triangle_outline = "󰔷",

    box = {
        horizontal_line = "─",
        vertical_line = "│",
        vertical_line_left = "▏",
        vertical_line_right = "▕",
        vertical_line_thick = "▊",
        top_right_corner = "┐",
        middel_left = "├",
        bottom_left_corner = "└",
    },

    ruler = "󰑭",
    cogwheel = "",
    package = "",
    wrench = "",
    hash = "",
    text = "",
    text_boxed = "",
    bracket = "",
    bracket_dots = "󰘦",
    square_bracket = "",
    color = "",
    sort_desc = "",
    wand = "",

    number = "",
    hexadecimal = "󱊧",

    math = {
        ["function"] = "󰊕",
        pi = "",
        plus_minus = "󰆕",
    },

    code = {
        field = "",
        variable = "",
        interface = "",
        method = "",
        class = "",
        keyword = "",
        boolean = "",
        Reference = "󰈇",
        struct = "󰙅",
        event = "",
        type_parameter = "",
    },
}


return {
    prompt = iconset.caret_right,
    current = " ",
    selected = iconset.check,
    close = iconset.close,
    modified = iconset.circle,
    pinned = iconset.thumbtack,
    edit = iconset.pen,
    buffer = "",
    search = iconset.magnifying_glass,
    indent = iconset.box.vertical_line_left,
    signcolum = {
        separator = iconset.box.vertical_line_left
    },
    whitespace = {
        tab = "»",
        space = iconset.middle_dot,
        eol = iconset.whitespace.newline,
        nbsp = "␣",
    },
    fold = {
        open = iconset.caret.down,
        close = iconset.caret.right,
        sep = " ",
    },
    tree = {
        horizontal = iconset.box.horizontal_line,
        vertical = iconset.box.vertical_line,
        expanded = iconset.box.top_right_corner,
        node = iconset.box.middel_left,
        nodelast = iconset.box.bottom_left_corner,
    },
    files = iconset.file,
    file_status = {
        modified = iconset.circle,
        readonly = iconset.lock,
        hidden = iconset.eye_disabled,
        bookmarked = iconset.star,
    },
    folder = {
        arrow_closed = iconset.caret.right,
        arrow_open = iconset.caret.down,
        closed = iconset.folder.closed,
        open = iconset.folder.open,
        empty = iconset.folder.empty,
        empty_open = iconset.folder.empty_open,
        symlink = iconset.folder.symlink,
        symlink_open = iconset.folder.symlink_open,
    },
    diff = {
        added = iconset.plus,
        modified = iconset.square,
        removed = iconset.minus,
    },
    diff_gutter = {
        add = iconset.box.vertical_line_thick,
        change = iconset.box.vertical_line_thick,
        delete = iconset.caret.right,
        untracked = iconset.box.vertical_line_thick,
    },
    vcs = {
        branch = iconset.vcs.branch,
    },
    gitsigns = {
        -- Change type
        added = iconset.circle,
        modified = iconset.circle,
        deleted = iconset.minus_square,
        renamed = iconset.arrow.right,
        -- Status type
        untracked = iconset.question_mark,
        ignored = iconset.ignored,
        unstaged = iconset.circle,
        staged = iconset.circle,
        conflict = iconset.vcs.branch,
        unmerged = iconset.vcs.branch,
    },
    todo = {
        default = iconset.exclamation_circle,
        warn = iconset.exclamation_triangle,
        perf = iconset.clock,
        bug = iconset.bug,
        hack = iconset.fire,
        test = iconset.stopwatch,
    },
    diagnostics = {
        error = iconset.circle_dot,
        warn = iconset.triangle_outline,
        info = iconset.info_circle_outline,
        hint = iconset.chat,
    },
    test = {
        ok = iconset.check,
        failed = iconset.close,
        running = "",
        skipped = "",
        watch = "",
        unknown = iconset.circle,
    },
    debug = {
        breakpoint = "󰄯",
        breakpointCondition = "󰯲",
        logPoint = "󰰍",
        stopped = "󰌕",
        rejected = "",
    },
    symbols = {
        Text = iconset.text,
        Method = iconset.code.method,
        Function = iconset.math["function"],
        Constructor = iconset.cogwheel,
        Field = iconset.code.field,
        Variable = iconset.code.variable,
        Class = iconset.code.class,
        Interface = iconset.code.interface,
        Module = iconset.bracket,
        Namespace = iconset.bracket,
        Package = iconset.package,
        Property = iconset.wrench,
        Unit = iconset.ruler,
        Value = iconset.hash,
        String = iconset.text_boxed,
        Number = iconset.number,
        NumberHex = iconset.hexadecimal,
        Boolean = iconset.code.boolean,
        Array = iconset.square_bracket,
        Object = iconset.bracket,
        Enum = iconset.sort_desc,
        Keyword = iconset.code.keyword,
        Snippet = iconset.bracket_dots,
        Color = iconset.color,
        File = iconset.file.text,
        Reference = iconset.code.reference,
        Folder = iconset.folder.closed,
        Key = iconset.text,
        Null = iconset.code.boolean,
        EnumMember = iconset.sort_desc,
        Constant = iconset.math.pi,
        Struct = iconset.code.struct,
        Event = iconset.code.event,
        Operator = iconset.math.plus_minus,
        TypeParameter = iconset.code.type_parameter,
        Spell = iconset.wand,
        Unknown = iconset.question_mark
    },
    filetypes = {
        php = "󰌟",
        phpunit = "󰙨",
        laravel = ""
    }
}
