require 'plugins'

local opt = vim.opt
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local wo = vim.wo
local bo = vim.bo

g.mapleader = ','

o.clipboard = 'unnamedplus'

opt.shell = os.getenv('SHELL')

opt.termguicolors = true
g.syntax = true

require 'hemisu'

opt.completeopt = 'menuone,noselect'

-- Temporarily source the vim part
cmd('source ~/.config/nvim/vimconfig.vim')

opt.autoindent = true
opt.autoread = true
opt.encoding = 'utf-8'
opt.expandtab = true
opt.ignorecase = true
opt.incsearch = true
opt.inccommand = 'split'
opt.laststatus = 2
opt.list = true
opt.ruler = true
opt.scrolloff = 3
opt.shiftwidth = 2
opt.showcmd = true
opt.smartcase = true
opt.softtabstop = 2
opt.tabstop = 2
opt.wildmenu = true
opt.wildmode = 'longest,list,full'
opt.mouse = 'a'
wo.number = true

vim.opt.listchars.tab = '▸ '
vim.opt.listchars.trail = 'trail:▫'

-- Golang config --

-- Format on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').gofmt() ]], false)

-- Import on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

require'config/treesitter'
require'config/telescope'
require'config/nvim-cmp'
require'config/lsp'
require'config/lualine'
