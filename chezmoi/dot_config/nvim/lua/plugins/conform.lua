return {
	'stevearc/conform.nvim',
	event = 'BufWritePre',
	opts = {
		formatters_by_ft = {
			lua = { 'stylua' },
			python = { 'ruff_format', 'ruff_organize_imports' },
			julia = { 'runic' },
			sh = { 'shfmt' },
			bash = { 'shfmt' },
			toml = { 'taplo' },
			yaml = { 'yamlfmt' },
			markdown = { 'mdformat' },
		},
		default_format_opts = {
			lsp_format = 'fallback',
		},
		format_on_save = {
			timeout_ms = 500,
		},
	},
}
