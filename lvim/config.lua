-- vim options
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.colorcolumn = '81'
vim.opt.clipboard = 'unnamed'

vim.cmd [[ autocmd BufEnter * :set autochdir ]]

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*",
  timeout = 1000,
}

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = ","

-- NORMAL Mode Keybindings
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
lvim.keys.normal_mode["|"] = ":vsplit<cr>"
lvim.keys.normal_mode["-"] = ":split<cr>"
lvim.keys.normal_mode["s"] = ":HopChar1<cr>"
lvim.keys.normal_mode["qu"] = "<Cmd>:UndotreeToggle<cr>:UndotreeFocus<cr>"
lvim.keys.normal_mode["<C-h>"] = "<Cmd>:SymbolsOutline<cr>"
lvim.keys.normal_mode["<C-k>"] = "<Cmd>:NvimTreeFocus<cr>"
lvim.keys.normal_mode["W"] = { "w", { noremap = true } }
lvim.keys.normal_mode["cW"] = { "cw", { noremap = true } }
lvim.keys.normal_mode["caW"] = { "caw", { noremap = true } }
lvim.keys.normal_mode["ciW"] = { "ciw", { noremap = true } }
lvim.keys.normal_mode["E"] = { "e", { noremap = true } }
lvim.keys.normal_mode["cE"] = { "ce", { noremap = true } }
lvim.keys.normal_mode["caE"] = { "cae", { noremap = true } }
lvim.keys.normal_mode["ciE"] = { "cie", { noremap = true } }

-- OTHER Mode Keybindings
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
lvim.builtin.which_key.mappings['q'] = {}


-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  { "folke/trouble.nvim",                cmd = "TroubleToggle", },
  { "lunarvim/colorschemes" },
  { "rebelot/kanagawa.nvim",             commit = "de7fb5f" },
  { "psliwka/vim-smoothie" },
  { "phaazon/hop.nvim" },
  { "junegunn/vim-peekaboo" },
  { "kylechui/nvim-surround" },
  { "mbbill/undotree" },
  { "jesseduffield/lazygit" },
  { "simrat39/symbols-outline.nvim" },
  { "ray-x/lsp_signature.nvim" },
  { "tyru/capture.vim" },
  { "mattn/emmet-vim" },
  { "brenoprata10/nvim-highlight-colors" },
  { "chaoren/vim-wordmotion" },
  { "MunifTanjim/nui.nvim" },
  { "jackMort/ChatGPT.nvim" },
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


-- place this in one of your configuration file(s)
require('hop').setup()
require('nvim-surround').setup()
require("symbols-outline").setup()
require('nvim-highlight-colors').setup()
require('lsp_signature').setup({
  bind = true,
  handler_opts = {
    border = "rounded"
  },
  hint_enable = false,
  toggle_key = "<C-k>",
  zindex = 9999999
})

require("chatgpt").setup({
  chat = {
    keymaps = {
      close = { "<C-c>", "<C-q>" }
    }
  }
})

lvim.keys.normal_mode["<leader><leader>g"] = "<Cmd>:ChatGPT<cr>"
lvim.keys.visual_mode["<leader><leader>e"] = "<Cmd>:ChatGPTEditWithInstructions<cr>"
lvim.keys.visual_mode["<leader><leader>a"] = "<Cmd>:ChatGPTRun code_readability_analysis<cr>"
lvim.keys.visual_mode["<leader><leader>s"] = "<Cmd>:ChatGPTRun summarize<cr>"
lvim.keys.visual_mode["<leader><leader>d"] = "<Cmd>:ChatGPTRun docstring<cr>"
lvim.keys.visual_mode["<leader><leader>t"] = "<Cmd>:ChatGPTRun add_tests<cr>"
lvim.keys.visual_mode["<leader><leader>x"] = "<Cmd>:ChatGPTRun explain_code<cr>"
lvim.keys.visual_mode["<leader><leader>f"] = "<Cmd>:ChatGPTRun fix_bugs<cr>"
lvim.keys.visual_mode["<leader><leader>c"] = "<Cmd>:ChatGPTRun complete_code<cr>"
lvim.keys.visual_mode["<leader><leader>o"] = "<Cmd>:ChatGPTRun optimize_code<cr>"
