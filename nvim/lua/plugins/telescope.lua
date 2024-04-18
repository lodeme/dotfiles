return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      local fb_actions = require("telescope._extensions.file_browser.actions")
      local actions = require("telescope.actions")

      -- Load and configure the file browser extension
      require("telescope").setup({
        extensions = {
          file_browser = {
            mappings = {
              i = {
                ["<A-c>"] = fb_actions.create,
                ["<S-CR>"] = fb_actions.create_from_prompt,
                ["<A-r>"] = fb_actions.rename,
                ["<A-m>"] = fb_actions.move,
                ["<A-y>"] = fb_actions.copy,
                ["<A-d>"] = fb_actions.remove,
                ["<C-o>"] = fb_actions.open,
                ["<C-h>"] = fb_actions.goto_parent_dir,
                ["<C-e>"] = fb_actions.goto_home_dir,
                ["<C-w>"] = fb_actions.goto_cwd,
                ["<C-t>"] = fb_actions.change_cwd,
                ["<C-f>"] = fb_actions.toggle_browser,
                ["<C-H>"] = fb_actions.toggle_hidden,
                ["<C-a>"] = fb_actions.toggle_all,
                ["<bs>"] = fb_actions.backspace,
                ["C-l"] = actions.select_default,
              },
              n = {
                ["c"] = fb_actions.create,
                ["r"] = fb_actions.rename,
                ["m"] = fb_actions.move,
                ["y"] = fb_actions.copy,
                ["d"] = fb_actions.remove,
                ["o"] = fb_actions.open,
                ["h"] = fb_actions.goto_parent_dir,
                ["e"] = fb_actions.goto_home_dir,
                ["w"] = fb_actions.goto_cwd,
                ["t"] = fb_actions.change_cwd,
                ["f"] = fb_actions.toggle_browser,
                ["H"] = fb_actions.toggle_hidden,
                ["a"] = fb_actions.toggle_all,
                ["l"] = actions.select_default,
                ["ss"] = fb_actions.sort_by_size,
                ["sd"] = fb_actions.sort_by_date,
              },
            },
          },
        },
      })
      require("telescope").load_extension("file_browser")
    end,
  },
}
