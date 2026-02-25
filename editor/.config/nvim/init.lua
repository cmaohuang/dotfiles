-- Basic settings
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"

-- 使用內建語法高亮（含 markdown）
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load all plugins from lua/plugins/*.lua
require("lazy").setup("plugins")

-- Colorscheme（使用內建主題）
vim.cmd("colorscheme koehler")

-- 快速切換主題（適合不同螢幕亮度）
vim.keymap.set("n", "<leader>tk", function()
  vim.cmd("colorscheme koehler")
  vim.notify("colorscheme: koehler")
end, { desc = "Theme: koehler" })

vim.keymap.set("n", "<leader>tw", function()
  vim.cmd("colorscheme wildcharm")
  vim.notify("colorscheme: wildcharm")
end, { desc = "Theme: wildcharm" })
