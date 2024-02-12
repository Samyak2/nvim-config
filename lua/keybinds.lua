local default_opts = { silent = true }

-- Move up/down lines even when a line has been wrapped
vim.keymap.set("n", "j", "gj", default_opts)
vim.keymap.set("n", "k", "gk", default_opts)

-- clear search highlight
vim.keymap.set("n", "<C-s>", "<cmd>nohlsearch<cr>", default_opts)
