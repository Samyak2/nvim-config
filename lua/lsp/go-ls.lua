local lsp_installer_servers = require 'nvim-lsp-installer.servers'

local server_available, requested_server = lsp_installer_servers.get_server("gopls")

if server_available then
    requested_server:on_ready(function()
        local opts = vim.tbl_deep_extend("force", require("lsp").common_opts, {
            settings = {
                gopls = {
                    analyses = {unusedparams = true, fieldalignment = true, nilness = true},
                    staticcheck = true,
                    usePlaceholders = true
                }
            },
            init_options = {usePlaceholders = true, completeUnimported = true},
        })
        requested_server:setup(opts)
    end)
    if not requested_server:is_installed() then
        -- Queue the server to be installed
        requested_server:install()
    end
end
