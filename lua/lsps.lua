-- lsp-installer begin
local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require'lspconfig'

lsp_installer.setup {}


for _, server in ipairs(lsp_installer.get_installed_servers()) do
    if server.name == "efm" then
        require('lsp.efm-ls')
    elseif server.name == "sumneko_lua" then
        require('lsp.lua-ls')
    elseif server.name == "gopls" then
        require('lsp.go-ls')
    elseif server.name == "rust_analyzer" then
        require('lsp.rust-ls')
    else
        local opts = vim.tbl_deep_extend("force", require("lsp").common_opts(), {})
        lspconfig[server.name].setup(opts)
    end
end
