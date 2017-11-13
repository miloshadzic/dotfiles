call plug#begin('~/.config/nvim/plugged')
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/syntastic'
Plug 'reedes/vim-pencil'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'brendonrapp/smyck-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:onedark_terminal_italics=1
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme smyck
highlight Comment cterm=italic

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
set wildignore=*/tmp/*,*.so,*.swp,*.zip,*/vendor/bundle/*,*/bin/*

let mapleader = ','

map <Leader>f :CtrlP<CR>
map <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "te bundle exec rspec {spec}"

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

map <Leader>s :SyntasticToggleMode<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:rustfmt_autosave = 1

let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0


autocmd! bufwritepost .vimrc source ~/.vimrc
