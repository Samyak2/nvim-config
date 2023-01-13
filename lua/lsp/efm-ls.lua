-- Stolen from: https://github.com/ChristianChiarulli/LunarVim/blob/master/lua/lsp/efm-general-ls.lua
-- Example configuations here: https://github.com/mattn/efm-langserver

-- python
local python_arguments = {}

-- TODO replace with path argument
local flake8 = {
    LintCommand = "flake8 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"}
}

local isort = {formatCommand = "isort --quiet -", formatStdin = true}

-- local yapf = {formatCommand = "yapf --quiet", formatStdin = true}
local black = {formatCommand = "black --quiet -", formatStdin = true}

table.insert(python_arguments, flake8)

table.insert(python_arguments, isort)

table.insert(python_arguments, black)

-- lua
local lua_arguments = {}

local luaFormat = {
    formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
    formatStdin = true
}

local lua_fmt = {formatCommand = "luafmt --indent-count 2 --line-width 120 --stdin", formatStdin = true}

local lua_formatter = 'lua-format'
if lua_formatter == 'lua-format' then
    table.insert(lua_arguments, luaFormat)
elseif lua_formatter == 'lua-fmt' then
    table.insert(lua_arguments, lua_fmt)
end

-- sh
local sh_arguments = {}

local shfmt = {formatCommand = 'shfmt -ci -s -bn', formatStdin = true}

local shellcheck = {
    LintCommand = 'shellcheck -f gcc -x',
    lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
}

local sh_formatter = ''
if sh_formatter == 'shfmt' then table.insert(sh_arguments, shfmt) end

local sh_linter = ''
if sh_linter == 'shellcheck' then table.insert(sh_arguments, shellcheck) end

-- tsserver/web javascript react, vue, json, html, css, yaml
local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}
-- You can look for project scope Prettier and Eslint with e.g. vim.fn.glob("node_modules/.bin/prettier") etc. If it is not found revert to global Prettier where needed.
-- local prettier = {formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}", formatStdin = true}

local eslint = {
    lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

local eslint_d = {
    lintCommand = "eslint_d --cache -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    -- formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    -- formatStdin = true
}

local tsserver_args = {}

local tsserver_formatter = 'prettier'
if tsserver_formatter == 'prettier' then table.insert(tsserver_args, prettier) end

local tsserver_linter = 'eslint_d'
if tsserver_linter == 'eslint' then table.insert(tsserver_args, eslint) end
if tsserver_linter == 'eslint_d' then table.insert(tsserver_args, eslint_d) end

-- local markdownlint = {
--     -- TODO default to global lintrc
--     -- lintcommand = 'markdownlint -s -c ./markdownlintrc',
--     lintCommand = 'markdownlint -s',
--     lintStdin = true,
--     lintFormats = {'%f:%l %m', '%f:%l:%c %m', '%f: %l: %m'}
-- }

local markdownPandocFormat = {formatCommand = 'pandoc -f markdown -t gfm -sp --tab-stop=2', formatStdin = true}

local opts = vim.tbl_deep_extend("force", require("lsp").common_opts(), {
    -- cmd = {vim.fn.stdpath('data') .. "/lspinstall/efm/efm-langserver"},
    -- init_options = {initializationOptions},
    init_options = {documentFormatting = true, codeAction = true},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            python = python_arguments,
            lua = lua_arguments,
            sh = sh_arguments,
            javascript = tsserver_args,
            javascriptreact = tsserver_args,
            typescript = tsserver_args,
            typescriptreact = tsserver_args,
            html = {prettier},
            css = {prettier},
            json = {prettier},
            yaml = {prettier},
            markdown = {markdownPandocFormat}
            -- javascriptreact = {prettier, eslint},
            -- javascript = {prettier, eslint},
            -- markdown = {markdownPandocFormat, markdownlint},
        }
    },
    filetypes = {
        "lua", "python", "javascriptreact", "javascript", "typescript", "typescriptreact", "sh", "html", "css",
        "json", "yaml", "markdown", "vue"
    },
})
require'lspconfig'["efm"].setup(opts)

-- Also find way to toggle format on save
-- maybe this will help: https://superuser.com/questions/439078/how-to-disable-autocmd-or-augroup-in-vim

