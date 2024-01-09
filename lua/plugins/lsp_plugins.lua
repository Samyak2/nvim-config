return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "LspInfo", "LspInstall", "LspUninstall" },
        dependencies = {
            {
                "williamboman/mason.nvim",
                build = ":MasonUpdate",
            },

            {
                "williamboman/mason-lspconfig.nvim",
            },

            {
                "creativenull/efmls-configs-nvim",
                version = "v1.*",
                dependencies = { "neovim/nvim-lspconfig" },
            },
        },
        config = function()
            require("lsps")
        end,
    },

    {
        "nvim-lua/lsp-status.nvim",
    },
}
