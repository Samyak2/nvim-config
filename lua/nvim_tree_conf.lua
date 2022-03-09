require'nvim-tree'.setup {
    auto_close = true,
    auto_reload_on_write = true,
    update_focused_file = {
        enable      = true
    },
    diagnostics = {
        enable = false,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        }
    }
}
