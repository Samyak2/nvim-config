require'lspconfig'.gopls.setup{
    settings = {gopls = {analyses = {unusedparams = true, fieldalignment = true, nilness = true},
                         staticcheck = true,
                         usePlaceholders = true}},
    init_options = {usePlaceholders = true, completeUnimported = true},
    on_attach = require'lsp'.common_on_attach
}
