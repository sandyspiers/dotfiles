return {
  "chrisgrieser/nvim-origami",
  event = "VeryLazy",
  init = function()
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
  end,
  opts = {
    useLspFoldsWithTreesitterFallback = { enabled = true },
    pauseFoldsOnSearch = true,
    foldtext = {
      enabled = true,
      gitsignsCount = true,
    },
    autoFold = {
      enabled = true,
      kinds = { "comment", "imports" },
    },
    foldKeymaps = { setup = true },
  },
}
