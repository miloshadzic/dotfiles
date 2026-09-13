nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>h <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>p <cmd>lua require('telescope.builtin').treesitter()<cr>

set grepprg=rg\ --color=never
set wildignore=*/tmp/*,*.so,*.swp,*.zip,vendor/bundle/**,*/bin/*
set clipboard=unnamedplus

" test maps
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>

let g:rustfmt_autosave = 1

augroup vimconfig
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
  autocmd FileType odin setlocal expandtab tabstop=4 shiftwidth=4
augroup END

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes
