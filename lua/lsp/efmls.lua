local languages = require("lsp.efm-languages").languages

local efmls_config = {
    single_file_support = true,
    filetypes = vim.tbl_keys(languages),
    settings = {
        rootMarkers = { ".git/" },
        languages = languages,
    },
    init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
        hover = true,
        documentSymbol = true,
        codeAction = true,
        completion = true
    },
}

require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, require("lsp").common_opts()))
