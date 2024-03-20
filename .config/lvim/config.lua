-- hotkeys I always forget:
-- <leader>lj : next error
-- <leader>sk : search hotkeys
-- <leader>sr : search recent files
-- <leader>t : trouble
-- ysiw (surround)
-- cs (change surround)
-- ds (delete surround)
-- ,gg (lazygit)
-- TODO: Fix `gs` not working
-- Shift k - show signature

-- vim options
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.colorcolumn = '81'
vim.opt.clipboard = ''
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.startofline = true
vim.opt.whichwrap = "<,>,[,]"
-- vim.cmd [[ set showtabline=0 ]] -- disable tabs on top

-- Sets working directory to working dir instead of where `nvim` was ran
-- vim.cmd [[ autocmd BufEnter * :set autochdir ]]

-- lvim settings
-- lvim.builtin.bufferline.active = false -- disbale tabs on top
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.treesitter.auto_install = true
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = false,
  pattern = "*",
  timeout = 1000,
}

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = ","

-- NORMAL Mode Keybindings
lvim.keys.normal_mode["gi"] = {} -- conflict with "Goto Implementation"
lvim.keys.normal_mode["W"] = { "w", { noremap = true } }
lvim.keys.normal_mode["cW"] = { "cw", { noremap = true } }
lvim.keys.normal_mode["caW"] = { "caw", { noremap = true } }
lvim.keys.normal_mode["ciW"] = { "ciw", { noremap = true } }
lvim.keys.normal_mode["E"] = { "e", { noremap = true } }
lvim.keys.normal_mode["cE"] = { "ce", { noremap = true } }
lvim.keys.normal_mode["caE"] = { "cae", { noremap = true } }
lvim.keys.normal_mode["ciE"] = { "cie", { noremap = true } }
lvim.keys.normal_mode["|"] = { ":vsplit<CR>", desc = "Vertical Split" }
lvim.keys.normal_mode["-"] = { ":split<CR>", desc = "Horizontal Split" }
lvim.keys.normal_mode["s"] = { ":HopChar1<CR>", desc = "Hop to char" }
lvim.keys.normal_mode["gm"] = { "`", { noremap = true }, desc = "Goto mark" }
lvim.keys.normal_mode["gh"] = { ":bprevious<CR>", desc = "Goto prev buffer"}
lvim.keys.normal_mode["gl"] = { ":bnext<CR>", desc = "Goto next buffer" }
lvim.keys.normal_mode["g0"] = { ":BufferLineGoToBuffer 1<CR>", desc = "Goto first buffer" }
lvim.keys.normal_mode["dj"] = { "J", { noremap = true }, desc = "Squash lines"}
lvim.keys.normal_mode["J"] = { function() require'harpoon':list():prev() end, desc = "Harpoon prev" } -- Harpoon Keybinds
lvim.keys.normal_mode["K"] = { function() require'harpoon':list():next() end, desc = "Harpoon next" }
lvim.keys.normal_mode["g1"] = { function() require'harpoon':list():select(1) end, desc = "Harpoon 1" }
lvim.keys.normal_mode["g2"] = { function() require'harpoon':list():select(2) end, desc = "Harpoon 2" }
lvim.keys.normal_mode["g3"] = { function() require'harpoon':list():select(3) end, desc = "Harpoon 3" }
lvim.keys.normal_mode["g4"] = { function() require'harpoon':list():select(4) end, desc = "Harpoon 4" }
lvim.keys.normal_mode["g5"] = { function() require'harpoon':list():select(5) end, desc = "Harpoon 5" }
lvim.keys.normal_mode["g6"] = { function() require'harpoon':list():select(6) end, desc = "Harpoon 6" }
lvim.keys.normal_mode["g7"] = { function() require'harpoon':list():select(7) end, desc = "Harpoon 7" }
lvim.keys.normal_mode["zm"] = { function() require("ufo").closeAllFolds() end, desc = "Close All Folds" } -- nvimufo keybinds
lvim.keys.normal_mode["zM"] = { function() require("ufo").closeAllFolds() end, desc = "Close All Folds" }
lvim.keys.normal_mode["zk"] = { function() require("ufo").goPreviousClosedFold() end, desc = "Goto Prev Fold" }
lvim.keys.normal_mode["zj"] = { function() require("ufo").goNextClosedFold() end, desc = "Goto Next Fold" }
lvim.keys.normal_mode["zr"] = { function() require("ufo").openFoldsExceptKinds { "comment", "imports" } end, desc = "Open All Regular Folds" }
lvim.keys.normal_mode["zR"] = { function() require("ufo").openFoldsExceptKinds {} end, desc = "Open All Folds" }
lvim.keys.normal_mode["z1"] = { function() require("ufo").closeFoldsWith(1) end, desc = "Close L1 Folds" }
lvim.keys.normal_mode["z2"] = { function() require("ufo").closeFoldsWith(2) end, desc = "Close L2 Folds" }
lvim.keys.normal_mode["z3"] = { function() require("ufo").closeFoldsWith(3) end, desc = "Close L3 Folds" }
lvim.keys.normal_mode["z4"] = { function() require("ufo").closeFoldsWith(4) end, desc = "Close L4 Folds" }

-- VISUAL Mode Keybindings
lvim.keys.visual_mode["W"] = { "w", { noremap = true } }
lvim.keys.visual_mode["iW"] = { "iw", { noremap = true } }

-- <leader> whichkey Keybindings
lvim.builtin.which_key.mappings["q"] = {} -- remove "Quit"
lvim.builtin.which_key.mappings["w"] = {} -- remove "Save"
lvim.builtin.which_key.mappings["u"] = { ":UndotreeToggle<CR>:UndotreeFocus<CR>", "Undo Tree" }
lvim.builtin.which_key.mappings["t"] = { ":TroubleToggle<CR>", "Trouble diagnostics" }
lvim.builtin.which_key.mappings["n"] = { ":Noice<CR>", "Noice" }
lvim.builtin.which_key.mappings["ld"] = { ":Trouble document_diagnostics<CR>", "Document diagnostics" }
lvim.builtin.which_key.mappings["lw"] = { ":Trouble workspace_diagnostics<CR>", "Workspace diagnostics" }
lvim.builtin.which_key.mappings["a"] = { function() require'harpoon':list():append() end, "Harpoon Add File" }
lvim.builtin.which_key.mappings["m"] = { function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end, "Harpoon Menu" }

-- LSP Keybindings
lvim.lsp.buffer_mappings.normal_mode["K"] = nil
lvim.lsp.buffer_mappings.normal_mode["<S-Space>"] = { function() vim.lsp.buf.hover() end, "Show hover" }
lvim.lsp.buffer_mappings.normal_mode["gr"] = { ":Trouble lsp_references<CR>", "Goto References" }
lvim.lsp.buffer_mappings.normal_mode["gd"] = { ":Trouble lsp_definitions<CR>", "Goto Definition" }
lvim.lsp.buffer_mappings.normal_mode["gi"] = { ":Trouble lsp_implementations<CR>", "Goto Implementation" }
lvim.lsp.buffer_mappings.normal_mode["gI"] = nil -- changed to "gi"
lvim.lsp.buffer_mappings.normal_mode["gl"] = nil -- conflicts with :bnext

-- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  {
    "chrisgrieser/nvim-origami", -- open & close folds with l & h
    event = "BufReadPost",
    opts = { pauseFoldsOnSearch = false },
  },
  {
    "kevinhwang91/nvim-ufo", -- auto create folds
    dependencies = { "kevinhwang91/promise-async" },
  },
  {
    "folke/trouble.nvim", -- view errors and diagnostics in window
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "ThePrimeagen/harpoon", -- Project file navigation
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  { "rebelot/kanagawa.nvim", commit = "de7fb5f" }, -- Color theme
  { "declancm/cinnamon.nvim" },                    -- smooth scroll
  { "lunarvim/colorschemes" },                     -- lots of preset themes (,sp to view)
  { "phaazon/hop.nvim" },                          -- HopToChar (s)
  { "junegunn/vim-peekaboo" },                     -- Register preview (")
  { "kylechui/nvim-surround" },                    -- Change Surroundings (ysiw, ds, cs)
  { "mbbill/undotree" },                           -- Better undo history (gu)
  { "jesseduffield/lazygit" },                     -- Git TUI (,gg)
  { "axelf4/vim-strip-trailing-whitespace" },      -- remove trailing whitespace on modified lines
  { "mattn/emmet-vim" },                           -- emmet shortcuts (ex. html:5, body.main.div)
  { "brenoprata10/nvim-highlight-colors" },        -- Hex colors are rendered
  { "chaoren/vim-wordmotion" },                    -- "camelcase and snake case word motions"
  { "nacro90/numb.nvim" },                         -- Peek lines when using :#
  { "ahmedkhalf/project.nvim" },                   -- Set project root dir automatically
}

-- Change theme settings
lvim.colorscheme = "kanagawa"

-- Kanagawa theme settings
require('kanagawa').setup({
  undercurl = true, -- enable undercurls
  commentStyle = { italic = false },
  functionStyle = { bold = true },
  keywordStyle = { italic = false },
  statementStyle = { bold = true },
  typeStyle = {},
  variablebuiltinStyle = { italic = false },
  specialReturn = false, -- special highlight for the return keyword
})

-- Plugin setups
require('harpoon').setup()
require('hop').setup()
require('nvim-surround').setup()
require('nvim-highlight-colors').setup()
require('numb').setup()
require('cinnamon').setup()
require('ufo').setup({ -- use treesitter to determine fold levels
  provider_selector = function(_, _, _)
    return { 'treesitter' }
  end
})

-- CodeWhisperer Language Server (CWLS)
-- with customization AWSVectorConsolas-V3 (CodeWhisperer for CodeWhisperer)
if not require 'lspconfig.configs'.codewhisperer then
  require 'lspconfig.configs'.codewhisperer = {
    default_config = {
      cmd = { 'cwls' },
      root_dir = require 'lspconfig'.util.root_pattern("packageInfo", "package.json", "tsconfig.json", "jsconfig.json", ".git"),
      filetypes = { 'java', 'python', 'typescript', 'javascript', 'csharp', 'ruby', 'kotlin', 'shell', 'sql', 'c', 'cpp', 'go', 'rust' },
      autostart = true,
      single_file_support = true
    },
  }
end
require 'lspconfig'.codewhisperer.setup {}

