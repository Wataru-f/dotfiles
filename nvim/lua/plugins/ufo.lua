return {
  { 'kevinhwang91/promise-async'},
  {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    opts = {
      foldcolumn = '1', -- Show foldcolumn
      foldlevel = 99,
      foldlevelstart = 99,
      foldenable = true,
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' } -- Prioritize treesitter, fall back to indent
      end,
    },
    config = function(_, opts)
      -- Apply folding options from opts
      vim.o.foldcolumn = opts.foldcolumn
      vim.o.foldlevel = opts.foldlevel
      vim.o.foldlevelstart = opts.foldlevelstart
      vim.o.foldenable = opts.foldenable

      -- Key mappings for opening and closing all folds
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

      -- Setup nvim-ufo with provided options
      require('ufo').setup(opts)
    end,
  }
}
