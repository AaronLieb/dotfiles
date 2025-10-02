return {
  {
    "chrisgrieser/nvim-spider",
    keys = {
      {
        "w",
        function()
          require("spider").motion("w")
        end,
        mode = { "n", "o", "x" },
      },
      {
        "e",
        function()
          require("spider").motion("e")
        end,
        mode = { "n", "o", "x" },
      },
      {
        "b",
        function()
          require("spider").motion("b")
        end,
        mode = { "n", "o", "x" },
      },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
  },
  -- {
  --   "rcasia/neotest-java",
  --   ft = "java",
  --   dependencies = {
  --     "mfussenegger/nvim-jdtls",
  --     "mfussenegger/nvim-dap",
  --     "rcarriga/nvim-dap-ui",
  --     "theHamsta/nvim-dap-virtual-text",
  --   },
  -- },
  { "rose-pine/neovim", name = "rose-pine" },
  -- Auto closes when there are too many tabs open
  -- {
  --   'axkirillov/hbac.nvim',
  --   config = true,
  -- },
  -- Peak lines lines when using `:<num>`
  {
    "nacro90/numb.nvim",
    config = function()
      require("numb").setup()
    end,
  },
  -- Lua
  {
    url = "ssh://git.amazon.com:2222/pkg/VimBrazilConfig",
    branch = "mainline",
    ft = "brazil-config",
  },
}
