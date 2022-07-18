# Neovim configuration files

My custom neovim configuration written in (mostly) lua.

## Requirements

 - neovim v0.7.0 (most things will work in v0.6.0, but there will be errors on startup)
 - [`packer.nvim`](https://github.com/wbthomason/packer.nvim#quickstart) - the plugin manager
 - [ripgrep](https://github.com/BurntSushi/ripgrep#installation) - for telescope fuzzy finding in files
 - `go` (>=1.16) - required to install `efm` which provides linting and formatting for many languages
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

