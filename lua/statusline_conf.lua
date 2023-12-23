require('lsp-progress').setup {
    -- Format series message.
    --
    -- adatped from:
    -- https://github.com/linrongbin16/lsp-progress.nvim/blob/cabf7fde50cc0dad367a03a1542d9670d1118bd0/lua/lsp-progress/defaults.lua#L78
    --
    --- @param title string?
    ---     Message title.
    --- @param message string?
    ---     Message body.
    --- @param percentage integer?
    ---     Progress in percentage numbers: 0-100.
    --- @param done boolean
    ---     Indicate whether this series is the last one in progress.
    --- @return SeriesFormatResult
    ---     The returned value will be passed to function `client_format` as
    ---     one of the `series_messages` array, or ignored if return nil.
    series_format = function(title, message, percentage, done)
        local builder = {}
        if percentage then
            table.insert(builder, string.format("%.0f%%%%", percentage))
        end
        if done then
            table.insert(builder, "done")
        end
        return table.concat(builder, " ")
    end,

    -- Format client message.
    --
    -- adapted from:
    -- https://github.com/linrongbin16/lsp-progress.nvim/blob/cabf7fde50cc0dad367a03a1542d9670d1118bd0/lua/lsp-progress/defaults.lua#L115
    --
    --- @param client_name string
    ---     Client name.
    --- @param spinner string
    ---     Spinner icon.
    --- @param series_messages string[]|table[]
    ---     Messages array.
    --- @return ClientFormatResult
    ---     The returned value will be passed to function `format` as one of the
    ---     `client_messages` array, or ignored if return nil.
    client_format = function(client_name, spinner, series_messages)
        return #series_messages > 0
            and ("[" .. client_name .. "] " .. table.concat(
                series_messages,
                ","
            ))
            or nil
    end,

    -- Format (final) message.
    --
    -- Adapter from:
    -- https://github.com/linrongbin16/lsp-progress.nvim/blob/cabf7fde50cc0dad367a03a1542d9670d1118bd0/lua/lsp-progress/defaults.lua#L133
    --
    --- @param client_messages string[]|table[]
    ---     Client messages array.
    --- @return string
    ---     The returned value will be returned as the result of `progress` API.
    format = function(client_messages)
        if #client_messages > 0 then
            return table.concat(client_messages, " ")
        end
        if #vim.lsp.get_active_clients() > 0 then
            return ""
        end
        return ""
    end,
}

require("lualine").setup {
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { require('lsp-progress').progress },
        lualine_x = { 'encoding', },
        lualine_y = { 'filetype' },
        lualine_z = { 'progress', 'location' }
    },
}

-- listen lsp-progress event and refresh lualine
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = "lualine_augroup",
  pattern = "LspProgressStatusUpdated",
  callback = require("lualine").refresh,
})
