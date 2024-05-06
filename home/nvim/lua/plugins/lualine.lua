return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local icons = require("lazyvim.config").icons

    vim.o.laststatus = vim.g.lualine_laststatus

    return {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },

        lualine_c = {
          LazyVim.lualine.root_dir(),
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { LazyVim.lualine.pretty_path() },
        },
        lualine_x = {
          {
            function()
              local buf_clients = vim.lsp.get_active_clients()
              if next(buf_clients) == nil then
                return "None"
              else
                -- Concatenate all client names if there's more than one
                local client_names = {}
                for _, client in ipairs(buf_clients) do
                  table.insert(client_names, client.name)
                end
                return tostring(table.concat(client_names, ", "))
              end
            end,
            icon = "LSP:",
          },
          {
            function()
              local buf_clients = require("conform").list_formatters(0)
              if next(buf_clients) == nil then
                return "None"
              else
                -- Concatenate all client names if there's more than one
                local client_names = {}
                for _, client in ipairs(buf_clients) do
                  table.insert(client_names, client.name)
                end
                return tostring(table.concat(client_names, ", "))
              end
            end,
            icon = "FMT:",
          },
          {
            function()
              local linters = require("lint").get_running()
              if next(linters) == nil then
                return "None"
              else
                return table.concat(linters, ", ")
              end
            end,
            icon = "LNT:",
          },
          {
            function()
              local parser = vim.treesitter.get_parser()
              if next(parser) == nil then
                return "None"
              else
                return parser:lang()
              end
            end,
            icon = "TST:",
          },
       },
        -- lualine_x = {
        --   -- stylua: ignore
        --   {
        --     function() return require("noice").api.status.command.get() end,
        --     cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
        --     color = LazyVim.ui.fg("Statement"),
        --   },
        --   -- stylua: ignore
        --   {
        --     function() return require("noice").api.status.mode.get() end,
        --     cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
        --     color = LazyVim.ui.fg("Constant"),
        --   },
        --   -- stylua: ignore
        --   {
        --     function() return "  " .. require("dap").status() end,
        --     cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
        --     color = LazyVim.ui.fg("Debug"),
        --   },
        --   {
        --     require("lazy.status").updates,
        --     cond = require("lazy.status").has_updates,
        --     color = LazyVim.ui.fg("Special"),
        --   },
        --   {
        --     "diff",
        --     symbols = {
        --       added = icons.git.added,
        --       modified = icons.git.modified,
        --       removed = icons.git.removed,
        --     },
        --     source = function()
        --       local gitsigns = vim.b.gitsigns_status_dict
        --       if gitsigns then
        --         return {
        --           added = gitsigns.added,
        --           modified = gitsigns.changed,
        --           removed = gitsigns.removed,
        --         }
        --       end
        --     end,
        --   },
        -- },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return " " .. os.date("%R")
          end,
        },
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}
