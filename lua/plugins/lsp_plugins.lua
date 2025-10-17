return {
    {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspUninstall" },
        dependencies = {
            {
                "mason-org/mason.nvim",
                version = "^1.0.0",
                build = ":MasonUpdate",
            },

            {
                "mason-org/mason-lspconfig.nvim",
                version = "^1.0.0",
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
