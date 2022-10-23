require("lualine").setup {
    options = {
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff' },
            lualine_c = { 'filename' },
            lualine_x = { 'encoding', 'filetype' },
            lualine_y = { 'diagnostics' },
            lualine_z = { 'location' }
        },
    }
}
