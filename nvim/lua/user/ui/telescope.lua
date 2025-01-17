local border = {
    prompt = { " " },
    results = { " " },
    preview = { " " },
}

return {
    border = border,
    dropdown = {
        previewer = false,
        prompt_title = false,
        layout_strategy = "horizontal",
        layout_config = {
            prompt_position = "top",
        },
        borderchars = border,
    }
}
