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
  {
    "rcasia/neotest-java",
    ft = "java",
    dependencies = {
      "mfussenegger/nvim-jdtls",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
  },
  { "rose-pine/neovim", name = "rose-pine" },
  -- {
  --   -- https://w.amazon.com/bin/view/Barium/
  --   url = "ssh://git.amazon.com/pkg/NinjaHooks.git",
  --   branch = "mainline",
  --   config = function(self)
  --     local brazil_config = self.dir .. "/configuration/vim/amazon/brazil-config"
  --     vim.opt.runtimepath:append(brazil_config)
  --   end,
  -- },
}
