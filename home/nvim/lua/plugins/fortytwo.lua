return {
  {
    "Diogo-ss/42-header.nvim",
    lazy = false,
    config = function()
      local header = require("42header")
      header.setup({
        default_map = true, -- default Mapping <F1> in normal mode
        auto_update = false, -- update header when saving
        user = "lodemetz", -- your user
        mail = "lodemetz@student.42.fr", -- your mail
      })
    end,
  },
  {
    "hardyrafael17/norminette42.nvim",
    config = function()
      local norminette = require("norminette")
      norminette.setup({
        runOnSave = true,
        maxErrorsToShow = 5,
        active = true,
      })
    end,
  },
}
