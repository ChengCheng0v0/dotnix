-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 启用持久化撤销
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.local/share/nvim/undo") -- 设置撤销文件保存的路径

-- 滚动时预留 10 行空白
vim.opt.scrolloff = 10
