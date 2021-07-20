-- nvim_lsp object
local nvim_lsp = require'lspconfig'

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach
}

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = false,
  }
)
