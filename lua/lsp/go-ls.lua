require'lspconfig'.gopls.setup{
    settings = {gopls = {analyses = {unusedparams = true, fieldalignment = true},
                staticcheck = true}},
    init_options = {usePlaceholders = true, completeUnimported = true},
    on_attach = require'lsp'.common_on_attach
}
