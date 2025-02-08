-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")

local map = vim.api.nvim_set_keymap

--------------------

-- 普通模式下按 ( 移动光标至(软)行首
map("n", "(", "^", { noremap = true, silent = true })
-- 普通模式下按 ) 移动光标至行尾
map("n", ")", "$", { noremap = true, silent = true })

-- Kitty 交互相关的键绑定
if os.getenv("TERM") == "xterm-kitty" then
  vim.g.kitty_navigator_no_mappings = 1
  vim.g.tmux_navigator_no_mappings = 1

  vim.cmd([[
    noremap <silent> <c-h> :<C-U>KittyNavigateLeft<cr>
    noremap <silent> <c-l> :<C-U>KittyNavigateRight<cr>
    noremap <silent> <c-j> :<C-U>KittyNavigateDown<cr>
    noremap <silent> <c-k> :<C-U>KittyNavigateUp<cr>
  ]])
end
