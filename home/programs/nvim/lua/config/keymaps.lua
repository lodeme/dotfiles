-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>qq", "<cmd>wa<cr><cmd>qa<cr>", { desc = "Save and Quit All" })
vim.keymap.set("n", "<leader>qf", "<cmd>qa!<cr>", { desc = "Force Quit All" })

-- file browser
vim.keymap.set(
  "n",
  "<leader>fe",
  "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
  { desc = "File Explorer" }
)
vim.keymap.set("n", "<space>fE", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", {desc = "File Explorer (buf cwd)"})

-- Lazy
vim.keymap.set("n", "<leader>X", "<cmd>LazyExtras<cr>", { desc = "LazyExtras"})
