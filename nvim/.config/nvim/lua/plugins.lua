return {
  'tjdevries/colorbuddy.nvim',
  'git@github.com:miloshadzic/xemucy.git',
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate'
  },

  'numToStr/Comment.nvim',

  {
    'nvim-telescope/telescope.nvim', version = '^0.2',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },

  { 'mrcjkb/rustaceanvim', version = '^9', lazy = false },
  'mfussenegger/nvim-dap',
  { 'rcarriga/nvim-dap-ui', dependencies = { 'nvim-neotest/nvim-nio' } },
  'theHamsta/nvim-dap-virtual-text',
  'ray-x/guihua.lua',

  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  'ray-x/go.nvim',

  'neovim/nvim-lspconfig',

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
