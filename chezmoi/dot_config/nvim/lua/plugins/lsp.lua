local servers = {
  "lua_ls",
  "julials",
  "pyright",
  "ruff",
  "texlab",
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
        map("<leader>lS", function()
          Snacks.picker.lsp_workspace_symbols()
        end, "Workspace symbols")
      end,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
          return
        end
        if client.name == "ruff" then
          -- Disable hover in favor of Pyright
          client.server_capabilities.hoverProvider = false
        end
      end,
      desc = "LSP: Disable hover capability from Ruff",
    })
  end,
}
