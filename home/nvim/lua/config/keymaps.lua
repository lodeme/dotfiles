-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>qq", "<cmd>wa<cr><cmd>qa<cr>", { desc = "Save and Quit All" })
vim.keymap.set("n", "<leader>qf", "<cmd>qa!<cr>", { desc = "Force Quit All" })

-- Lazy
vim.keymap.set("n", "<leader>X", "<cmd>LazyExtras<cr>", { desc = "LazyExtras"})
