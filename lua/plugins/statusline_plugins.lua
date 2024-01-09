return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
    },
    {
        "linrongbin16/lsp-progress.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "BufEnter",
    },
}
