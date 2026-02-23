-- https://w.amazon.com/bin/view/Barium#HNvim3E3D0.11.0
vim.lsp.config["barium"] = {
  cmd = { "barium" },
  root_markers = { "Config" },
  filetypes = { "brazil-config" },
  settings = {},
}

vim.lsp.enable("barium")
