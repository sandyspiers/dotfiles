local servers = {
	'lua_ls',
	'julials',
}

return {
	'neovim/nvim-lspconfig',
	config = function()
		vim.lsp.enable(servers)

		vim.api.nvim_create_autocmd('LspAttach', {
			callback = function(args)
				local map = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
				end

				map('n', 'K', function()
					vim.lsp.buf.hover({ border = 'rounded' })
				end, 'Hover')
				map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
				map('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
				map('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
				map('n', '<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
				map('n', '<leader>ca', vim.lsp.buf.code_action, 'Code action')
				map('n', '<leader>f', function()
					vim.lsp.buf.format({ async = true })
				end, 'Format')
			end,
		})
	end,
}
