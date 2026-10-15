return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
          layout = { layout = { width = 28, min_width = 28 } },
        },
        files = { hidden = true },
      },
    },
  },
}
