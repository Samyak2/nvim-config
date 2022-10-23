-- "inspired" by Primeagen's setup
-- https://github.com/awesome-streamers/awesome-streamerrc/blob/master/ThePrimeagen/lua/theprimeagen/telescope.lua

require('telescope').setup {
    defaults = {
        -- use fzy native sorter for spid
        file_sorter = require('telescope.sorters').get_fzy_sorter,
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
