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

---- color
vim.api.nvim_set_hl(0, "Comment", { ctermfg = "Grey", fg = "#a9a9a9" })  -- comment
vim.cmd([[highlight Statement ctermfg=208]])  -- orange
vim.cmd([[highlight Delimiter ctermfg=254]])  -- white
vim.cmd([[highlight Special ctermfg=254]])  -- white
vim.cmd([[highlight SpecialChar ctermfg=254]])  -- white
vim.cmd([[highlight Type ctermfg=254]])  -- white
vim.cmd([[highlight Operator ctermfg=87]])  -- blue
vim.cmd([[highlight MatchParen cterm=NONE ctermfg=87 ctermbg=237 guibg=NONE]])  -- blue

---- copy and paste
vim.api.nvim_set_option("clipboard","unnamed")
