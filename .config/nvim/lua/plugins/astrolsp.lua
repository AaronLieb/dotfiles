-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`

--@type LazySpec
return
  {
    "AstroNvim/astrolsp",
    --@param opts AstroLSPOpts
    opts = function(_, opts)
      table.insert(opts.servers or {}, "codewhisperer")

      -- Change formatting options
      -- https://docs.astronvim.com/recipes/advanced_lsp/#configure-other-formatting-options

      opts.config = require'astrocore'.extend_tbl(opts.config or {}, {
        codewhisperer = {
          -- cmd = { 'cwls', '-c', 'arn:aws:codewhisperer:us-east-1:724904587780:customization/Y7QCNHGNQUXK' },
          cmd = { 'cwls' },
          root_dir = require 'lspconfig.util'.root_pattern("packageInfo", "package.json", "tsconfig.json", "jsconfig.json", ".git"),
          filetypes = { 'java', 'python', 'typescript', 'javascript', 'csharp', 'ruby', 'kotlin', 'shell', 'sql', 'c', 'cpp', 'go', 'rust' },
          autostart = true,
          single_file_support = true
        },
      })
      opts.mappings = require'astrocore'.extend_tbl(opts.mappings, {
        n = {
          K = false,
          gr = {
            function()
              require'telescope.builtin'.lsp_references()
            end,
            desc = "Go to references",
          },
          gd = {
            function()
              require'telescope.builtin'.lsp_definitions()
            end,
            desc = "Go to definition",
          },
          gI = {
            function()
              require'telescope.builtin'.lsp_implementations()
            end,
            desc = "Go to implementations",
          },
          ["<S-Space>"] = {
            function()
              vim.lsp.buf.hover()
            end,
            desc = "Hover symbol details",
          },
        }
      })
    end,
  }
