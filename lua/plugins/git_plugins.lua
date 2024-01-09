return {
    {
        "lewis6991/gitsigns.nvim",
        event = "BufEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("gitsigns_conf")
        end,
    },

    {
        "pgr0ss/vim-github-url",
        event = "BufEnter",
        cmd = { "GitHubURL", "GitHubURLRepo", "GitHubURLBlob", "GitHubURLBlame" },
    },
}
