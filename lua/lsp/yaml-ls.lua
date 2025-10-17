vim.lsp.config("yamlls", vim.tbl_deep_extend("force", require("lsp").common_opts(), {
    settings = {
        yaml = {
            schemaStore = {
                -- You must disable built-in schemaStore support if you want to use
                -- schemastore.nvim and its advanced options like `ignore`.
                enable = false,
                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                url = "",
            },
            schemas = require("schemastore").yaml.schemas(),
        },
    },
}))
vim.lsp.enable("yamlls")
