local lsp_installer_servers = require 'nvim-lsp-installer.servers'

local server_available, requested_server = lsp_installer_servers.get_server("rust_analyzer")

-- reference: https://github.com/williamboman/nvim-lsp-installer/wiki/Rust

if server_available then
    requested_server:on_ready(function()
        local extension_path = '~/.vscode/extensions/vadimcn.vscode-lldb-1.6.10/'
        local codelldb_path = extension_path .. 'adapter/codelldb'
        local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

        local opts = vim.tbl_deep_extend("force", require("lsp").common_opts, {
            autoSetHints = true,
            -- dap = {
            --     adapter = require('rust-tools.dap').get_codelldb_adapter(
            --         codelldb_path, liblldb_path)
            -- },
            runnables = {
                use_telescope = true
            },
            debuggables = {
                use_telescope = true
            },
        })

        require("rust-tools").setup{
            server = vim.tbl_deep_extend("force", requested_server:get_default_options(), opts),
        }

        requested_server:attach_buffers()
    end)
    if not requested_server:is_installed() then
        -- Queue the server to be installed
        requested_server:install()
    end
end
