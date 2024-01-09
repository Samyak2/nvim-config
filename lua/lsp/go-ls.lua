local opts = vim.tbl_deep_extend("force", require("lsp").common_opts(), {
    settings = {
        gopls = {
            analyses = { unusedparams = true, fieldalignment = true, nilness = true },
            staticcheck = true,
            usePlaceholders = true,
        },
    },
    init_options = { usePlaceholders = true, completeUnimported = true },
})
require("lspconfig")["gopls"].setup(opts)
