return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      yaml = { "yamlfmt" },
      markdown = { "mdformat" }, -- not on save; see config/autocmds.lua
    },
  },
}
