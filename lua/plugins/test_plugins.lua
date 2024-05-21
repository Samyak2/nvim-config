return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",

            "nvim-neotest/neotest-python",
            "adrigzr/neotest-mocha",
        },
        config = function()
            require("neotest").setup {
                adapters = {
                    require("neotest-python") {
                        args = { "-vvv" },
                    },
                    require("neotest-mocha"),
                    require("rustaceanvim.neotest"),
                },
            }
        end,
        cmd = { "Neotest" },
        keys = {
            {
                "<leader>tt",
                function()
                    require("neotest").run.run()
                end,
            },
            {
                "<leader>ts",
                function()
                    require("neotest").run.stop()
                end,
            },
            {
                "<leader>tf",
                function()
                    require("neotest").run.run(vim.fn.expand("%"))
                end,
            },
            {
                "<leader>ta",
                function()
                    require("neotest").run.attach()
                end,
            },
            {
                "<leader>to",
                function()
                    require("neotest").output.open { enter = true }
                end,
            },
            {
                "[n",
                function()
                    require("neotest").jump.prev { status = "failed" }
                end,
            },
            {
                "]n",
                function()
                    require("neotest").jump.next { status = "failed" }
                end,
            },
            {
                "[t",
                function()
                    require("neotest").jump.prev()
                end,
            },
            {
                "]t",
                function()
                    require("neotest").jump.next()
                end,
            },
        },
    },
}
