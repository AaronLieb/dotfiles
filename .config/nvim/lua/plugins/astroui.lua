-- Configuration documentation can be found with `:h astroui`

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    icons = {
      -- Remove the tabline "X" for closing files with the mouse
      BufferClose = "";
    },
  },
}
