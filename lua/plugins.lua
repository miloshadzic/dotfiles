return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'lewis6991/impatient.nvim'

  use 'tjdevries/colorbuddy.nvim'
  use '~/src/hemisu.nvim'
  use '~/src/builder-dark.nvim'
  use 'kvrohit/rasmus.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'nvim-lua/popup.nvim'
  use 'numToStr/Comment.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'simrat39/rust-tools.nvim'
  use 'mfussenegger/nvim-dap'

  use {'nvim-telescope/telescope-fzy-native.nvim', run = 'make' }

  use 'ray-x/go.nvim'

  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/lsp_extensions.nvim'

  use ({
    'dcampos/nvim-snippy',
    'honza/vim-snippets',
  })

  use("hrsh7th/nvim-cmp")
  use({
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-path",
    'dcampos/cmp-snippy',
    "hrsh7th/cmp-buffer",
    after = { "hrsh7th/nvim-cmp" },
    requires = { "hrsh7th/nvim-cmp" },
  })

  use 'janko-m/vim-test'

  use 'tpope/vim-fugitive'

  use 'hoob3rt/lualine.nvim'
end)
