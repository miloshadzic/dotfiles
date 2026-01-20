return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },

  'lewis6991/impatient.nvim',

  'tjdevries/colorbuddy.nvim',
  'git@github.com:miloshadzic/xemucy.git',
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  'nvim-lua/popup.nvim',
  'numToStr/Comment.nvim',

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },

  'simrat39/rust-tools.nvim',
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  'theHamsta/nvim-dap-virtual-text',
  'ray-x/guihua.lua',

  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  'ray-x/go.nvim',

  'neovim/nvim-lspconfig',
  'nvim-lua/lsp_extensions.nvim',
  { 'mihyaeru21/nvim-lspconfig-bundler', dependencies = 'neovim/nvim-lspconfig' },

  'dcampos/nvim-snippy',
  'honza/vim-snippets',

  "hrsh7th/nvim-cmp",
  {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-path",
    'dcampos/cmp-snippy',
    "hrsh7th/cmp-buffer",
    dependencies = { "hrsh7th/nvim-cmp" },
  },
  "stevearc/conform.nvim",

  'janko-m/vim-test',

  'tpope/vim-fugitive',

  'nvim-lualine/lualine.nvim',
}
