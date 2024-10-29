---- set color scheme
-- vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("tokyonight")
-- vim.cmd.colorscheme("tafsm")
vim.opt.termguicolors = false
vim.cmd.colorscheme("molokai")

---- number config
vim.opt.relativenumber = true
vim.opt.number = true
vim.api.nvim_set_hl(0, "LineNrAbove", {fg = "grey"})
vim.api.nvim_set_hl(0, "LineNrBelow", {fg = "grey"})
vim.api.nvim_set_hl(0, "LineNr", {fg = "white", bold = true})
vim.opt.numberwidth = 4

---- tab
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

---- comment color
vim.api.nvim_set_hl(0, "Comment", { ctermfg = "Grey", fg = "#a9a9a9" })

---- copy and paste
vim.api.nvim_set_option("clipboard","unnamed")
