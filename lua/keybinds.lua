local default_opts = { silent = true }

-- Move up/down lines even when a line has been wrapped
vim.keymap.set('n', 'j', 'gj', default_opts)
vim.keymap.set('n', 'k', 'gk', default_opts)

-- nvim-tree.lua
vim.keymap.set('n', '<C-f>', ':Fern . -reveal=%<CR>', default_opts)

-- Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', default_opts)
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', default_opts)
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', default_opts)
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', default_opts)
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope grep_string<cr>', default_opts)
vim.keymap.set('n', '<leader>fz', '<cmd>Telescope spell_suggest<cr>', default_opts)
vim.keymap.set('n', '<leader>fc', '<cmd>Telescope current_buffer_fuzzy_find<cr>', default_opts)
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope resume<cr>', default_opts)
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', default_opts)
