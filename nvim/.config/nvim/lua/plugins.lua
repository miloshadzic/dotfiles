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

  { 'mrcjkb/rustaceanvim', version = '^6', lazy = false },
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

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-path",
      'dcampos/cmp-snippy',
      "hrsh7th/cmp-buffer",
    },
  },
  "stevearc/conform.nvim",

  'janko-m/vim-test',

  'tpope/vim-fugitive',

  {
    "FabijanZulj/blame.nvim",
    lazy = false,
    config = function()
      require('blame').setup {}
    end,
  },

  'nvim-lualine/lualine.nvim',

  {
    "clabby/difftastic.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      -- optional: only needed for :DifftPick
      "folke/snacks.nvim",
    },
    config = function()
      require("difftastic-nvim").setup({
        vcs = "git",
        download = true, -- Auto-download pre-built binary
        snacks_picker = {
          enabled = true,
        },
      })
    end,
  }
}
