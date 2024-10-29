-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   terminal_mode = "t",
--   command_mode = "c",

----  Normal Mode  ----------

----  Insert Mode  ----------
vim.keymap.set("i", "jj", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-b>", "<Left>", { noremap = true })
vim.keymap.set("i", "<C-f>", "<Right>", { noremap = true })
vim.keymap.set("i", "<C-n>", "<Down>", { noremap = true })
vim.keymap.set("i", "<C-p>", "<Up>", { noremap = true })

----  Visual Mode  ----------

----  Visual Block Mode  ----------

----  Terminal Mode  ----------

---- Command Mode  ----------

---- nvim-dap  ----------
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end, { desc = "Toggle Break Point"})
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)

---- nvim-dap  ----------
vim.keymap.set('n', '<leader>du', function() require("dapui").toggle() end, { desc = "Toggle Dap UI" })
vim.keymap.set('n', '<leader>de', function() require("dapui").eval() end, { desc = "Evaluate Expression" })
-- vim.keymap.set('n', '<Leader>df', function() require('dap.ui.widgets').centered_float(require('dap.ui.widgets').frames) end, { desc = "Show Stack Frames" }) -- alternative : <Leader>ds/dn 
vim.keymap.set('n', '<Leader>ds', function() require('dap.ui.widgets').centered_float(require('dap.ui.widgets').scopes) end, { desc = "Show Scopes in Selected Frame" })
vim.keymap.set('n', '<leader>sn', function() require("dap").up() end, { silent = true, noremap = true, desc = "Move Up in Stack" })
vim.keymap.set('n', '<leader>sp', function() require("dap").down() end, { silent = true, noremap = true, desc = "Move Down in Stack" })

-- vim.keymap.set({'n', 'v'}, '<Leader>dh', function() require('dap.ui.widgets').hover() end) -- dont know how to use effectively
-- vim.keymap.set({'n', 'v'}, '<Leader>dp', function() require('dap.ui.widgets').preview() end) -- dont know how to use effectively 

---- C++ compile
vim.api.nvim_set_keymap('n', '<F2>', ":w<CR>:rightbelow vsp | terminal g++ -g *.cpp -o main && ./main <CR>i", { noremap = true, silent = true })
