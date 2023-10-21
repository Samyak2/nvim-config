local languages = require('lsp.efm-languages').languages;

local efmls_config = {
    filetypes = vim.tbl_keys(languages),
    settings = {
        rootMarkers = { '.git/' },
        languages = languages,
    },
    init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
        codeAction = true,
    },
}

require('lspconfig').efm.setup(vim.tbl_extend('force', efmls_config, require("lsp").common_opts()))
