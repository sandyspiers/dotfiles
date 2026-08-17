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
  config = function(_, opts)
    require("origami").setup(opts)
    -- override origami's `l` keymap to open folds recursively (zO instead of zo)
    vim.keymap.set("n", "l", function()
      local count = vim.v.count1
      for _ = 1, count do
        local isOnFold = vim.fn.foldclosed(".") > -1
        local action = isOnFold and "zO" or "l"
        pcall(function() vim.cmd.normal({ action, bang = true }) end)
      end
    end, { desc = "Origami l (recursive open)" })
  end,
}
