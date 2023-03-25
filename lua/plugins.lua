return require('packer').startup(function(use)
    -- the "package manager"?
    use 'wbthomason/packer.nvim'

    -- LSP stuff
    use {
        'neovim/nvim-lspconfig',
        requires = {
            {
                -- WARN: Unfortunately we won't be able to lazy load this
                'hrsh7th/cmp-nvim-lsp',
            },
            {
                'williamboman/mason.nvim',
                run = ':MasonUpdate' -- :MasonUpdate updates registry contents
            },
            {
                'williamboman/mason-lspconfig.nvim',
            },
            {
                'tamago324/nlsp-settings.nvim',
            }
        },
        config = function()
            require("lsps")
        end
    }
    -- for lsp in statusline
    use {
        'nvim-lua/lsp-status.nvim',
        after = "nvim-lspconfig",
    }

    -- completion
    use {
        {
            'hrsh7th/nvim-cmp',
            config = function()
                require("cmp_conf")
            end,
            requires = {
                -- snippets
                {
                    'rafamadriz/friendly-snippets',
                },
                {
                    'hrsh7th/vim-vsnip',
                },
                {
                    'onsails/lspkind.nvim',
                }
            }
        },
        {
            'hrsh7th/cmp-vsnip',
            after = "nvim-cmp",
        },
        {
            'hrsh7th/cmp-buffer',
            after = "nvim-cmp",
        },
        {
            'hrsh7th/cmp-path',
            after = "nvim-cmp",
        },
        {
            'hrsh7th/cmp-cmdline',
            after = "nvim-cmp",
        },
        {
            'davidsierradz/cmp-conventionalcommits',
            after = "nvim-cmp",
        },
        {
            'andersevenrud/cmp-tmux',
            after = "nvim-cmp",
        },
        {
            'petertriho/cmp-git',
            requires = 'nvim-lua/plenary.nvim',
            after = "nvim-cmp",
            config = function()
                require("cmp_git").setup {
                    filetypes = { "gitcommit", "octo", "markdown" },
                }
            end
        },
        {
            'hrsh7th/cmp-nvim-lsp-document-symbol',
            after = "nvim-cmp",
        },
    }

    -- ast and stuff - gives highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('treesitter_conf')
        end
    }
    use {
        'nvim-treesitter/playground',
        after = 'nvim-treesitter'
    }

    -- must have for comments
    use {
        'tpope/vim-commentary',
    }

    -- must have for quotes, brackets, etc.
    use {
        'tpope/vim-surround',
    }

    -- must have for html
    use {
        'mattn/emmet-vim',
        ft = { "html", "svelte" }
    }

    -- the statusline
    -- use {
    --     "rebelot/heirline.nvim",
    --     requires = {'kyazdani42/nvim-web-devicons'}
    -- }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- colorschemes
    -- use 'rafi/awesome-vim-colorschemes'
    -- use 'savq/melange'
    -- use 'axvr/photon.vim'
    -- use 'danilo-augusto/vim-afterglow'
    -- use "rafamadriz/neon"
    -- use {
    --     "rebelot/kanagawa.nvim",
    --     config = function()
    --         vim.cmd("colorscheme kanagawa")
    --     end
    -- }
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
    -- use {
    --     'PyGamer0/darc.nvim',
    --     requires = {'rktjmp/lush.nvim'},
    --     config = function()
    --         vim.cmd("colorscheme darc")
    --     end
    -- }
    -- use {
    --     'Scysta/pink-panic.nvim',
    --     requires = {'rktjmp/lush.nvim'},
    --     config = function()
    --         vim.cmd("set background=light")
    --         vim.cmd("colorscheme pink-panic")
    --     end
    -- }
    use {
        'mcchrish/zenbones.nvim',
        requires = { 'rktjmp/lush.nvim' },
        config = function()
            -- vim.cmd("colorscheme forestbones")
            vim.cmd("colorscheme tokyobones")
        end
    }

    -- file tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require('nvim_tree_conf')
        end
    }

    -- markdown previews
    use {
        'iamcco/markdown-preview.nvim',
        ft = { 'markdown' },
        cmd = { 'MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle' },
        config = "vim.call('mkdp#util#install')"
    }

    -- fuzzy finder and more
    use {
        {
            'nvim-telescope/telescope.nvim',
            requires = {
                { 'nvim-lua/popup.nvim' },
                { 'nvim-lua/plenary.nvim' },
            },
            config = function()
                require('telescope_conf')
            end
        },
        {
            'nvim-telescope/telescope-fzy-native.nvim',
            after = 'telescope.nvim',
            config = function()
                require('telescope').load_extension('fzy_native')
            end
        }
    }

    -- speeed
    use {
        'ggandor/leap.nvim',
        config = function()
            require("leap_conf")
        end
    }

    -- git signs - show changed lines in gutter, etc.
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns_conf')
        end
    }

    -- nice plugin to get GitHub URL from source file
    use {
        'pgr0ss/vim-github-url',
        cmd = { "GitHubURL", "GitHubURLRepo", "GitHubURLBlob", "GitHubURLBlame" },
    }

    -- undo tree visualization
    use {
        'mbbill/undotree',
        cmd = { "UndotreeToggle" },
    }

    -- nicer keybinds
    use 'LionC/nest.nvim'

    -- rust goodies
    use {
        'simrat39/rust-tools.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'mfussenegger/nvim-dap'
        },
    }

    -- nicer S-expr editing. lisp ftw.
    use {
        'eraserhd/parinfer-rust',
        cmd = 'ParinferOn',
        run = 'if [ -x "$(command -v cargo)" ]; then; cargo build --release; fi',
    }

    -- vimwiki!
    use {
        'vimwiki/vimwiki',
        branch = 'dev'
    }

    -- session manager
    use {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
            }
        end
    }
end)
