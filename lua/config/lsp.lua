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
      { name = "hrsh7th/cmp-nvim-lua" },
      { name = "hrsh7th/cmp-nvim-lsp-signature-help" },
      { name = "snippy" },
      { name = 'path' },
    }, {
      { name = "buffer", keyword_length = 3 },
    })
})

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = false,
  }
)

vim.lsp.config("emmet_language_server", {})

vim.lsp.enable('biome')

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

-- Configure LSP through rust-tools.nvim plugin.
-- rust-tools will configure and enable certain LSP features for us.
-- See https://github.com/simrat39/rust-tools.nvim#configuration
local opts = {
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = lsp_attach,
    capabilities = capabilities,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}

vim.lsp.config("rust-tools", opts)

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
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
