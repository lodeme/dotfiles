local function is_arm64()
  local handle = io.popen("uname -m")
  if handle then
    local result = handle:read("*a")
    handle:close()
    return result and result:find("aarch64") ~= nil
  end
  return false
end

local plugins = {
  {
    "ojroques/nvim-osc52",
    opts = {
      silent = false,
    },
  },
}

if is_arm64() then
  table.insert(plugins, 1, {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          mason = false,
        },
      },
    },
  })
end

return plugins
