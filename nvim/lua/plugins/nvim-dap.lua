return {
  -- nvim-dap
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      vim.fn.sign_define('DapBreakpoint', {text=' ', texthl='DapBreakpoint', linehl='', numhl=''})
      vim.fn.sign_define('DapStopped', {text='󰁕', texthl='DapStopped', linehl='DebugLineHL', numhl=''})
      vim.fn.sign_define('DapBreakpointCondition', {text=' ', texthl='DapBreakpoint', linehl='', numhl=''})
      vim.fn.sign_define('DapBreakpointRejected', {text=' ', texthl='DapBreakpoint', linehl='', numhl=''})
      dap.adapters.lldb = {
        type = "executable",
        command = "/opt/homebrew/opt/llvm/bin/lldb-dap",
        name = "lldb",
      }
      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }
    end
  },

  -- nvim-dap-ui
  {
    "rcarriga/nvim-dap-ui",
    dependencies =
    { "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text"
    },
    opts = {
      layouts = {
        {
          elements = {
            { id = "breakpoints", size = 0.2 },
            { id = "stacks", size = 0.2 },
            { id = "watches", size = 0.2 },
            { id = "scopes", size = 0.4 },
          },
          size = 50,
          position = "left",
        },
        {
          elements = {
            { id = "repl", size = 0.7 },
            { id = "console", size = 0.3 },
          },
          size = 15,
          position = "bottom",
        },
      },
      floating = {
        border = "rounded",  -- Change the border style: "single", "double", "rounded", "solid", "shadow"
        max_height = 0.9,
        max_width = 0.9,
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      windows = { indent = 1 },  -- Indentation of elements in the windows
      render = {
        max_type_length = nil,  -- Can set a maximum length for type strings
      },
      sections = {
        -- Change the title for each area (scopes, breakpoints, etc.)
        scopes = { border = { style = "single", title = "🔍 Scopes" } },
        breakpoints = { border = { style = "double", title = "⛔ Breakpoints" } },
        stacks = { border = { style = "rounded", title = "📚 Call Stack" } },
        watches = { border = { style = "solid", title = "👀 Watches" } },
        repl = { border = { style = "shadow", title = "💻 REPL" } },
      },
    },
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.set_log_level("TRACE")


      -- local present_virtual_text, dap_vt = pcall(require, "nvim-dap-virtual-text")
      -- dap_vt.setup({
      --   enabled = true,                        -- enable this plugin (the default)
      --   enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
      --   highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
      --   highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
      --   show_stop_reason = true,               -- show stop reason when stopped for exceptions
      --   commented = false,                     -- prefix virtual text with comment string
      --   only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
      --   all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
      --   filter_references_pattern = "<module", -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
      --   -- Experimental Features:
      --   virt_text_pos = "eol",                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
      --   all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
      --   virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
      --   virt_text_win_col = nil,               -- position the virtual text at a fixed window column (starting from the first text column) ,
      -- })
      -- vim.g.dap_virtual_text = true

      -- Automatically open UI
      dap.listeners.before.attach["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.launch["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  }
}
