-- vim.cmd("let g:nvim_tree_quit_on_open = 1")

require'nvim-tree'.setup {
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
