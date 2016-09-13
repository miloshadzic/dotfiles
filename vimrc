set nocompatible
syntax on
filetype on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Bundle 'VundleVim/Vundle.vim'

Bundle 'tpope/vim-fugitive'
Bundle "rking/ag.vim"
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-haml'
Bundle "kien/ctrlp.vim"
Bundle "rust-lang/rust.vim"
Bundle "tpope/vim-markdown"
Bundle "thoughtbot/vim-rspec"
Bundle 'L9'
Bundle 'scrooloose/syntastic'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'fatih/vim-go'
Plugin 'slim-template/vim-slim'
Plugin 'dracula/vim'

filetype plugin indent on
colorscheme dracula
set background=dark

set autoindent
set autoread
set encoding=utf-8
set expandtab
set ignorecase
set incsearch
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
set wildignore=*/tmp/*,*.so,*.swp,*.zip,*/vendor/bundle/*,*/bin/*

let mapleader = ','

let g:ctrlp_map = '<Leader>f'
let g:ctrlp_cmd = 'CtrlP'
nmap <Leader>b :CtrlPBuffer<cr>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:rustfmt_autosave = 1

autocmd! bufwritepost .vimrc source ~/.vimrc
