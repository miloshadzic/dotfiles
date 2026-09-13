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
  -- Shown in a float on CursorHold instead (see init.lua)
  virtual_text = false,
  signs = true,
  update_in_insert = false,
})

vim.lsp.config("emmet_language_server", {})

vim.lsp.enable('biome')

-- Advertise nvim-cmp completion capabilities to every server
local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("*", { capabilities = capabilities })

-- Rust LSP via rustaceanvim. Do NOT call vim.lsp.config/enable for
-- rust_analyzer or rustaceanvim.setup() -- rustaceanvim manages the server
-- itself; it only reads this global. See https://github.com/mrcjkb/rustaceanvim
vim.g.rustaceanvim = {
  server = {
    on_attach = function(_, buf)
      -- Inlay hints on for Rust buffers (replaces rust-tools tools.inlay_hints.auto)
      vim.lsp.inlay_hint.enable(true, { bufnr = buf })
    end,
    capabilities = capabilities,
    default_settings = {
      ["rust-analyzer"] = {
        -- enable clippy on save
        check = { command = "clippy" },
        -- replaces rust-tools' show_parameter_hints = false
        inlayHints = {
          parameterHints = { enable = false },
        },
      },
    },
  },
}

vim.lsp.config("tsc", {})

vim.lsp.config("gopls", {
  settings = {
    gopls = {
      gofumpt = true
    }
  }
})

vim.lsp.config("ruby_lsp", {
  -- Scope ruby_lsp to plain Ruby. By default lspconfig also attaches it to
  -- `eruby`, where its rubocop diagnostics would compete with herb_ls. herb
  -- is the default linter for html/erb (see herb_ls in vim.lsp.enable below).
  filetypes = { 'ruby' }
})

vim.lsp.config("clangd", {})

vim.lsp.config("sqlls", {
  cmd = {"sql-language-server", "up", "--method", "stdio"}
})

-- Actually start the configured servers. vim.lsp.config() only registers
-- settings; vim.lsp.enable() is what attaches the server to matching buffers.
vim.lsp.enable({
  "emmet_language_server",
  "tsc",
  "gopls",
  "ruby_lsp",
  -- herb_ls: HTML+ERB language server, the default linter for html/eruby.
  "herb_ls",
  "clangd",
  "sqlls",
})
-- Note: solargraph intentionally left disabled to avoid running two Ruby
-- LSPs alongside ruby_lsp. Enable it instead of ruby_lsp if you prefer it.

-- Format on save only for these filetypes; everything else is formatted
-- manually. HTML/ERB is only formatted under ~/src/designfiles/df.
local format_on_save_ft = { rust = true, go = true, ruby = true }
local df_dir = vim.fn.fnamemodify("~/src/designfiles/df", ":p")

require("conform").setup({
  format_on_save = function(bufnr)
    local ft = vim.bo[bufnr].filetype
    if not format_on_save_ft[ft] then
      if ft ~= "html" and ft ~= "eruby" then
        return
      end
      local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":p")
      if path:sub(1, #df_dir) ~= df_dir then
        return
      end
    end
    return { lsp_format = "fallback", timeout_ms = 3000 }
  end,
  formatters = {
    biome = {
      require_cwd = true,
    },
  },
  formatters_by_ft = {
    rust =  { "rustfmt", lsp_format = "fallback" },
    go =    { "goimports", "gofumpt" },
    -- Ruby formats via ruby-lsp (rubocop); no CLI formatter so conform
    -- falls back to the LSP when lsp_format = "fallback".
    ruby =  {},
    html =  { "htmlbeautifier", lsp_format = "fallback" },
    eruby = { "htmlbeautifier", lsp_format = "fallback" },


    json = { "biome-check", "biome", stop_after_first = true },
    css = { "biome-check", "biome", stop_after_first = true },
    javascript = { "biome-check", "biome", "prettierd", "prettier", stop_after_first = true },
    typescript = { "biome-check", "biome", stop_after_first = true },
  }
})
