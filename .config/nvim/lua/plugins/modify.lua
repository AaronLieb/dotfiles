-- MERGE w/ DEFAULTS : Set opts to a table
-- OVERWRITE DEFAULTS: Set opts to a function that returns a table
-- PARTIAL OVERWRITE : Set opts to a function that doesn't return
-- Docs: https://lazy.folke.io/spec

return {
  { -- LSP keymaps
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- local lspconfig = require("lspconfig")
      -- local configs = require("lspconfig.configs")
      -- vim.filetype.add({
      --   filename = {
      --     ["Config"] = function()
      --       vim.b.brazil_package_Config = 1
      --       return "brazil-config"
      --     end,
      --   },
      -- })
      -- if not configs.barium then
      --   configs.barium = {
      --     default_config = {
      --       cmd = { "barium" },
      --       filetypes = { "brazil-config" },
      --       root_dir = function()
      --         lspconfig.util.root_pattern("Config")
      --       end,
      --       settings = {},
      --     },
      --   }
      -- end
      -- lspconfig.barium.setup({})
      opts.inlay_hints = { enabled = false }
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = {
        "<S-space>",
        function()
          vim.lsp.buf.hover()
        end,
      }
    end,
  },
  { -- cmp keymaps
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap = {
        preset = "super-tab",
      }
    end,
  },
  { -- auto-discover projects
    "ahmedkhalf/project.nvim",
    requires = { "neovim/nvim-lspconfig" },
    opts = {
      manual_mode = false,
      patterns = { ".git" },
      detection_methods = { "lsp", "pattern" },
    },
  },
}
