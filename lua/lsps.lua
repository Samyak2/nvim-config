require("mason_conf")

-- -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
-- require("neodev").setup({
--   -- add any options here, or leave empty to use the default settings
-- })

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		local opts = vim.tbl_deep_extend("force", require("lsp").common_opts(), {})
		lspconfig[server_name].setup(opts)
	end,
	-- Next, you can provide a dedicated handler for specific servers.
	["efm"] = function()
		require("lsp.efmls")
	end,
	["lua_ls"] = function()
		require("lsp.lua-ls")
	end,
	["gopls"] = function()
		require("lsp.go-ls")
	end,
	["rust_analyzer"] = function()
		require("lsp.rust-ls")
	end,
	["yamlls"] = function()
		require("lspconfig").yamlls.setup({
			settings = {
				yaml = {
					schemas = require("schemastore").yaml.schemas(),
				},
			},
		})
	end,
	["jsonls"] = function()
		require("lspconfig").jsonls.setup({
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		})
	end,
	["pest_ls"] = function()
		require("pest-vim").setup(require("lsp").common_opts())
	end,
})

-- require("lspconfig").pest_ls.setup {}
