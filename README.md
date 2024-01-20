# Neovim configuration files

My custom neovim configuration written in (mostly) lua.

## Requirements

 - neovim v0.9.5 (untested on other versions, might work)
 - [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
    - for telescope fuzzy finding in files
 - `go` (>=1.16)
    - to install [`efm`](https://github.com/mattn/efm-langserver) which provides linting and formatting for many languages
 - `gcc`
    - to build treesitter parsers
    - only needed when the treesitter plugin is installed/updated
    - If you use nix, see `shell.nix` that includes dependencies for this
 - (optional) `yarn`
    - to install [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
    - delete `lua/plugins/markdown_plugins.lua` if you don't need this


## Usage

- Plugins
    - See [Lazy.nvim](https://github.com/folke/lazy.nvim?tab=readme-ov-file#-usage)
    - Use `:Lazy sync` to update plugins
- LSP
    - After opening a file you want LSP support for, run `:LspInstall` and select the server you want installed. Restart neovim after it completes. This uses [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
    - See `lua/lsp/init.lua` for keybinds set for LSP stuff

## Code structure

All lua files are formatted using stylua.

 - `init.lua`: main file which Neovim loads
 - `vimscript`: legacy vimscript stuff that could not be ported over to Lua
 - `lua`
    - `plugins/`
        - If you don't want/need some of them, simply delete those files
    - `lsps.lua` and `lsp/`
    - `misc.lua`: other configurations such as line numbers, splits, tabs, whitespaces, colorschemes, etc.
    - Other files are plugin-specific configurations. I should probably move them.
