return require('packer').startup(function(use)
    -- the "package manager"?
    use 'wbthomason/packer.nvim'

    -- LSP stuff
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    -- for lsp in statusline
    use 'nvim-lua/lsp-status.nvim'

    -- coq
    use { 'ms-jpq/coq_nvim', branch = 'coq'} -- main one
    use { 'ms-jpq/coq.artifacts', branch= 'artifacts'} -- 9000+ Snippets


    -- ast and stuff - gives highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/playground'

    -- must have for comments
    use 'tpope/vim-commentary'

    -- must have for quotes, brackets, etc.
    use 'tpope/vim-surround'

    -- must have for html
    use 'mattn/emmet-vim'

    -- the statusline
    use {
        "rebelot/heirline.nvim",
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- colorschemes
    -- use 'rafi/awesome-vim-colorschemes'
    -- use 'savq/melange'
    -- use 'axvr/photon.vim'
    -- use 'danilo-augusto/vim-afterglow'
    -- use "rafamadriz/neon"
    use "rebelot/kanagawa.nvim"

    -- file tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function() require'nvim-tree'.setup {} end
    }

    -- markdown previews
    use {
        'iamcco/markdown-preview.nvim',
        ft = {'markdown'},
        cmd = {'MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle'},
        config = "vim.call('mkdp#util#install')"
    }

    -- fuzzy finder and more
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {
        'nvim-telescope/telescope-fzy-native.nvim',
        requires = {{'nvim-telescope/telescope.nvim'}}
    }

    -- git signs - show changed lines in gutter, etc.
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      }
    }

    -- rust goodies
    use {
        'simrat39/rust-tools.nvim',
        requires = {
          'nvim-lua/plenary.nvim',
          'mfussenegger/nvim-dap'
        }
    }

    -- session manager
    use {
        'rmagatti/auto-session'
    }
end)
