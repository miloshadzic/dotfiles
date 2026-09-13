require('telescope').setup {
  defaults = {
    preview = {
      treesitter = false
    }
  },
  extensions = {
    fzf_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

require('telescope').load_extension('fzf')
