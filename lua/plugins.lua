return require('packer').startup(function(use)
    -- the "package manager"?
    use 'wbthomason/packer.nvim'

    -- LSP stuff
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'

    -- must have for comments
    use 'tpope/vim-commentary'

    -- must have for quotes, brackets, etc.
    use 'tpope/vim-surround'

    -- the statusline
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        -- some optional icons
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
end)
