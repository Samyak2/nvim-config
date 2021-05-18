# Neovim configuration files

My custom neovim configuration written in (mostly) lua.

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

