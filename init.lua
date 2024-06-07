require 'plugins'

local opt = vim.opt
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local wo = vim.wo
local bo = vim.bo

g.mapleader = ','

opt.termguicolors = true
g.syntax = true

require 'hemisu'
-- require 'builder-dark'
-- vim.cmd [[colorscheme rasmus]]

opt.completeopt = 'menuone,noselect,longest'

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
opt.wildmode = 'longest:full,full'
opt.mouse = 'a'
wo.number = true
wo.relativenumber = true

opt.listchars = { tab = "▸ ", trail = "▫" }

vim.o.completeopt = "menuone,noinsert,noselect"
vim.opt.shortmess = vim.opt.shortmess + "c"

local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})

-- Set updatetime for CursorHold
-- 300ms of no cursor movement to trigger CursorHold
opt.updatetime = 100

-- Show diagnostic popup on cursor hover
local diag_float_grp = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
   vim.diagnostic.open_float(nil, { focusable = false })
  end,
  group = diag_float_grp,
})

-- Goto previous/next diagnostic warning/error
vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, keymap_opts)
vim.keymap.set("n", "g]", vim.diagnostic.goto_next, keymap_opts)

require'config/treesitter'
require'config/telescope'
require'config/lsp'
require'config/lualine'
require'config/comment'
require'config/snippets'
