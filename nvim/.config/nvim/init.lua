local opt = vim.opt
local g = vim.g

g.mapleader = ','

require("config.lazy")

opt.termguicolors = true

require 'xemucy'

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
opt.wildignore = { '*/tmp/*', '*.so', '*.swp', '*.zip', 'vendor/bundle/**', '*/bin/*' }
opt.mouse = 'a'
opt.number = true
opt.relativenumber = true
opt.clipboard = 'unnamedplus'
opt.grepprg = 'rg --color=never'

-- have a fixed column for the diagnostics to appear in
-- this removes the jitter when warnings/errors flow in
opt.signcolumn = 'yes'

opt.listchars = { tab = "▸ ", trail = "▫" }

opt.completeopt = "menuone,noinsert,noselect"
opt.shortmess:append("c")

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

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files)
vim.keymap.set('n', '<leader>g', builtin.live_grep)
vim.keymap.set('n', '<leader>b', builtin.buffers)
vim.keymap.set('n', '<leader>h', builtin.help_tags)
vim.keymap.set('n', '<leader>p', builtin.treesitter)

-- vim-test
vim.keymap.set('n', '<leader>t', '<cmd>TestNearest<cr>', { silent = true })
vim.keymap.set('n', '<leader>T', '<cmd>TestFile<cr>', { silent = true })
vim.keymap.set('n', '<leader>a', '<cmd>TestSuite<cr>', { silent = true })
vim.keymap.set('n', '<leader>l', '<cmd>TestLast<cr>', { silent = true })

require'config/treesitter'
require'config/telescope'
require'config/lsp'
require'config/lualine'
require'config/snippets'

local ft_grp = vim.api.nvim_create_augroup("FiletypeTweaks", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  command = "setlocal indentkeys-=.",
  group = ft_grp,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  command = "setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4",
  group = ft_grp,
})
