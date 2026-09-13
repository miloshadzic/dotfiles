return {
  'tjdevries/colorbuddy.nvim',
  'git@github.com:miloshadzic/xemucy.git',
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate'
  },

  {
    'nvim-telescope/telescope.nvim', version = '^0.2',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },

  { 'mrcjkb/rustaceanvim', version = '^9', lazy = false },

  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  'neovim/nvim-lspconfig',

  {
    'saghen/blink.cmp',
    -- release tags download a pre-built fuzzy matcher binary
    version = '1.*',
    dependencies = {
      { 'L3MON4D3/LuaSnip', version = 'v2.*' },
      'honza/vim-snippets',
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
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("difftastic-nvim").setup({
        vcs = "git",
        download = true, -- Auto-download pre-built binary
        snacks_picker = {
          enabled = false,
        },
      })
    end,
  }
}
