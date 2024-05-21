vim.g.rustaceanvim = {
    server = vim.tbl_deep_extend("force", require("lsp").common_opts(), {
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
