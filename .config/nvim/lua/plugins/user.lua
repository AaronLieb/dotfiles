-- You can also add or configure plugins by creating files in this `plugins/` folder

---@type LazySpec
return {

  { -- disable better-escape
    "max397574/better-escape.nvim",
    enabled = false
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = function(_, opts)
      opts.defaults.path_display = { "smart" }
      opts.pickers = {
      lsp_references = {
          include_declaration = false,
          show_line = false
        }
      }
      return opts
    end
  },
  { -- customize alpha options
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "                                   ",
        "                                   ",
        "                                   ",
        "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
        "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
        "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
        "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
        "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
        "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
        "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
        " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
        " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
        "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
        "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
        "                                   ",
      }
      return opts
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  { -- open & close folds with l & h
    "chrisgrieser/nvim-origami",
    event = "BufReadPost",
    opts = {
      pauseFoldsOnSearch = false,
      filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
    },
  },
  { -- auto create folds,
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    opts = {
      provider_selector = function(_, _, _)
        return {'treesitter', 'indent'}
      end
    },
    keys = {
      { "zm" , function() require("ufo").closeAllFolds() end, desc = "Close All Folds" },
      { "zM" , function() require("ufo").closeAllFolds() end, desc = "Close All Folds" },
      { "zk" , function() require("ufo").goPreviousClosedFold() end, desc = "Goto Prev Fold" },
      { "zj" , function() require("ufo").goNextClosedFold() end, desc = "Goto Next Fold" },
      { "zr" , function() require("ufo").openFoldsExceptKinds { "comment", "imports" } end, desc = "Open All Regular Folds" },
      { "zR" , function() require("ufo").openFoldsExceptKinds {} end, desc = "Open All Folds" },
      { "z1" , function() require("ufo").closeFoldsWith(1) end, desc = "Close L1 Folds" },
      { "z2" , function() require("ufo").closeFoldsWith(2) end, desc = "Close L2 Folds" },
      { "z3" , function() require("ufo").closeFoldsWith(3) end, desc = "Close L3 Folds" },
      { "z4" , function() require("ufo").closeFoldsWith(4) end, desc = "Close L4 Folds" }
    },
  },
  { -- smooth scroll
    "declancm/cinnamon.nvim",
    config = true
  },
  { -- HopToChar (s)
    "phaazon/hop.nvim",
    -- config = function() require'hop'.setup() end,
    keys = {
      { "s", "<cmd>HopChar1<cr>", desc = "Hop to char" }
    },
    config = true
  },
  { -- Register preview (")
    "junegunn/vim-peekaboo",
    event = "VeryLazy"
  },
  { -- Change Surroundings (ysiw, ds, cs)
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = true
  },
  { -- Better undo history (gu)
    "mbbill/undotree",
    keys = { "gu", "<cmd>UndotreeToggle<cr>", desc = "UndoTree"}
  },
  { -- Git TUI (,gg)
    "jesseduffield/lazygit",
    cmd = {
      "LazyGit",
    	"LazyGitConfig",
    	"LazyGitCurrentFile",
    	"LazyGitFilter",
    	"LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
       { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  { -- emmet shortcuts (ex. html:5, body.main.div)
    "mattn/emmet-vim",
    ft = "html"
  },
  { -- "camelcase and snake case word motions"
    "chaoren/vim-wordmotion",
    event = "BufEnter",
    keys = {
      { "W", "w", { noremap = true } },
      { "cW", "cw", { noremap = true } },
      { "caW", "caw", { noremap = true } },
      { "ciW", "ciw", { noremap = true } },
      { "E", "e", { noremap = true } },
      { "cE", "ce", { noremap = true } },
      { "caE", "cae", { noremap = true } },
      { "ciE", "cie", { noremap = true } },
      { "W", "w", mode = "v", { noremap = true } },
      { "iW", "iw", mode = "v", { noremap = true } }
    }
  },
  { -- peeks lines when using ":"
    "nacro90/numb.nvim",
    config = true
  },
  { -- Auto close buffers that didn't get edited
    'axkirillov/hbac.nvim',
    event = "BufEnter",
    keys = {
      { "<Leader>a", "<cmd>Hbac toggle_pin<cr>", desc = "Toggle pin a buffer" },
    },
    opts = {
      autoclose = true,
      threshold = 2,
    }
  }
}
