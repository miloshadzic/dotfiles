return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'tjdevries/colorbuddy.nvim'
  use 'git@github.com:miloshadzic/hemisu.nvim.git'

  use 'christianchiarulli/nvcode-color-schemes.vim'
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'

  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/lsp_extensions.nvim'

  use 'noprompt/vim-yardoc'
  use 'ngmy/vim-rubocop'
  use 'janko-m/vim-test'

  use 'tpope/vim-fugitive'

  use 'hoob3rt/lualine.nvim'

  use 'ziglang/zig.vim'
end)
