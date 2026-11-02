local definitions = {
    ["uwsm"] = {
        command = "uwsm-terminal",
        test = "command -v uwsm-terminal && uwsm check is-active",
    },
    ["ghostty"] = {
        command = "ghostty",
        args = "-e",
    },
    ["kitty"] = {
        command = "kitty",
        args = "-e",
    },
    ["xterm"] = {
        command = "xterm",
        args = "-e",
    },
    ["urxvt"] = {
        command = "urxvt",
        args = "-e",
    },
}


local M = {
    terminals = { "uwsm", "ghostty", "kitty", "xterm", "urxvt" }
}

function M.configure(list)
    M.terminals = list
end

function M.exec(command)
    local script = {}

    for _, name in ipairs(M.terminals) do
        local term = assert(definitions[name], "Unknown terminal: " .. name)
        local test = term.test or ("command -v " .. term.command)

        local cmd = term.command

        if command then
            if term.args then
                cmd = cmd .. " " .. term.args
            end

            cmd = cmd .. " " .. command
        end

        table.insert(script, string.format(
            "if %s >/dev/null 2>&1; then exec %s; fi",
            test,
            cmd
        ))
    end

    return hl.dsp.exec_cmd(table.concat(script, "; "))
end

return M
