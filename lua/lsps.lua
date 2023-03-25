require('mason_conf')

local lspconfig = require'lspconfig'

local nlspsettings = require("nlspsettings")

nlspsettings.setup({
    config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
    local_settings_dir = ".nlsp-settings",
    local_settings_root_markers_fallback = { '.git' },
    append_default_schemas = true,
    loader = 'json'
})

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        local opts = vim.tbl_deep_extend("force", require("lsp").common_opts(), {})
        lspconfig[server_name].setup(opts)
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    ["efm"] = function ()
         require('lsp.efm-ls')
    end,
    ["lua_ls"] = function ()
         require('lsp.lua-ls')
    end,
    ["gopls"] = function ()
         require('lsp.go-ls')
    end,
    ["rust_analyzer"] = function ()
          require('lsp.rust-ls')
    end,
}
