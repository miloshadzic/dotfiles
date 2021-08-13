require 'plugins'

vim.g.mapleader = ','

require 'hemisu'

-- Temporarily source the vim part
vim.cmd('source ~/.config/nvim/vimconfig.vim')

local o = vim.o
local wo = vim.wo
local bo = vim.bo

o.autoindent = true
o.autoread = true
o.encoding = 'utf-8'
o.expandtab = true
o.ignorecase = true
o.incsearch = true
o.inccommand = 'split'
o.laststatus = 2
o.list = true
o.ruler = true
o.scrolloff = 3
o.shiftwidth = 2
o.showcmd = true
o.smartcase = true
o.softtabstop = 2
o.tabstop = 2
o.wildmenu = true
o.wildmode = 'longest,list,full'
o.mouse = 'a'
wo.number = true

vim.opt.listchars.tab = '▸ '
vim.opt.listchars.trail = 'trail:▫'

require'config/treesitter'
require'config/telescope'
require'config/lsp'
require'config/lualine'
