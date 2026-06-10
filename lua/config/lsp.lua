-- nvim_lsp object
local cmp = require'cmp'

cmp.setup({
    preselect = cmp.PreselectMode.None,
    view = {
      entries = "native"
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true
      }),
    },
    snippet = {
      expand = function(args)
        require 'snippy'.expand_snippet(args.body)
      end
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = "nvim_lua" },
      { name = "nvim_lsp_signature_help" },
      { name = "snippy" },
      { name = 'path' },
    }, {
      { name = "buffer", keyword_length = 3 },
    })
})

-- Diagnostics display
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
})

vim.lsp.config("emmet_language_server", {})

vim.lsp.enable('biome')

vim.lsp.enable('herb_ls')

-- Setup buffer-local keymaps / options for LSP buffers
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_attach = function(client, buf)
	-- Example maps, set your own with vim.api.nvim_buf_set_keymap(buf, "n", <lhs>, <rhs>, { desc = <desc> })
	-- or a plugin like which-key.nvim
	-- <lhs>        <rhs>                        <desc>
	-- "K"          vim.lsp.buf.hover            "Hover Info"
	-- "<leader>qf" vim.diagnostic.setqflist     "Quickfix Diagnostics"
	-- "[d"         vim.diagnostic.goto_prev     "Previous Diagnostic"
	-- "]d"         vim.diagnostic.goto_next     "Next Diagnostic"
	-- "<leader>e"  vim.diagnostic.open_float    "Explain Diagnostic"
	-- "<leader>ca" vim.lsp.buf.code_action      "Code Action"
	-- "<leader>cr" vim.lsp.buf.rename           "Rename Symbol"
	-- "<leader>fs" vim.lsp.buf.document_symbol  "Document Symbols"
	-- "<leader>fS" vim.lsp.buf.workspace_symbol "Workspace Symbols"
	-- "<leader>gq" vim.lsp.buf.formatting_sync  "Format File"

	vim.api.nvim_buf_set_option(buf, "formatexpr", "v:lua.vim.lsp.formatexpr()")
	vim.api.nvim_buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
	vim.api.nvim_buf_set_option(buf, "tagfunc", "v:lua.vim.lsp.tagfunc")
end

-- Rust LSP via rustaceanvim. Do NOT call vim.lsp.config/enable for
-- rust_analyzer or rustaceanvim.setup() -- rustaceanvim manages the server
-- itself; it only reads this global. See https://github.com/mrcjkb/rustaceanvim
vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, buf)
      lsp_attach(client, buf)
      -- Inlay hints on for Rust buffers (replaces rust-tools tools.inlay_hints.auto)
      vim.lsp.inlay_hint.enable(true, { bufnr = buf })
    end,
    capabilities = capabilities,
    default_settings = {
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = { command = "clippy" },
        -- replaces rust-tools' show_parameter_hints = false
        inlayHints = {
          parameterHints = { enable = false },
        },
      },
    },
  },
}

vim.lsp.config("ts_ls", {})

vim.lsp.config("gopls", {
  settings = {
    gopls = {
      gofumpt = true
    }
  }
})

vim.lsp.config("ruby_lsp", {
  init_options = {
    formatter = 'standard',
    linters = { 'standard' },
  },
})

vim.lsp.config("clangd", {})

vim.lsp.config("sqlls", {
  cmd = {"sql-language-server", "up", "--method", "stdio"}
})

require('go').setup(
)

vim.lsp.config('lspconfig-bundler', {})
vim.lsp.config("solargraph", {})

-- Actually start the configured servers. vim.lsp.config() only registers
-- settings; vim.lsp.enable() is what attaches the server to matching buffers.
vim.lsp.enable({
  "emmet_language_server",
  "ts_ls",
  "gopls",
  "ruby_lsp",
  "clangd",
  "sqlls",
})
-- Note: solargraph intentionally left disabled to avoid running two Ruby
-- LSPs alongside ruby_lsp. Enable it instead of ruby_lsp if you prefer it.

require("conform").setup({
  formatters = {
    biome = {
      require_cwd = true,
    },
  },
  formatters_by_ft = {
    rust =  { "rustfmt", lsp_format = "fallback" },
    ruby =  { "rubyfmt", lsp_format = "fallback" },
    html =  { "htmlbeautifier", lsp_format = "fallback" },
    eruby = { "htmlbeautifier", lsp_format = "fallback" },


    json = { "biome-check", "biome", stop_after_first = true },
    css = { "biome-check", "biome", stop_after_first = true },
    javascript = { "biome-check", "biome", "prettierd", "prettier", stop_after_first = true },
    typescript = { "biome-check", "biome", stop_after_first = true },
  }
})
