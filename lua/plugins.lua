return require('packer').startup(function(use)
    -- the "package manager"?
    use 'wbthomason/packer.nvim'

    -- LSP stuff
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'
    use 'hrsh7th/nvim-compe'
    -- use 'glepnir/lspsaga.nvim'

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

    -- colorschemes
    use 'rafi/awesome-vim-colorschemes'

    -- file tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    -- markdown previews
    use {
        'iamcco/markdown-preview.nvim',
        ft = {'markdown'},
        cmd = {'MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle'},
        config = "vim.call('mkdp#util#install')"
    }
end)
