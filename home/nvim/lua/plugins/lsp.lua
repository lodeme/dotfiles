return {
  "neovim/nvim-lspconfig",
  opts = {
    -- Within the 'opts' table of your configuration
    setup = {
      -- Existing setup functions for other LSP servers...

      -- Custom setup function for dockerls
      dockerls = function(server, server_opts)
        -- Custom on_attach function to modify server capabilities for dockerls
        local general_on_attach = server_opts.on_attach
        server_opts.on_attach = function(client, bufnr)
          -- Call any previously defined general on_attach function
          if general_on_attach then
            general_on_attach(client, bufnr)
          end

          -- Disable semanticTokensProvider for dockerls
          client.server_capabilities.semanticTokensProvider = nil
        end

        -- Proceed with the default lspconfig setup unless explicitly skipped
        require("lspconfig")[server].setup(server_opts)
        return true -- Return true to indicate custom setup has been handled
      end,

      -- ["*"] = function(server, opts) end, -- Your existing fallback setup, if any
    },
  },
}
