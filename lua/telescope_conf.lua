-- "inspired" by Primeagen's setup
-- https://github.com/awesome-streamers/awesome-streamerrc/blob/master/ThePrimeagen/lua/theprimeagen/telescope.lua

require("telescope").setup {
    defaults = {
        -- use fzy native sorter for spid
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        layout_strategy = "vertical",
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob=!.git/*",
        },
        layout_config = {
            vertical = {
                preview_cutoff = 0,
            },
        },
    },
    pickers = {
        find_files = {
            hidden = true,
            find_command = { "rg", "--hidden", "--files", "--glob", "!.git/*" },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
}
