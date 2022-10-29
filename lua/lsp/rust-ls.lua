-- local lsp_installer_servers = require 'nvim-lsp-installer.servers'

-- local server_available, requested_server = lsp_installer_servers.get_server("rust_analyzer")

-- reference: https://github.com/williamboman/nvim-lsp-installer/wiki/Rust

-- if server_available then
--     requested_server:on_ready(function()

--         requested_server:attach_buffers()
--     end)
--     if not requested_server:is_installed() then
--         -- Queue the server to be installed
--         requested_server:install()
--     end
-- end
local extension_path = '~/.vscode-server/extensions/vadimcn.vscode-lldb-1.8.1'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

local rust_opts = {
    server = require("lsp").common_opts(),
    autoSetHints = true,
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
    },
    runnables = {
        use_telescope = true
    },
    debuggables = {
        use_telescope = true
    },
}

require("rust-tools").setup(rust_opts)
