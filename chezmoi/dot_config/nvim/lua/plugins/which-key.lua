return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	opts = {
		spec = {
			{ '<leader>l', group = 'LSP' },
			{ '<leader>g', group = 'Git' },
			{ '<leader>f', group = 'Find' },
			{ '<leader>d', group = 'Diagnostics' },
			{ '<leader>z', group = 'Folds' },
			{ '<leader>b', group = 'Buffer' },
			{ '<leader>w', group = 'Window' },
			{ '<leader>t', group = 'Toggle' },
			{ '<leader>r', group = 'Replace' },
			{ '<leader>u', group = 'Undotree' },
		},
	},
	keys = {
		{
			'<leader>?',
			function() require('which-key').show({ global = false }) end,
			desc = 'Buffer local keymaps',
		},
	},
}
