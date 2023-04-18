return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'lewis6991/impatient.nvim'

  use 'tjdevries/colorbuddy.nvim'
  use '~/src/hemisu.nvim'
  use '~/src/builder-dark.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'nvim-lua/popup.nvim'
  use 'numToStr/Comment.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use 'simrat39/rust-tools.nvim'
  use 'mfussenegger/nvim-dap'

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'ray-x/go.nvim'

  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/lsp_extensions.nvim'

  use("hrsh7th/nvim-cmp")
  use({
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    after = { "hrsh7th/nvim-cmp" },
    requires = { "hrsh7th/nvim-cmp" },
  })

  use 'janko-m/vim-test'

  use 'tpope/vim-fugitive'

  use 'hoob3rt/lualine.nvim'
end)
