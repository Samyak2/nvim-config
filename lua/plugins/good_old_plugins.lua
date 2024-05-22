---@type LazySpec
return {
    {
        "tpope/vim-commentary",
        keys = {
            { "gc", mode = { "x" } },
            { "gcc", mode = { "n" } },
        },
        cond = function()
            -- not needed in neovim 0.10+
            return vim.fn.has("nvim-0.10") == 0
        end,
    },
    {
        "tpope/vim-surround",
        keys = {
            { "cs" },
        },
    },
    {
        "mattn/emmet-vim",
        ft = { "html", "svelte" },
    },
}
