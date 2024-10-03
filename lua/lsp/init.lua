local default_keymap_opts = { noremap = true, silent = true }
local ret = {}

local function custom_format()
    return vim.lsp.buf.format {
        async = true,
        filter = function(client)
            local filetype = vim.bo.filetype
            if require("lsp.efm-languages").languages[filetype] then
                return client.name == "efm"
            end
            return true
        end,
    }
end

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, default_keymap_opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, default_keymap_opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, default_keymap_opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, default_keymap_opts)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(args)
        local bufnr = args.buf

        -- Enable completion triggered by <c-x><c-o>
        vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client ~= nil and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end

        local keymap_opts = vim.tbl_deep_extend("force", default_keymap_opts, {
            buffer = bufnr,
        })

        -- Mappings.
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, keymap_opts)
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", keymap_opts)
        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", keymap_opts)
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", keymap_opts)
        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", keymap_opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, keymap_opts)
        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, keymap_opts)
        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, keymap_opts)
        vim.keymap.set("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, keymap_opts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, keymap_opts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, keymap_opts)
        vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, keymap_opts)
        vim.keymap.set("v", "<space>ca", vim.lsp.buf.code_action, keymap_opts)
        vim.keymap.set("n", "<space>fo", custom_format, keymap_opts)
        vim.keymap.set("n", "<space>fo", custom_format, keymap_opts)
    end,
})

function ret.common_on_attach(client, bufnr) end

ret.common_opts = function()
    return {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = ret.common_on_attach,
    }
end

return ret
