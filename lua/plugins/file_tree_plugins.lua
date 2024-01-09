return {
    {
        "stevearc/oil.nvim",
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons", "refractalize/oil-git-status.nvim" },
        config = function()
            require("oil").setup {
                delete_to_trash = true,
                win_options = {
                    signcolumn = "yes:2",
                },
            }

            require("oil-git-status").setup()
        end,
        lazy = false,
        keys = {
            { "<C-f>", "<CMD>Oil<CR>" },
        },
    },
}
