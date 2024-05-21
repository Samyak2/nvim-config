vim.g.rustaceanvim = {
    server = vim.tbl_deep_extend("force", require("lsp").common_opts(), {
        on_attach = function(client, bufnr)
            require("lsp").common_on_attach(client, bufnr)

            vim.keymap.set("n", "<leader>ca", function()
                vim.cmd.RustLsp("codeAction")
            end, { silent = true, buffer = bufnr })
        end,
        default_settings = {
            -- rust-analyzer language server configuration
            ["rust-analyzer"] = {
                check = {
                    command = "clippy",
                },
            },
        },
    }),
}
