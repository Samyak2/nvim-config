# Neovim configuration files

My custom neovim configuration written in (mostly) lua.

## Requirements

 - [`packer.nvim`](https://github.com/wbthomason/packer.nvim#quickstart) - the plugin manager
 - [ripgrep](https://github.com/BurntSushi/ripgrep#installation) - for telescope fuzzy finding in files
 - python venv - required by `coq_nvim` (more info in [coq's README](https://github.com/ms-jpq/coq_nvim#install))
 - `lldb` if you need Rust debugging

## Code structure

 - `init.lua`: main file which Neovim loads
 - `vimscript`: legacy vimscript stuff that could not be ported over to Lua
 - `lua`
    - `keybinds.lua`
    - `plugins.lua`
    - `statusline.lua`: self-explanatory
    - `misc.lua`: other configurations such as line numbers, splits, tabs, whitespaces, colorschemes, etc.
    - `lsp`:
        - additional per-LSP configurations
    - `lsps.lua`: global LSP configuration

## Related projects

 - [LunarVim](https://github.com/ChristianChiarulli/LunarVim)

