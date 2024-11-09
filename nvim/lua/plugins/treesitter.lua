return {
  -- nvim-treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    opts = {
      ensure_installed = { "lua", "python", "cpp", "javascript" }, -- Add languages you need
      highlight = {
        enable = false,           -- Enable syntax highlighting
        additional_vim_regex_highlighting = false, -- Disable additional regex-based highlighting
      },
      indent = {
        enable = true,           -- Enable indentation based on treesitter
      },
      incremental_selection = {
        enable = true,           -- Enable incremental selection
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,      -- Automatically jump forward to textobj
          keymaps = {
            ["af"] = "@function.outer", -- Select around a function
            ["if"] = "@function.inner", -- Select inside a function
            ["ac"] = "@class.outer",    -- Select around a class
            ["ic"] = "@class.inner",    -- Select inside a class
          },
        },
        move = {
          enable = true,
          set_jumps = true,      -- Sets jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
      },
    },
    config = function(_, opts)
      require'nvim-treesitter.configs'.setup(opts)
    end,
  }
}
