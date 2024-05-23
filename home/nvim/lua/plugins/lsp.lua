return {
  "neovim/nvim-lspconfig",
  config = function()
    local nvim_lsp = require("lspconfig")

    -- Function to attach LSP to the buffer
    local on_attach = function(client, bufnr)
      local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
      end
      buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
      -- Add more buffer-local keybindings if needed
    end

    -- Configure the lua-language-server
    nvim_lsp.lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
            path = vim.split(package.path, ";"),
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })
  end,
}
