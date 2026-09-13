local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

g.mapleader = ','

require("config.lazy")

opt.termguicolors = true

require 'xemucy'

-- Temporarily source the vim part
cmd('source ~/.config/nvim/vimconfig.vim')

opt.expandtab = true
opt.ignorecase = true
opt.inccommand = 'split'
opt.list = true
opt.scrolloff = 3
opt.shiftwidth = 2
opt.smartcase = true
opt.softtabstop = 2
opt.tabstop = 2
opt.wildmode = 'longest:full,full'
opt.mouse = 'a'
opt.number = true
opt.relativenumber = true

opt.listchars = { tab = "▸ ", trail = "▫" }

opt.completeopt = "menuone,noinsert,noselect"
opt.shortmess:append("c")

local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})

-- 100ms of no cursor movement to trigger CursorHold
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
vim.keymap.set("n", "g[", function() vim.diagnostic.jump({ count = -1, float = true }) end)
vim.keymap.set("n", "g]", function() vim.diagnostic.jump({ count = 1, float = true }) end)

vim.keymap.set('n', 'j', 'gj', { silent = true })
vim.keymap.set('n', 'k', 'gk', { silent = true })

require'config/treesitter'
require'config/telescope'
require'config/lsp'
require'config/lualine'
require'config/comment'
require'config/snippets'

local ft_grp = vim.api.nvim_create_augroup("FiletypeTweaks", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  command = "setlocal indentkeys-=.",
  group = ft_grp,
})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.odin",
  callback = function() vim.lsp.buf.format({ async = false }) end,
  group = ft_grp,
})
