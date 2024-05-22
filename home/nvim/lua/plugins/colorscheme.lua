local plugins = {
  "ellisonleao/gruvbox.nvim",
  "rebelot/kanagawa.nvim",
  "catppuccin/nvim",
  { "rose-pine/neovim", name = "rose-pine" },
}

table.insert(plugins, {
  "LazyVim/LazyVim",
  opts = {
    colorscheme = "catppuccin-macchiato",
  },
})

return plugins
