call plug#begin('~/.config/nvim/plugged')
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
Plug 'noprompt/vim-yardoc'
Plug 'ngmy/vim-rubocop'
Plug 'janko-m/vim-test'
Plug 'nixprime/cpsm', { 'do': 'env PY3=OFF ./install.sh' }
call plug#end()

let g:onedark_terminal_italics=1
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme smyck
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

map <Leader>f :CtrlP<CR>
map <Leader>b :CtrlPBuffer<CR>
set grepprg=rg\ --color=never
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_match_func = { 'match': 'cpsm#CtrlPMatch' }
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
