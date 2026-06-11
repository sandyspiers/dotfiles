return {
  -- dracula theme
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme dracula]])
      vim.opt.guicursor = "n-c:block-Cursor,i-ci:ver25-CursorInsert,v-ve:block-CursorVisual"
      vim.api.nvim_set_hl(0, "Cursor", { fg = "#282A36", bg = "#FF79C6" })
      vim.api.nvim_set_hl(0, "CursorInsert", { fg = "#282A36", bg = "#BD93F9" })
      vim.api.nvim_set_hl(0, "CursorVisual", { fg = "#282A36", bg = "#50FA7B" })
    end,
  },

  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "dracula-nvim",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "lsp_status" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
}
