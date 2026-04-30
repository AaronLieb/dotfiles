-- MERGE w/ DEFAULTS : Set opts to a table
-- OVERWRITE DEFAULTS: Set opts to a function that returns a table
-- PARTIAL OVERWRITE : Set opts to a function that doesn't return
-- Docs: https://lazy.folke.io/spec

return {
  { -- LSP keymaps
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      setup = {
        jdtls = function()
          return true
        end,
      },
      servers = {
        jdtls = {},
        ["*"] = {
          keys = {
            { "K", false },
            {
              "<S-space>",
              function()
                vim.lsp.buf.hover()
              end,
            },
          },
        },
      },
    },
  },
  { -- linting
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        brazil_checkstyle = {
          cmd = "brazil-build",
          stdin = false,
          stream = "stderr",
          append_fname = false,
          args = {
            "checkstyleFile",
            function()
              return "-PfilePath=" .. vim.fn.expand("%:p")
            end,
          },
          ignore_exitcode = true,
          parser = function(output, _, _)
            local diagnostics = {}
            for line in output:gmatch("[^\r\n]+") do
              local file, lnum, col, message = line:match("%[ant:checkstyle%] %[ERROR%] (.+):(%d+):(%d+): (.+)%.")
              if not file then
                file, lnum, message = line:match("%[ant:checkstyle%] %[ERROR%] (.+):(%d+): (.+)%.")
                col = "1"
              end
              if file and lnum then
                table.insert(diagnostics, {
                  lnum = tonumber(lnum) - 1,
                  col = tonumber(col) - 1,
                  severity = vim.diagnostic.severity.ERROR,
                  message = message,
                  source = "checkstyle",
                })
              end
            end
            return diagnostics
          end,
        },
      },
      linters_by_ft = {
        java = { "brazil_checkstyle" },
      },
    },
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
  {
    "folke/snacks.nvim",
    opts = {
      image = {
        setup = true,
      },
      scroll = {
        enabled = false,
      },
      statuscolumn = {
        enabled = true,
      },
      picker = {
        exclude = {
          ".git",
          "node_modules",
          "build",
          "*.class",
        },
      },
    },
    keys = {
      {
        "<leader>go",
        function()
          Snacks.gitbrowse()
        end,
        mode = { "n", "v" },
        desc = "Git Browse (open)",
      },
      {
        "<leader>gg",
        function()
          Snacks.lazygit()
        end,
        mode = { "n" },
        desc = "LazyGit (pwd)",
      },
      {
        "<leader>gG",
        function()
          Snacks.lazygit({ cwd = LazyVim.root.git() })
        end,
        mode = { "n" },
        desc = "LazyGit (root)",
      },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      local root_dir = require("jdtls.setup").find_root({ "packageInfo" }, "Config")

      local workspaces = {}
      if root_dir then
        local file = io.open(root_dir .. "/.bemol/ws_root_folders")
        if file then
          for line in file:lines() do
            table.insert(workspaces, "file://" .. line)
          end
          file:close()
        end
      end

      local cmd = vim.deepcopy(opts.cmd)

      opts.jdtls = {
        cmd = cmd,
        init_options = {
          workspaceFolders = workspaces,
        },
        root_dir = root_dir,
        vim.list_extend(cmd, {
          "-Xmx3g",
        }),
        dap_main = false,
        settings = {
          java = {
            completion = {
              enabled = true,
              importOrder = { "java", "javax", "org", "amazon", "com", "", "#" },
            },
            sources = {
              organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
              },
            },
            inlayHints = {
              parameterNames = {
                enabled = "all",
              },
            },
            import = {
              exclusions = {
                "**/node_modules/**",
                "**/.metadata/**",
                "**/archetype-resources/**",
                "**/META-INF/maven/**",
                "/**/test/**",
                "**/tooldirect.configfarm.rip/**",
              },
            },
            project = {
              resourceFilters = {
                ".git",
                "node_modules",
                "tooldirect.configfarm.rip",
              },
            },
            telemetry = {
              enabled = false,
            },
          },
        },
      }
    end,
  },
  {
    "nvim-neotest/neotest",
    enabled = false,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        group_empty_dirs = true,
      },
    },
  },
  {
    "nvim-mini/mini.surround",
    opts = {
      mappings = {
        add = "'a",
        delete = "'d",
        find = "'f",
        find_left = "'F",
        highlight = "'h",
        replace = "'r",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        {
          "'",
          group = "surround",
        },
        {
          "<leader>a",
          group = "Amazon",
          icon = { icon = " " },
        },
      },
    },
    config = function(_, opts)
      local marks = require("which-key.plugins.marks")
      marks.mappings = {
        icon = { icon = "󰸕 ", color = "orange" },
        plugin = "marks",
        { "`", desc = "marks" },
        { "gm", desc = "marks" },
        { "g`", desc = "marks" },
        { "g'", desc = "marks" },
      }
      require("which-key.config").add(marks.mappings)
      require("which-key").setup(opts)
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        html = { "prettier" },
        ruby = { "rubocop" },
      },
    },
  },
  {
    "https://codeberg.org/andyg/leap.nvim",
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
      vim.keymap.set("n", "s", function()
        require("leap").leap({ windows = { vim.api.nvim_get_current_win() } })
      end)
    end,
  },
}
