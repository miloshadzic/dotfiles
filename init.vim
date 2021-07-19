" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'tjdevries/colorbuddy.nvim'
Plug '~/src/hemisu.nvim'

Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Rust
Plug 'neovim/nvim-lspconfig'
" Extensions to built-in LSP, for example, providing type inlay hints
Plug 'nvim-lua/lsp_extensions.nvim'
" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'

Plug 'noprompt/vim-yardoc'
Plug 'ngmy/vim-rubocop'
Plug 'janko-m/vim-test'

Plug 'tpope/vim-fugitive'

Plug 'hoob3rt/lualine.nvim'
Plug 'hrsh7th/nvim-compe'

" Initialize plugin system
call plug#end()

set clipboard=unnamedplus

set shell=$SHELL

let g:loaded_compe_snippets_nvim=0
let g:loaded_compe_treesitter=0
let g:loaded_compe_spell=0
let g:loaded_compe_path=0
let g:loaded_compe_nvim_lua=0
let g:loaded_compe_calc=0
let g:loaded_compe_tags=0
let g:loaded_compe_emoji=0

set termguicolors
syntax on

colorscheme hemisu

set autoindent
set autoread
set encoding=utf-8
set expandtab
set ignorecase
set incsearch
set inccommand=split
set laststatus=2
set list
set listchars=tab:▸\ ,trail:▫
set ruler
set scrolloff=3
set shiftwidth=2
set showcmd
set smartcase
set softtabstop=2
set tabstop=2
set wildmenu
set wildmode=longest,list,full
set mouse=a
set number

set completeopt=menuone,noselect

let mapleader = ','
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>

set grepprg=rg\ --color=never
set wildignore=*/tmp/*,*.so,*.swp,*.zip,vendor/bundle/**,*/bin/*

" test maps
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let g:rspec_command = "te next bundle exec rspec {spec}"

let g:rustfmt_autosave = 1

autocmd! bufwritepost init.vim source ~/.config/nvim/init.vim

    
" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }

" Lua plugin init
lua <<EOF
require('lualine').setup {
  options = {
    theme = 'iceberg_dark',
    section_separators = '',
    component_separators = '',
    icons_enabled = 0
  }
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

-- function to attach completion when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
end

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
EOF
