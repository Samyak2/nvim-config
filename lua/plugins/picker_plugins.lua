return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
        ---@class snacks.picker.Config
        picker = {
            win = {
                -- Make file truncation consider window width.
                -- <https://github.com/folke/snacks.nvim/issues/1217#issuecomment-2661465574>
                list = {
                    on_buf = function(self)
                        self:execute("calculate_file_truncate_width")
                    end,
                },
                preview = {
                    on_buf = function(self)
                        self:execute("calculate_file_truncate_width")
                    end,
                    on_close = function(self)
                        self:execute("calculate_file_truncate_width")
                    end,
                },
            },
            actions = {
                -- Make file truncation consider window width.
                -- <https://github.com/folke/snacks.nvim/issues/1217#issuecomment-2661465574>
                calculate_file_truncate_width = function(self)
                    local width = self.list.win:size().width
                    self.opts.formatters.file.truncate = width - 6
                end,
            },
        },
    },
    keys = {
        {
            "<leader>ff",
            function()
                Snacks.picker.smart {
                    filter = { cwd = true },
                }
            end,
            desc = "Smart Find Files",
        },
        {
            "<leader>fg",
            function()
                Snacks.picker.grep()
            end,
            desc = "Grep",
        },
        {
            "<leader>fb",
            function()
                Snacks.picker.buffers()
            end,
            desc = "Buffers",
        },
        {
            "<leader>fh",
            function()
                Snacks.picker.help()
            end,
            desc = "Help Pages",
        },
        {
            "<leader>fs",
            function()
                Snacks.picker.grep_word()
            end,
            desc = "Visual selection or word",
            mode = { "n", "x" },
        },
        {
            "<leader>fr",
            function()
                Snacks.picker.resume()
            end,
            desc = "Resume",
        },
        {
            "<leader>fd",
            function()
                Snacks.picker.diagnostics()
            end,
            desc = "Diagnostics",
        },
        -- LSP
        {
            "gd",
            function()
                Snacks.picker.lsp_definitions()
            end,
            desc = "Goto Definition",
        },
        {
            "gD",
            function()
                Snacks.picker.lsp_declarations()
            end,
            desc = "Goto Declaration",
        },
        {
            "gr",
            function()
                Snacks.picker.lsp_references()
            end,
            nowait = true,
            desc = "References",
        },
        {
            "gI",
            function()
                Snacks.picker.lsp_implementations()
            end,
            desc = "Goto Implementation",
        },
        {
            "gy",
            function()
                Snacks.picker.lsp_type_definitions()
            end,
            desc = "Goto T[y]pe Definition",
        },
        {
            "<leader>ss",
            function()
                Snacks.picker.lsp_symbols()
            end,
            desc = "LSP Symbols",
        },
        {
            "<leader>sS",
            function()
                Snacks.picker.lsp_workspace_symbols()
            end,
            desc = "LSP Workspace Symbols",
        },
    },
}
