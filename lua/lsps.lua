-- lsp-installer begin
local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
lsp_installer.on_server_ready(function(server)
    local opts = vim.tbl_deep_extend("force", require("lsp").common_opts, {})

    -- ignore the ones that are setup manually later, with more options and stuff
    if server.name == "efm" or server.name == "sumneko_lua" or server.name == "gopls" or server.name == "rust_analyzer" then
        return
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

-- lsp-installer end

require('lsp.lua-ls')
require('lsp.go-ls')
require('lsp.rust-ls')
require('lsp.efm-ls')

