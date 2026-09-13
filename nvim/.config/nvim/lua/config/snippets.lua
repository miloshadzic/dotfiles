local ls = require('luasnip')

ls.setup({
  -- Visual-select text and press <leader>x to cut it into $VISUAL / ${VISUAL}
  cut_selection_keys = '<leader>x',
})

-- Load honza/vim-snippets (SnipMate format)
require('luasnip.loaders.from_snipmate').lazy_load()
