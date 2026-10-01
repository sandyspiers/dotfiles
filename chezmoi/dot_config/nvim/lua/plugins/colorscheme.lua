return {
  {
    "Mofiqul/dracula.nvim",
    opts = {
      -- cursor colour per mode (see guicursor in config/options.lua)
      overrides = function(c)
        return {
          Cursor = { fg = c.bg, bg = c.pink },
          CursorInsert = { fg = c.bg, bg = c.purple },
          CursorVisual = { fg = c.bg, bg = c.green },
        }
      end,
    },
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "dracula" } },
}
