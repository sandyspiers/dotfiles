return {
  "lervag/vimtex",
  ft = { "tex", "latex", "cls", "tikz" },
  init = function()
    vim.g.vimtex_view_method = "zathura"
  end,
}
