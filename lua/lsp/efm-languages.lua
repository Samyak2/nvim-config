local ret = {}

-- Register linters and formatters per language
-- local eslint = require('efmls-configs.linters.eslint')
-- local prettier = require('efmls-configs.formatters.prettier')
-- local stylua = require('efmls-configs.formatters.stylua')
-- local languages = {
--     typescript = { eslint, prettier },
--     lua = { stylua },
-- }

-- Or use the defaults provided by this plugin
-- check doc/SUPPORTED_LIST.md for the supported languages
--
local languages = require('efmls-configs.defaults').languages()
ret.languages = vim.tbl_extend('force', languages, {
  -- Custom languages, or override existing ones
  typescript = {
    require('efmls-configs.formatters.prettier'),
  },
  typescriptreact = {
    require('efmls-configs.formatters.prettier'),
  },
})

return ret
