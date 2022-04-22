local nest = require('nest')

nest.applyKeymaps {
    -- move up/down lines nicely even when a line has been wrapped
    { "j", "gj" },
    { "k", "gk" },
    { mode = "i", {
        -- use tab to navigate completions
        { options = { expr = true }, {
            { "<Tab>", "v:lua.tab_complete()" },
            { "<S-Tab>", "v:lua.s_tab_complete()" },
        }}
    }},
    { mode = "s", {
        -- use tab to navigate completions
        { options = { expr = true }, {
            { "<Tab>", "v:lua.tab_complete()" },
            { "<S-Tab>", "v:lua.s_tab_complete()" },
        }}
    }},
    -- for nvim-tree.lua
    { "<C-f>", ":NvimTreeToggle<CR>" },
    -- telescope
    { "<leader>", {
        { "f", {
            { "f", "<cmd>Telescope find_files<cr>" },
            { "g", "<cmd>Telescope live_grep<cr>" },
            { "b", "<cmd>Telescope buffers<cr>" },
            { "h", "<cmd>Telescope help_tags<cr>" },
            { "s", "<cmd>Telescope grep_string<cr>" },
            { "z", "<cmd>Telescope spell_suggest<cr>" },
            { "c", "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
            { "r", "<cmd>Telescope resume<cr>" },
        }},
    }}
}
