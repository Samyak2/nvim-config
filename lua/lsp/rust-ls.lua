vim.g.rustaceanvim = {
    server = vim.tbl_deep_extend("force", require("lsp").common_opts(), {
        capabilities = require("blink.cmp").get_lsp_capabilities {
            workspace = {
                -- https://github.com/hrsh7th/cmp-nvim-lsp/issues/44#issuecomment-2096368152
                -- but also needed files.excludeDirs below
                didChangeWatchedFiles = { dynamicRegistration = true },
            },
        },
        on_attach = function(client, bufnr)
            require("lsp").common_on_attach(client, bufnr)

            vim.keymap.set("n", "<leader>ca", function()
                vim.cmd.RustLsp("codeAction")
            end, { silent = true, buffer = bufnr })

            vim.keymap.set("n", "<leader>d", function()
                vim.cmd.RustLsp("openDocs")
            end, { silent = true, buffer = bufnr })

            vim.keymap.set(
                "n",
                "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
                function()
                    vim.cmd.RustLsp { "hover", "actions" }
                end,
                { silent = true, buffer = bufnr }
            )
        end,
        default_settings = {
            -- rust-analyzer language server configuration
            ["rust-analyzer"] = {
                check = {
                    command = "clippy",
                },
                files = {
                    excludeDirs = {
                        ".direnv",
                        "target",
                    },
                },
            },
        },
    }),
}
