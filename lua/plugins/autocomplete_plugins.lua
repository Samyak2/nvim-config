return {
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("cmp_conf")
        end,
        event = "InsertEnter",
        dependencies = {
            -- snippets
            {
                "rafamadriz/friendly-snippets",
            },
            {
                "hrsh7th/vim-vsnip",
            },
            {
                "onsails/lspkind.nvim",
            },
            {
                "hrsh7th/cmp-nvim-lsp",
            },
            {
                "hrsh7th/cmp-nvim-lsp-document-symbol",
            },
            {
                "hrsh7th/cmp-vsnip",
            },
            {
                "hrsh7th/cmp-buffer",
            },
            {
                "hrsh7th/cmp-path",
            },
            {
                "hrsh7th/cmp-cmdline",
            },
            {
                "davidsierradz/cmp-conventionalcommits",
            },
            {
                "andersevenrud/cmp-tmux",
            },
            {
                "petertriho/cmp-git",
                dependencies = { "nvim-lua/plenary.nvim" },
                config = function()
                    require("cmp_git").setup {
                        filetypes = { "gitcommit", "octo", "markdown" },
                    }
                end,
            },
            {
                "hrsh7th/cmp-nvim-lsp-document-symbol",
            },
        },
    },
}
