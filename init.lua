require("plugins")
require("lsps")

print("hello")

-- helpful function for debugging:
-- from: https://github.com/nanotee/nvim-lua-guide#tips-2
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

-- to evaluate vim in lua
-- vim.api.nvim_eval('1 + 1')

-- to execute command in lua
-- vim.api.nvim_command('set nonumber') or vim.cmd()

-- getting/setting vim options - https://github.com/nanotee/nvim-lua-guide#using-api-functions
-- alternative: https://github.com/nanotee/nvim-lua-guide#using-meta-accessors

-- getting/setting vim global vars - vim.api.nvim_set_var()
-- https://github.com/nanotee/nvim-lua-guide#using-api-functions-1
-- alternative: https://github.com/nanotee/nvim-lua-guide#using-meta-accessors-1

-- keymaps - https://github.com/nanotee/nvim-lua-guide#defining-mappings

-- helper function to automatically escape term keycodes
-- ref: https://github.com/nanotee/nvim-lua-guide#vimapinvim_replace_termcodes
-- The function is called `t` for `termcodes`.
-- You don't have to call it that, but I find the terseness convenient
local function t(str)
    -- Adjust boolean arguments as needed
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
