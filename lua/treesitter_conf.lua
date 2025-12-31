require("nvim-treesitter").install {
    "bash",
    "c",
    "caddy",
    "cmake",
    "cpp",
    "css",
    "csv",
    "cuda",
    "diff",
    "dockerfile",
    "fennel",
    "fish",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "go",
    "gomod",
    "gosum",
    "gpg",
    "graphql",
    "helm",
    "html",
    "java",
    "javadoc",
    "javascript",
    "jinja",
    "jinja_inline",
    "jq",
    "json",
    "jsonc",
    "julia",
    "just",
    "latex",
    "llvm",
    "lua",
    "luadoc",
    "luap",
    "markdown",
    "markdown_inline",
    "mlir",
    "nginx",
    "nix",
    "nu",
    "passwd",
    "perl",
    "proto",
    "python",
    "racket",
    "robots",
    "ruby",
    "rust",
    "scala",
    "scheme",
    "sql",
    "ssh_config",
    "svelte",
    "swift",
    "terraform",
    "thrift",
    "tmux",
    "toml",
    "tsx",
    "typescript",
    "xml",
    "yaml",
    "zig",
}

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("treesitter.setup", {}),
    callback = function(args)
        local buf = args.buf
        local filetype = args.match

        -- you need some mechanism to avoid running on buffers that do not
        -- correspond to a language (like oil.nvim buffers), this implementation
        -- checks if a parser exists for the current language
        local language = vim.treesitter.language.get_lang(filetype) or filetype
        if not vim.treesitter.language.add(language) then
            return
        end

        -- replicate `fold = { enable = true }`
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

        -- replicate `highlight = { enable = true }`
        vim.treesitter.start(buf, language)

        -- replicate `indent = { enable = true }`
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

        -- `incremental_selection = { enable = true }` cannot be easily replicated
    end,
})
