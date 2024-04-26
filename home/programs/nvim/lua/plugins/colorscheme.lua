local plugins = {
  "ellisonleao/gruvbox.nvim",
  "rebelot/kanagawa.nvim",
  "catppuccin/nvim",
  { "rose-pine/neovim", name = "rose-pine" },
}

-- Check if the system is macOS
-- if vim.loop.os_uname().sysname == "Darwin" then
--   -- Add auto-dark-mode.nvim to the list of plugins with conditional configuration
--   table.insert(plugins, {
--     "f-person/auto-dark-mode.nvim",
--     config = function()
--       require("auto-dark-mode").setup({
--         update_interval = 1000,
--         set_dark_mode = function()
--           vim.api.nvim_set_option("background", "dark")
--           vim.cmd("colorscheme rose-pine-moon")
--         end,
--         set_light_mode = function()
--           vim.api.nvim_set_option("background", "light")
--           vim.cmd("colorscheme rose-pine-dawn")
--         end,
--       })
--       -- Activate auto-dark-mode
--       require("auto-dark-mode").init()
--     end,
--   })
-- else
table.insert(plugins, {
  "LazyVim/LazyVim",
  opts = {
    colorscheme = "rose-pine-moon",
  },
})
-- end

return plugins
