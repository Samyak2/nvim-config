require("lspconfig").basedpyright.setup(vim.tbl_deep_extend("force", require("lsp").common_opts(), {
    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "standard",
            },
        },
    },
}))
