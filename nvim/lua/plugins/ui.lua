return {
  -- command line
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require('lualine').setup({
        options = {
          theme = 'dracula'
        }
      })
    end
  },

  -- notification
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
      })
    end
  },

  -- indent
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = {
          char = "▏",
          highlight = "Comment",
        },
        scope = {
          highlight = {"label"},
          enabled = true,
          show_start = true,
          show_end = false,
        },
      })
    end,
  }
}
