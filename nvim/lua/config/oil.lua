return {
    default_file_explorer = true,
    prompt_save_on_select_new_entry = false,
    keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
    },
    use_default_keymaps = false,
    float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 200,
        max_height = 30,
        border = "single",
        win_options = {
            winblend = 0,
        },
    },
    ssh = {
        border = "single",
    },
    keymaps_help = {
        border = "single",
    }
}
