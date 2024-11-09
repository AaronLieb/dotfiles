-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        shiftwidth = 2,
        tabstop = 2,
        foldlevel = 99,
        foldlevelstart = 99,
        foldenable = true,
        startofline = true,
        clipboard = '',
        whichwrap = "<,>,[,]",
        cmdheight = 0
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- visual mode
      v = {
        W = { "w", noremap = true },
        iW = { "iw", noremap = true },
        ["<C-u>"] = { function() require'cinnamon'.scroll("<C-u>") end, desc = "Smooth scroll up"},
        ["<C-d>"] = { function() require'cinnamon'.scroll("<C-d>") end, desc = "Smooth scroll down" },
        ["<Leader>y"] = { "\"+y", desc = "Copy to system buffer" },
      },
      -- normal mode
      n = {
        ["<C-o>"] = { function() require'bufjump'.backward_same_buf() end, desc = "Jump back in buffer" },
        ["<C-i>"] = { function() require'bufjump'.forward_same_buf() end, desc = "Jump forward in buffer" },
        -- replace this shit with neoscroll
        -- ["<C-u>"] = { function() require'cinnamon'.scroll("<C-u>") end, desc = "Smooth scroll up"},
        -- ["<C-d>"] = { function() require'cinnamon'.scroll("<C-d>") end, desc = "Smooth scroll down" },
        ["zz"] = { function() require'cinnamon'.scroll("zz") end, desc = "Center viewport on cursor"},
        W = { "w", noremap = true },
        cW = { "cw", noremap = true },
        caW = { "caw", noremap = true },
        ciW = { "ciw", noremap = true },
        E = { "e", noremap = true },
        cE = { "ce", noremap = true },
        caE = { "cae", noremap = true },
        ciE = { "cie", noremap = true },
        dj = { "J", noremap = true, desc = "Squash lines"},
        J = { function() require"astrocore.buffer".nav(-vim.v.count1) end, desc = "Previous buffer" },
        K = { function() require"astrocore.buffer".nav(vim.v.count1) end, desc = "Next buffer" },
        ["<Leader>h"] = { "<cmd>noh<cr>", desc = "No Highlight" },
        ["<Leader>b"] = { desc = "Buffers" },
        gb = { "<cmd>GBrowse<cr>", desc = "Go to code in browser" },
        -- disable some stupid default astronvim keybinds
        gbc = false,
        grr = false,
        gra = false,
        grn = false,
      },
    },
  },
}
