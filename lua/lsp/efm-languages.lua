local ret = {}

local fs = require("efmls-configs.fs")
local sourceText = require("efmls-configs.utils").sourceText

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
local languages = require("efmls-configs.defaults").languages()
ret.languages = vim.tbl_extend("force", languages, {
    -- Custom languages, or override existing ones
    typescript = {
        require("efmls-configs.formatters.prettier"),
    },
    typescriptreact = {
        require("efmls-configs.formatters.prettier"),
    },
    javascript = {
        require("efmls-configs.formatters.prettier"),
    },
    python = {
        require("efmls-configs.formatters.black"),
        {
            formatCommand = string.format("%s --profile black --quiet -", fs.executable("isort")),
            formatStdin = true,
            rootMarkers = {
                ".isort.cfg",
                "pyproject.toml",
                "setup.cfg",
                "setup.py",
            },
        },
        require("efmls-configs.linters.flake8"),
    },
    sql = {
        {
            prefix = "sqlfluff",
            lintSource = sourceText("sqlfluff"),
            lintCommand = string.format(
                "%s lint --format github-annotation-native --nocolor --disable-progress-bar -",
                fs.executable("sqlfluff")
            ),
            lintStdin = true,
            lintIgnoreExitCode = true,
            lintFormats = {
                "::%totice title=SQLFluff,file=%f,line=%l,col=%c::%m",
                "::%tarning title=SQLFluff,file=%f,line=%l,col=%c::%m",
                "::%trror title=SQLFluff,file=%f,line=%l,col=%c::%m",
            },
            rootMarkers = {
                ".sqlfluff",
                "pyproject.toml",
                "setup.cfg",
                "setup.py",
            },
        },
    },
    nix = {
        require("efmls-configs.linters.statix"),
        require("efmls-configs.formatters.alejandra"),
    },
})

return ret
