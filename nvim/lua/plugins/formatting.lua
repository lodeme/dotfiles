return {
  "stevearc/conform.nvim",
  formatters_by_ft = {
    lua = { "stylua" },
    fish = { "fish_indent" },
    sh = { "shfmt" },
    c = { "clangformat"},
    cpp = {"clangformat"},
  },
  formatters = {
    clangformat = {
      prepend_args = { "-style=Google" },
    },
  },
}
