-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("v", "Y", '"+y', { desc = "Copy selection to system clipboard" })
vim.keymap.set("n", "Y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "YY", '"+yy', { desc = "Copy line to system clipboard", noremap = true })

vim.keymap.set("n", "<space>", function()
  vim.lsp.buf.hover()
end, { desc = "Hover" })
vim.keymap.set("n", "J", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "K", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "dj", "J", { desc = "Join lines", noremap = true })

-- vim.keymap.set("n", "<leader>c", function()
--   Snacks.bufdelete()
-- end, { desc = "Close Buffer" })
