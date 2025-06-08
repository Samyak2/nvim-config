return {
    {
        "mfussenegger/nvim-dap",
        dependencies = { "igorlfs/nvim-dap-view" },
        config = function()
            require("dap").defaults.fallback.switchbuf = "usevisible,usetab,newtab"
        end,
        keys = {
            {
                "<c-b>",
                function()
                    require("dap").toggle_breakpoint()
                end,
                mode = { "n" },
                desc = "Toggle breakpoint",
            },
        },
    },
    -- {
    --     "rcarriga/nvim-dap-ui",
    --     dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    --     opts = {},
    --     keys = {
    --         {
    --             "D",
    --             function()
    --                 require("dapui").toggle()
    --             end,
    --             mode = { "n" },
    --             desc = "Toggle debugger UI",
    --         },
    --         {
    --             "<c-k>",
    --             function()
    --                 require("dapui").eval()
    --             end,
    --             mode = { "n", "v" },
    --             desc = "Evaluate selection in debugger",
    --         },
    --     },
    -- },
    {
        "igorlfs/nvim-dap-view",
        ---@module 'dap-view'
        ---@type dapview.Config
        opts = {
            winbar = {
                default_section = "scopes",
                controls = {
                    enabled = true,
                },
            },
        },
        keys = {
            {
                "D",
                function()
                    require("dap-view").toggle()
                end,
                mode = { "n" },
                desc = "Toggle debugger UI",
            },
        },
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = { "mfussenegger/nvim-dap" },
        opts = {},
    },
}
