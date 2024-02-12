return {
    {
        "bluz71/vim-nightfly-colors",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme nightfly")
        end,
    },
    {
        "xiyaowong/transparent.nvim",
        lazy = false,
    }
}
