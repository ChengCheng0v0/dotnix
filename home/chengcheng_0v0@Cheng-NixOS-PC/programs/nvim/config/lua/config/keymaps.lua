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
