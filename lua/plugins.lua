return require('packer').startup(function(use)
    -- the "package manager"?
    use 'wbthomason/packer.nvim'

    -- LSP stuff
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    -- for lsp in statusline
    use 'nvim-lua/lsp-status.nvim'

    -- completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp-document-symbol'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use {'petertriho/cmp-git', requires = 'nvim-lua/plenary.nvim'}
    use 'davidsierradz/cmp-conventionalcommits'
    use 'andersevenrud/cmp-tmux'
    use 'onsails/lspkind.nvim'
    -- snippets
    use 'rafamadriz/friendly-snippets'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

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
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    -- colorschemes
    -- use 'rafi/awesome-vim-colorschemes'
    -- use 'savq/melange'
    -- use 'axvr/photon.vim'
    -- use 'danilo-augusto/vim-afterglow'
    -- use "rafamadriz/neon"
    use {
        "rebelot/kanagawa.nvim",
        config = function()
            vim.cmd("colorscheme kanagawa")
        end
    }
    -- use {
    --     "glepnir/zephyr-nvim",
    --     config = function()
    --         vim.cmd("colorscheme zephyr")
    --     end
    -- }
    -- use {
    --     "devnnys/orca.nvim",
    --     config = function()
    --         vim.cmd("colorscheme orca")
    --     end
    -- }
    -- use {
    --     "rose-pine/neovim",
    --     as = "rose-pine",
    --     tag = "v1.*",
    --     config = function()
    --         vim.cmd("colorscheme rose-pine")
    --     end
    -- }

    -- file tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
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

    -- nicer keybinds
    use 'LionC/nest.nvim'

    -- rust goodies
    use {
        'simrat39/rust-tools.nvim',
        requires = {
          'nvim-lua/plenary.nvim',
          'mfussenegger/nvim-dap'
        }
    }

    -- vimwiki!
    use { 'vimwiki/vimwiki', branch='dev' }

    -- session manager
    use {
        'rmagatti/auto-session'
    }
end)
