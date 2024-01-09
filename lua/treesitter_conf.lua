require("nvim-treesitter.install").compilers = { "gcc" }

require("nvim-treesitter.configs").setup {
    ensure_installed = "all", -- "all" or a list of languages
    highlight = {
        enable = true, -- false will disable the whole extension
    },
    indent = {
        enable = true,
    },
}
