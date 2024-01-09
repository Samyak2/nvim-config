return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzy-native.nvim",
                config = function()
                    require("telescope").load_extension("fzy_native")
                end,
            },
        },
        config = function()
            require("telescope_conf")
        end,
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
            { "<leader>fs", "<cmd>Telescope grep_string<cr>" },
            { "<leader>fz", "<cmd>Telescope spell_suggest<cr>" },
            { "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
            { "<leader>fr", "<cmd>Telescope resume<cr>" },
            { "<leader>fd", "<cmd>Telescope diagnostics<cr>" },
        },
    },
}
