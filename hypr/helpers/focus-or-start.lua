
function FocusOrStart(command, classPrefix)
    for _, window in ipairs(hl.get_windows()) do
        if window.class:sub(1, #classPrefix) == classPrefix then
            hl.dispatch(hl.dsp.focus({ window = window }))
            return
        end
    end

    hl.exec_cmd(command)
end
