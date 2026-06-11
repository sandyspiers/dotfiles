return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format" },
      julia = { "runic" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      toml = { "taplo" },
      yaml = { "yamlfmt" },
      markdown = { "mdformat" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = function(bufnr)
      if vim.bo[bufnr].filetype == "markdown" then
        return
      end
      return { timeout_ms = 500 }
    end,
  },
}
