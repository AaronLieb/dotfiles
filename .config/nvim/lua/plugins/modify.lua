-- MERGE w/ DEFAULTS : Set opts to a table
-- OVERWRITE DEFAULTS: Set opts to a function that returns a table
-- PARTIAL OVERWRITE : Set opts to a function that doesn't return
-- Docs: https://lazy.folke.io/spec

local lint_progress = function()
  local linters = require("lint").get_running()
  if #linters == 0 then
    return "󰦕"
  end
  return "󱉶 " .. table.concat(linters, ", ")
end

return {
  { -- LSP keymaps
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig.configs")
      vim.filetype.add({
        filename = {
          ["Config"] = function()
            vim.b.brazil_package_Config = 1
            return "brazil-config"
          end,
        },
      })
      if not configs.barium then
        configs.barium = {
          default_config = {
            cmd = { "barium" },
            filetypes = { "brazil-config" },
            root_dir = function(fname)
              return vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
            end,
            settings = {},
          },
        }
      end
      lspconfig.barium.setup({})

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
  { -- linting
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        checkstyle = {
          config_file = "/Users/aarolieb/Code/Fargate/TaskRetirementManager/src/FargateTaskRetirementManager/build/private/tmp/brazil-path/[FargateCheckstyleBuildLogic-1.0]pkg.runtimefarm/checkstyle/checkstyle_rules.xml",
        },
      },
      -- linters_by_ft = {
      --   java = { "checkstyle" },
      -- },
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
      scroll = {
        enabled = false,
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
}
