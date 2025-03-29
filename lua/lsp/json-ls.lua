require("lspconfig").jsonls.setup(vim.tbl_deep_extend("force", require("lsp").common_opts(), {
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
        },
    },
}))
