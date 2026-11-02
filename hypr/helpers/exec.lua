
local uwsm = os.execute("uwsm check is-active >/dev/null 2>&1")

local function normalize_cmd(cmd)
    if uwsm == true or uwsm == 0 then
        cmd = "uwsm-app " .. cmd
    end
    return cmd
end

function dispatch(cmd)
    return hl.dsp.exec_cmd(normalize_cmd(cmd))
end

function exec(cmd)
    return hl.exec_cmd(normalize_cmd(cmd))
end

