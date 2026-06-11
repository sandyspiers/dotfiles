local servers = {
  "lua_ls",
  "julials",
  "pyright",
  "ruff",
}

return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable(servers)

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local map = function(lhs, rhs, desc)
          vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = desc })
        end

        map("K", function()
          vim.lsp.buf.hover({ border = "rounded" })
        end, "Hover")
        map("<leader>ld", vim.lsp.buf.definition, "Definition")
        map("<leader>lD", vim.lsp.buf.declaration, "Declaration")
        map("<leader>li", vim.lsp.buf.implementation, "Implementation")
        map("<leader>lR", vim.lsp.buf.references, "References")
        map("<leader>lr", vim.lsp.buf.rename, "Rename")
        map("<leader>la", vim.lsp.buf.code_action, "Code action")
        map("<leader>ls", function()
          Snacks.picker.lsp_symbols()
        end, "Symbols")
      end,
    })
  end,
}
