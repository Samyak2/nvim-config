return {
    -- TODO: not needed in neovim v0.10
    {
        "tpope/vim-commentary",
        keys = {
            { "gc", mode = { "x" } },
            { "gcc", mode = { "n" } },
        },
    },
    {
        "tpope/vim-surround",
        keys = {
            { "cs" },
        }
    },
    {
        "mattn/emmet-vim",
        ft = { "html", "svelte" },
    },
}
