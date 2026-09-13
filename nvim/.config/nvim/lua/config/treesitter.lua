local ts = require('nvim-treesitter')

-- No-op for parsers that are already installed
ts.install {
  'bash', 'c', 'css', 'embedded_template', 'fish', 'go', 'html', 'javascript',
  'json', 'lua', 'markdown', 'markdown_inline', 'query', 'ruby', 'rust',
  'sql', 'toml', 'tsx', 'typescript', 'vim', 'vimdoc', 'yaml',
}

-- Highlighting and indentation for any buffer that has a parser.
-- Incremental selection is built into Neovim 0.12: `an`/`in` in visual mode.
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('TreesitterStart', { clear = true }),
  callback = function(args)
    if not pcall(vim.treesitter.start, args.buf) then
      return
    end
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
