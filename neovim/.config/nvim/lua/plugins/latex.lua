return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      tex = { "latexindent" },
    },
    formatters = {
      latexindent = {
        cwd = require("conform.util").root_file({
          "localSettings.yaml",
          "latexindent.yaml",
          ".localSettings.yaml",
          ".latexindent.yaml",
        }),
        prepend_args = { "-c=out/", "-m", "-l" },
      },
    },
  },
}
