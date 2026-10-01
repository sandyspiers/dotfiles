return {
  -- LSP servers and formatters come from system packages (setup/packages/*.txt)
  -- and Julia apps (setup/julia.sh), so mason is not used
  { "mason-org/mason.nvim", enabled = false },
  { "mason-org/mason-lspconfig.nvim", enabled = false },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        julials = { cmd = { "jetls", "serve" } },
        texlab = {
          settings = {
            texlab = {
              chktex = { onOpenAndSave = true, onEdit = false },
            },
          },
        },
      },
    },
  },
}
