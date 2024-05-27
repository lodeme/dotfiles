-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.o.scrolloff = 10
vim.o.wrap = true
vim.o.shell = "fish"
vim.o.showtabline = 0
vim.opt.number = true
vim.opt.relativenumber = true

-- set clipboard provider
local function copy(lines, _)
  require("osc52").copy(table.concat(lines, "\n"))
end

local function paste()
  return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
end

vim.g.clipboard = {
  name = "osc52",
  copy = { ["+"] = copy, ["*"] = copy },
  paste = { ["+"] = paste, ["*"] = paste },
}

-- Now the '+' register will copy to system clipboard using OSC52
vim.keymap.set("n", "<leader>bc", '"+y')
vim.keymap.set("n", "<leader>by", '"+yy')
