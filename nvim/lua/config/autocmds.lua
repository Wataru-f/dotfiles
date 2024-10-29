-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

---- template
local template_dir = "~/.config/nvim/template/"
local function insert_template()
  local ext = vim.fn.expand("%:e")
  local template_file = template_dir .. "template." .. ext
  if vim.fn.filereadable(vim.fn.expand(template_file)) == 1 then
    vim.cmd("0r " .. template_file)
  end
end
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*",
  callback = insert_template,
})
vim.g.user_name = "Wataru Fukuda"
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*",
  callback = function()
    vim.cmd([[silent! %s/<+DATE+>/\=strftime('%b, %d, %Y %H:%M:%S')/g]])
    vim.cmd([[silent! %s/<+AUTHOR+>/\=g:user_name/g]])
    if vim.fn.search("<+CURSOR+>") ~= 0 then
      vim.cmd([[silent! execute 'normal! "_da>']])
    end
  end,
})
