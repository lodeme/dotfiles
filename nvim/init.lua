-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.o.scrolloff = 20
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

-- Auto command for C and header files
vim.api.nvim_create_autocmd('FileType', {
    pattern = {'c', 'h', 'cpp'},
    callback = function()
        vim.bo.tabstop = 4       -- Number of spaces a tab displays as
        vim.bo.shiftwidth = 4    -- Number of spaces to use for each step of indent
        vim.bo.expandtab = false -- Use actual tab characters
    end
})

