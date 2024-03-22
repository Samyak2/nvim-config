return {
    {
        "github/copilot.vim",
        config = function()
            vim.cmd('imap <silent><script><expr> <C-J> copilot#Accept("")')
            vim.g.copilot_no_tab_map = true
            vim.g.copilot_filetypes = {
                yaml = true,
                markdown = true,
            }
        end,
        event = "BufEnter",
    },
}
