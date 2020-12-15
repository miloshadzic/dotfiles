call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'brendonrapp/smyck-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'noprompt/vim-yardoc'
Plug 'ngmy/vim-rubocop'
Plug 'janko-m/vim-test'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 'noahfrederick/vim-hemisu'
call plug#end()

let g:onedark_terminal_italics=1
syntax on
colorscheme hemisu
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
highlight Comment cterm=italic
let g:airline_theme='base16'

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

set shell=$SHELL

let mapleader = ','

nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>F :Files <C-r>=expand("%:h")<CR>/<CR>
nnoremap <silent> <leader>b :Buffers<CR>
set grepprg=rg\ --color=never
set wildignore=*/tmp/*,*.so,*.swp,*.zip,vendor/bundle/**,*/bin/*

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let g:rspec_command = "te bundle exec rspec {spec}"

let g:rustfmt_autosave = 1

autocmd! bufwritepost .vimrc source ~/.nvim/config/init.vim

let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
