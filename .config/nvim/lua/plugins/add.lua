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
  -- Adds various textobjs that can be deleted or cleared or jumped to
  --(check this every once in a while to remind yourself what there is)
  {
    "chrisgrieser/nvim-various-textobjs",
    event = "VeryLazy",
    opts = {
      keymaps = {
        useDefaults = true,
      },
    },
    keys = {
      {
        "ie",
        function()
          require("various-textobjs").subword("inner")
        end,
        mode = { "o", "x" },
      },
      {
        "iE",
        function()
          require("various-textobjs").subword("outer")
        end,
        mode = { "o", "x" },
      },
    },
  },
  -- Auto closes when there are too many tabs open
  {
    "axkirillov/hbac.nvim",
    event = "VeryLazy",
    config = true,
    opts = {
      threshold = 5,
    },
  },
  -- Peak lines lines when using `:<num>`
  {
    "nacro90/numb.nvim",
    event = "VeryLazy",
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
  {
    url = "ssh://git.amazon.com/pkg/Scat-nvim",
    branch = "mainline",
    opts = {
      cr = {
        user = "aarolieb",
      },
    },
    dependencies = { "sindrets/diffview.nvim" },
    keys = {
      {
        "<leader>a",
        group = true,
        name = "Amazon",
      },
      {
        "<leader>ap",
        function()
          require("scat.brazil").display_current_package_url()
        end,
        desc = "Display package URL",
        mode = { "n" },
      },
      {
        "<leader>ap",
        function()
          require("scat.brazil").display_package_under_cursor_url()
        end,
        desc = "Display package URL under cursor",
        mode = { "n" },
      },
      {
        "<leader>af",
        function()
          require("scat.brazil").display_current_file_url()
        end,
        desc = "Display current file url",
        mode = { "n", "x" },
      },
      {
        "<leader>aR",
        function()
          require("scat.cr").open_cr()
        end,
        desc = "Open new CR",
        mode = { "n" },
      },
      {
        "<leader>ar",
        function()
          require("scat.cr").open_cr()
        end,
        desc = "update existing CR",
        mode = { "n" },
      },
      {
        "<leader>ac",
        function()
          require("scat.brazil.utils").run_checkstyle()
        end,
        desc = "Run checkstyle",
        mode = { "n" },
      },
      {
        "<leader>am",
        function()
          require("scat.brazil").run_command_inside_current_package("mwinit")
        end,
        desc = "Midway init",
        mode = { "n" },
      },
      {
        "<leader>ab",
        function()
          require("scat.brazil").run_command_inside_current_package("bemol")
        end,
        desc = "Bemol",
        mode = { "n" },
      },
    },
  },
  {
    "rshkarin/mason-nvim-lint",
  },
  {
    "kwkarlwang/bufjump.nvim",
    keys = {
      {
        "<C-o>",
        function()
          require("bufjump").backward()
        end,
        desc = "Jump Back",
        mode = { "n" },
      },
      {
        "<C-i>",
        function()
          require("bufjump").forward()
        end,
        desc = "Jump Forward",
        mode = { "n" },
      },
      {
        "<C-p>",
        function()
          require("bufjump").backward_same_buf()
        end,
        desc = "Jump Back Same Buffer",
        mode = { "n" },
      },
      {
        "<C-u>",
        function()
          require("bufjump").forward_same_buf()
        end,
        desc = "Jump Forward Same Buffer",
        mode = { "n" },
      },
    },
  },
}
