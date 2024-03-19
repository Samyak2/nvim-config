require("mason_conf")

-- -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
-- require("neodev").setup({
--   -- add any options here, or leave empty to use the default settings
-- })

local lspconfig = require("lspconfig")

local function default_lsp_handler(server_name)
    local opts = vim.tbl_deep_extend("force", require("lsp").common_opts(), {})
    lspconfig[server_name].setup(opts)
end

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    default_lsp_handler,
    -- Next, you can provide a dedicated handler for specific servers.
    ["gopls"] = function()
        require("lsp.go-ls")
    end,
    ["yamlls"] = function()
        require("lspconfig").yamlls.setup {
            settings = {
                yaml = {
                    schemas = require("schemastore").yaml.schemas(),
                },
            },
        }
    end,
    ["jsonls"] = function()
        require("lspconfig").jsonls.setup {
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                    validate = { enable = true },
                },
            },
        }
    end,
    -- ["pest_ls"] = function()
    -- 	require("pest-vim").setup(require("lsp").common_opts())
    -- end,
}

-- this handles both cases:
-- 1. the lsp is installed by mason
-- 2. the lsp is installed in the system (e.g. nixos or home-manager)
local function call_if_executable_exists(exe_name, fn)
    if vim.fn.executable(exe_name) ~= 0 then
        fn()
    end
end

call_if_executable_exists("efm-langserver", function()
    require("lsp.efmls")
end)

call_if_executable_exists("lua-language-server", function()
    require("lsp.lua-ls")
end)

call_if_executable_exists("nil", function()
    default_lsp_handler("nil_ls")
end)

call_if_executable_exists("pyright", function()
    default_lsp_handler("pyright")
end)

call_if_executable_exists("rust-analyzer", function()
    require("lsp.rust-ls")
end)

-- require("lspconfig").pest_ls.setup {}
