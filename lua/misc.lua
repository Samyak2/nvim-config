-- show line numbers
vim.o.number = true
vim.wo.number = true

-- the correct way to split
vim.o.splitright = true
vim.o.splitbelow = true

-- start scrolling once you reach last
-- 3 visible lines of buffer
vim.o.scrolloff = 3
vim.wo.scrolloff = 3

-- backspace (delete) over indent, etc.
vim.o.backspace = 'indent,eol,start'

-- searching
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- visualize tabs and newlines
vim.o.listchars = 'tab:▸ ,trail:·,nbsp:⎵'
vim.wo.listchars = 'tab:▸ ,trail:·,nbsp:⎵'
vim.o.list = true
vim.wo.list = true

-- backup options
vim.o.backup = true
vim.o.undofile = true
vim.bo.undofile = true

-- save temporary and backup files to neovim's data dir
-- instead of the file's current dir
vim.o.backupdir = DATA_PATH .. '/backup'
vim.o.directory = DATA_PATH .. '/directory'
vim.o.undodir = DATA_PATH .. '/undo'

